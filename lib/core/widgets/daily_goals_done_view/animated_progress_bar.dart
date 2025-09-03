import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomProgressBar extends StatelessWidget {
  final double progress; // Value from 0.0 to 1.0
  final String? customText; // Optional custom text override
  final Color backgroundColor;
  final Color progressColor;
  final Color textColor;
  final Color borderColor;
  final double height;
  final double borderRadius;
  final bool showPercentage;

  const CustomProgressBar({
    Key? key,
    this.progress = 0.0,
    this.customText,
    this.backgroundColor = const Color(0xFF4A4A4A),
    this.progressColor = const Color(0xFF007AFF),
    this.textColor = Colors.white,
    this.borderColor = const Color(0xFF6A6A6A),
    this.height = 40.0,
    this.borderRadius = 20.0,
    this.showPercentage = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int percentage = (progress * 100).round();
    final String displayText = customText ??
        (showPercentage ? '$percentage%${'Done'.tr}' : 'Done'.tr);

    return LayoutBuilder(
      builder: (context, constraints) {
        final double maxWidth = constraints.maxWidth;

        return Container(
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            border: Border.all(
              color: borderColor,
              width: 1.5,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(borderRadius - 1.5),
            child: Stack(
              children: [
                // Background
                Container(
                  width: double.infinity,
                  height: height,
                  color: backgroundColor,
                ),
                // Progress fill
                if (progress > 0)
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: progress * maxWidth,
                      height: height,
                      decoration: BoxDecoration(
                        color: progressColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(borderRadius - 1.5),
                          bottomLeft: Radius.circular(borderRadius - 1.5),
                          topRight: progress >= 1.0
                              ? Radius.circular(borderRadius - 1.5)
                              : Radius.zero,
                          bottomRight: progress >= 1.0
                              ? Radius.circular(borderRadius - 1.5)
                              : Radius.zero,
                        ),
                      ),
                    ),
                  ),
                // Text overlay
                Center(
                  child: Text(
                    displayText,
                    style: TextStyle(
                      color: textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

}

// Animated version of the progress bar
class AnimatedProgressBar extends StatefulWidget {
  final double targetProgress;
  final Duration animationDuration;
  final String? customText;
  final Color backgroundColor;
  final Color progressColor;
  final Color textColor;
  final Color borderColor;
  final double height;
  final double borderRadius;
  final bool showPercentage;

  const AnimatedProgressBar({
    Key? key,
    required this.targetProgress,
    this.animationDuration = const Duration(milliseconds: 800),
    this.customText,
    this.backgroundColor = const Color(0xFF4A4A4A),
    this.progressColor = const Color(0xFF007AFF),
    this.textColor = Colors.white,
    this.borderColor = const Color(0xFF6A6A6A),
    this.height = 40.0,
    this.borderRadius = 20.0,
    this.showPercentage = true,
  }) : super(key: key);

  @override
  _AnimatedProgressBarState createState() => _AnimatedProgressBarState();
}

class _AnimatedProgressBarState extends State<AnimatedProgressBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _progressAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );

    _progressAnimation = Tween<double>(
      begin: 0.0,
      end: widget.targetProgress,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    _animationController.forward();
  }

  @override
  void didUpdateWidget(AnimatedProgressBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.targetProgress != widget.targetProgress) {
      _progressAnimation = Tween<double>(
        begin: _progressAnimation.value,
        end: widget.targetProgress,
      ).animate(CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ));
      _animationController.reset();
      _animationController.forward();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _progressAnimation,
      builder: (context, child) {
        return CustomProgressBar(
          progress: _progressAnimation.value,
          customText: widget.customText,
          backgroundColor: widget.backgroundColor,
          progressColor: widget.progressColor,
          textColor: widget.textColor,
          borderColor: widget.borderColor,
          height: widget.height,
          borderRadius: widget.borderRadius,
          showPercentage: widget.showPercentage,
        );
      },
    );
  }
}