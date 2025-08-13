import 'dart:ui';
import 'package:base_project/core/constants/app_svgs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../Constants/app_colors.dart';
import '../../constants/app_fonts_and_styles.dart';
import '../../constants/app_images.dart';
import 'animated_progress_bar.dart';

class CustomChallengeCompleteBox extends StatefulWidget {
  const CustomChallengeCompleteBox({
    super.key,
    this.progress = 0.33,
  });

  final double progress;

  @override
  State<CustomChallengeCompleteBox> createState() => _CustomChallengeCompleteBoxState();
}

class _CustomChallengeCompleteBoxState extends State<CustomChallengeCompleteBox>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticOut, // bounce effect
    );

    // Delay a bit before animating in
    Future.delayed(const Duration(milliseconds: 300), () {
      if (mounted) _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(50.sp),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 20.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.sp),
            border: Border.all(width: 1.5.w, color: AppColors.whiteColor),
            color: AppColors.whiteColor.withOpacity(0.10),
          ),
          child: Column(
            children: [
              30.verticalSpace,
              Text(
                'Daily Challenge Completed Today'.tr,
                textAlign: TextAlign.center,
                style: AppStyles.poppins16w600white,
              ),
              30.verticalSpace,
              ScaleTransition(
                scale: _scaleAnimation,
                child: SvgPicture.asset(
                  AppSvgs.doneSvg,
                  height:200.h,
                ),
              ),
              30.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: AnimatedProgressBar(
                  targetProgress: widget.progress,
                  backgroundColor: AppColors.whiteColor.withOpacity(0.25),
                  height: 30.h,
                  progressColor: AppColors.lightBlue,
                  borderColor: AppColors.whiteColor,
                ),
              ),
              30.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
