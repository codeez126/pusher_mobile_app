import 'package:flutter/material.dart';

class CustomRoundButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final double? borderRadius;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? fontSize;
  final FontWeight? fontWeight;
  final IconData? icon;
  final double? iconSize;
  final Color? iconColor;
  final bool iconOnRight;
  final Color? borderColor;
  final double? borderWidth;
  final List<BoxShadow>? boxShadow;
  final Gradient? gradient;
  final bool isLoading;
  final Color? loadingColor;

  const CustomRoundButton({
    super.key,
    required this.text,
    this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.borderRadius,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.fontSize,
    this.fontWeight,
    this.icon,
    this.iconSize,
    this.iconColor,
    this.iconOnRight = false,
    this.borderColor,
    this.borderWidth,
    this.boxShadow,
    this.gradient,
    this.isLoading = false,
    this.loadingColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDisabled = onPressed == null && !isLoading;

    return Container(
      width: width,
      height: height ?? 48,
      margin: margin,
      decoration: BoxDecoration(
        gradient: gradient,
        color:
            gradient == null
                ? (isDisabled
                    ? Colors.grey[300]
                    : backgroundColor ?? theme.primaryColor)
                : null,
        borderRadius: BorderRadius.circular(borderRadius ?? 25),
        border:
            borderColor != null
                ? Border.all(color: borderColor!, width: borderWidth ?? 1)
                : null,
        boxShadow:
            boxShadow ??
            [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                offset: const Offset(0, 2),
                blurRadius: 4,
              ),
            ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: isLoading ? null : onPressed,
          borderRadius: BorderRadius.circular(borderRadius ?? 25),
          child: Container(
            padding:
                padding ??
                const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (isLoading)
                  SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        loadingColor ?? textColor ?? Colors.white,
                      ),
                    ),
                  )
                else ...[
                  if (icon != null && !iconOnRight) ...[
                    Icon(
                      icon,
                      size: iconSize ?? 20,
                      color: iconColor ?? textColor ?? Colors.white,
                    ),
                    const SizedBox(width: 8),
                  ],
                  Text(
                    text,
                    style: TextStyle(
                      color:
                          isDisabled
                              ? Colors.grey[600]
                              : textColor ?? Colors.white,
                      fontSize: fontSize ?? 16,
                      fontWeight: fontWeight ?? FontWeight.w600,
                    ),
                  ),
                  if (icon != null && iconOnRight) ...[
                    const SizedBox(width: 8),
                    Icon(
                      icon,
                      size: iconSize ?? 20,
                      color: iconColor ?? textColor ?? Colors.white,
                    ),
                  ],
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Example usage and different button styles
class CustomButtonExamples extends StatefulWidget {
  const CustomButtonExamples({super.key});

  @override
  State<CustomButtonExamples> createState() => _CustomButtonExamplesState();
}

class _CustomButtonExamplesState extends State<CustomButtonExamples> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Round Button Examples'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Basic Buttons',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // Basic button
            CustomRoundButton(
              text: 'Basic Button',
              onPressed: () => _showSnackBar('Basic button pressed'),
            ),
            const SizedBox(height: 12),

            // Button with custom colors
            CustomRoundButton(
              text: 'Custom Colors',
              backgroundColor: Colors.green,
              textColor: Colors.white,
              onPressed: () => _showSnackBar('Custom colors button pressed'),
            ),
            const SizedBox(height: 12),

            // Button with icon
            CustomRoundButton(
              text: 'With Icon',
              icon: Icons.star,
              backgroundColor: Colors.orange,
              onPressed: () => _showSnackBar('Icon button pressed'),
            ),
            const SizedBox(height: 12),

            // Button with icon on right
            CustomRoundButton(
              text: 'Icon Right',
              icon: Icons.arrow_forward,
              iconOnRight: true,
              backgroundColor: Colors.purple,
              onPressed: () => _showSnackBar('Right icon button pressed'),
            ),
            const SizedBox(height: 24),

            const Text(
              'Styled Buttons',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // Gradient button
            CustomRoundButton(
              text: 'Gradient Button',
              gradient: const LinearGradient(
                colors: [Colors.blue, Colors.purple],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              onPressed: () => _showSnackBar('Gradient button pressed'),
            ),
            const SizedBox(height: 12),

            // Outlined button
            CustomRoundButton(
              text: 'Outlined Button',
              backgroundColor: Colors.transparent,
              textColor: Colors.blue,
              borderColor: Colors.blue,
              borderWidth: 2,
              boxShadow: [],
              onPressed: () => _showSnackBar('Outlined button pressed'),
            ),
            const SizedBox(height: 12),

            // Custom radius button
            CustomRoundButton(
              text: 'Custom Radius',
              backgroundColor: Colors.red,
              borderRadius: 10,
              onPressed: () => _showSnackBar('Custom radius button pressed'),
            ),
            const SizedBox(height: 12),

            // Large button
            CustomRoundButton(
              text: 'Large Button',
              backgroundColor: Colors.teal,
              height: 60,
              fontSize: 18,
              onPressed: () => _showSnackBar('Large button pressed'),
            ),
            const SizedBox(height: 24),

            const Text(
              'State Buttons',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // Loading button
            CustomRoundButton(
              text: 'Loading Button',
              backgroundColor: Colors.indigo,
              isLoading: isLoading,
              onPressed: () => _simulateLoading(),
            ),
            const SizedBox(height: 12),

            // Disabled button
            const CustomRoundButton(text: 'Disabled Button', onPressed: null),
            const SizedBox(height: 24),

            const Text(
              'Size Variations',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // Small button
            CustomRoundButton(
              text: 'Small',
              backgroundColor: Colors.pink,
              height: 36,
              fontSize: 14,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              onPressed: () => _showSnackBar('Small button pressed'),
            ),
            const SizedBox(height: 12),

            // Medium button (default)
            CustomRoundButton(
              text: 'Medium',
              backgroundColor: Colors.amber,
              textColor: Colors.black,
              onPressed: () => _showSnackBar('Medium button pressed'),
            ),
            const SizedBox(height: 12),

            // Full width button
            CustomRoundButton(
              text: 'Full Width Button',
              backgroundColor: Colors.deepOrange,
              width: double.infinity,
              onPressed: () => _showSnackBar('Full width button pressed'),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  void _simulateLoading() {
    setState(() {
      isLoading = true;
    });

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
      _showSnackBar('Loading completed!');
    });
  }
}
