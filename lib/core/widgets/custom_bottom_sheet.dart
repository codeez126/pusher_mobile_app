import 'package:base_project/core/constants/app_fonts_and_styles.dart';
import 'package:flutter/material.dart';

class CustomBottomSheet {
  // Static method to show bottom sheet with custom content
  static Future<T?> show<T>({
    required BuildContext context,
    required Widget child,
    String? title,
    bool isDismissible = true,
    bool enableDrag = true,
    bool isScrollControlled = false,
    double? height,
    EdgeInsetsGeometry? padding,
    BorderRadius? borderRadius,
    Color? backgroundColor,
    bool showHandle = true,
    bool showCloseButton = false,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      isScrollControlled: isScrollControlled,
      backgroundColor: Colors.transparent,
      builder:
          (context) => ReusableBottomSheetContent(
            child: child,
            title: title,
            height: height,
            padding: padding,
            borderRadius: borderRadius,
            backgroundColor: backgroundColor,
            showHandle: showHandle,
            showCloseButton: showCloseButton,
          ),
    );
  }
}

class ReusableBottomSheetContent extends StatelessWidget {
  final Widget child;
  final String? title;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;
  final Color? backgroundColor;
  final bool showHandle;
  final bool showCloseButton;

  const ReusableBottomSheetContent({
    super.key,
    required this.child,
    this.title,
    this.height,
    this.padding,
    this.borderRadius,
    this.backgroundColor,
    this.showHandle = true,
    this.showCloseButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
        borderRadius:
            borderRadius ??
            const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Handle bar
          if (showHandle)
            Container(
              margin: const EdgeInsets.only(top: 8),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),

          // Header with title and close button
          if (title != null || showCloseButton)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (title != null)
                    Text(
                      title!,
                      style: AppStyles.poppins16w700white,
                    )
                  else
                    const SizedBox(),

                  if (showCloseButton)
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.close),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                ],
              ),
            ),

          // Divider if title exists
          if (title != null) Divider(height: 1, color: Colors.grey[300]),

          // Main content
          Flexible(
            child: Padding(
              padding: padding ?? const EdgeInsets.all(16),
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}

// Example usage widgets
class ExampleUsage extends StatelessWidget {
  const ExampleUsage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bottom Sheet Examples')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _showSimpleBottomSheet(context),
              child: const Text('Simple Bottom Sheet'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => _showFormBottomSheet(context),
              child: const Text('Form Bottom Sheet'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => _showListBottomSheet(context),
              child: const Text('List Bottom Sheet'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => _showCustomBottomSheet(context),
              child: const Text('Custom Styled Bottom Sheet'),
            ),
          ],
        ),
      ),
    );
  }

  void _showSimpleBottomSheet(BuildContext context) {
    CustomBottomSheet.show(
      context: context,
      title: 'Simple Bottom Sheet',
      showCloseButton: true,
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('This is a simple bottom sheet with just text content.'),
          SizedBox(height: 16),
          Text('You can add any widget here!'),
        ],
      ),
    );
  }

  void _showFormBottomSheet(BuildContext context) {
    CustomBottomSheet.show(
      context: context,
      title: 'Contact Form',
      isScrollControlled: true,
      height: MediaQuery.of(context).size.height * 0.7,
      child: Column(
        children: [
          const TextField(
            decoration: InputDecoration(
              labelText: 'Name',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          const TextField(
            decoration: InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          const TextField(
            decoration: InputDecoration(
              labelText: 'Message',
              border: OutlineInputBorder(),
            ),
            maxLines: 3,
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 48),
            ),
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }

  void _showListBottomSheet(BuildContext context) {
    final items = List.generate(20, (index) => 'Item ${index + 1}');

    CustomBottomSheet.show(
      context: context,
      title: 'Select an Item',
      height: 400,
      padding: EdgeInsets.zero,
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(child: Text('${index + 1}')),
            title: Text(items[index]),
            onTap: () {
              Navigator.pop(context, items[index]);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Selected: ${items[index]}')),
              );
            },
          );
        },
      ),
    );
  }

  void _showCustomBottomSheet(BuildContext context) {
    CustomBottomSheet.show(
      context: context,
      backgroundColor: Colors.blue[50],
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
      showHandle: false,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: const BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.star, color: Colors.white, size: 30),
          ),
          const SizedBox(height: 16),
          const Text(
            'Custom Styled',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'This bottom sheet has custom styling with different colors and border radius.',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Confirm'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
