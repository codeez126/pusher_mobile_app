import 'package:base_project/core/Constants/app_colors.dart';
import 'package:base_project/core/constants/app_svgs.dart';
import 'package:base_project/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSearchField extends StatefulWidget {
  final String hintText;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final bool enabled;
  final Widget? suffixIcon;

  const CustomSearchField({
    Key? key,
    required this.hintText,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.onChanged,
    this.onSubmitted,
    this.enabled = true,
    this.suffixIcon,
  }) : super(key: key);

  @override
  State<CustomSearchField> createState() => _CustomSearchFieldState();
}

class _CustomSearchFieldState extends State<CustomSearchField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36.h,
      child: TextFormField(
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        validator: widget.validator,
        onChanged: widget.onChanged,
        onFieldSubmitted: widget.onSubmitted,
        enabled: widget.enabled,
        style: AppTextStyles.smallw600.copyWith(
          color: AppColors.hintColor,
          fontSize: 12.sp,
        ),
        decoration: InputDecoration(
          isDense: true,
          hintText: widget.hintText,
          hintStyle: AppTextStyles.small.copyWith(
            color: AppColors.hintColor,
            fontSize: 12.sp,
          ),
          filled: true,
          fillColor: Colors.white,
          prefixIcon: Padding(
            padding: EdgeInsets.only(left: 12.w, right: 8.w),
            child: SvgPicture.asset(
              AppSvgs.search,
              height: 16.h,
              width: 16.h,
              fit: BoxFit.contain,
            ),
          ),
          prefixIconConstraints: BoxConstraints(
            minHeight: 36.h,
            minWidth: 36.w,
          ),
          contentPadding: EdgeInsets.only(left: 0, top: 10.h, bottom: 10.h),
          suffixIcon: widget.suffixIcon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(color: AppColors.borderColor, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(color: AppColors.borderColor, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(
              color: AppColors.purpleBrightColor,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}
