import 'package:base_project/core/Constants/app_colors.dart';
import 'package:base_project/core/margins%20and%20paddings/textfield_styles.dart';
import 'package:base_project/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController? controller;
  final bool isPassword;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final bool enabled;
  final bool filled;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int maxLines;
  final TextInputAction textInputAction;
  final String? label;

  final FocusNode? focusNode;
  final Color? fillColor;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final double? borderRadius;
  final EdgeInsetsGeometry? contentPadding;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;

  const CustomTextField({
    Key? key,
    required this.hintText,
    this.label,

    this.controller,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.onChanged,
    this.onSubmitted,
    this.enabled = true,
    this.filled = false,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLines = 1,
    this.textInputAction = TextInputAction.done,
    this.focusNode,
    this.fillColor,
    this.borderColor,
    this.focusedBorderColor,
    this.borderRadius,
    this.contentPadding,
    this.textStyle,
    this.hintStyle,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // The Text Field
        SizedBox(
          height: TextFieldStyles.fieldHeight,
          child: TextFormField(
            controller: widget.controller,
            obscureText: widget.isPassword ? _obscureText : false,
            keyboardType: widget.keyboardType,
            validator: widget.validator,
            onChanged: widget.onChanged,
            onFieldSubmitted: widget.onSubmitted,
            enabled: widget.enabled,
            maxLines: widget.maxLines,
            textInputAction: widget.textInputAction,
            focusNode: widget.focusNode,
            style:
            widget.textStyle ??
                AppTextStyles.smallw600.copyWith(
                  color: AppColors.hintColor,
                  fontSize: 12.sp,
                ),
            decoration: InputDecoration(
              label: Text(widget.label!),
              floatingLabelAlignment: FloatingLabelAlignment.start,
              floatingLabelBehavior: FloatingLabelBehavior.always,

              floatingLabelStyle: TextStyles.smallw600(context).copyWith(
                color: const Color(0xFF8C37F8), // Label color
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
              ),
              hintText: widget.hintText,
              hintStyle:
              widget.hintStyle ??
                  AppTextStyles.small.copyWith(
                    color: AppColors.hintColor,
                    fontSize: 12.sp,
                  ),
              filled: true,
              fillColor: Colors.white,
              contentPadding:
              widget.contentPadding ??
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              prefixIcon: widget.prefixIcon,
              suffixIcon:
              widget.isPassword
                  ? IconButton(
                icon: Icon(
                  _obscureText
                      ? Icons.visibility_off
                      : Icons.visibility,
                  color: Colors.grey[600],
                  size: 20,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
                  : widget.suffixIcon,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius ?? 8.r),
                borderSide: BorderSide(
                  color: widget.borderColor ?? AppColors.borderColor,
                  width: 1,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius ?? 8.r),
                borderSide: BorderSide(
                  color: widget.borderColor ?? AppColors.borderColor,
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius ?? 8.r),
                borderSide: BorderSide(
                  color:
                  widget.focusedBorderColor ?? AppColors.purpleBrightColor,
                  width: 2,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius ?? 8.r),
                borderSide: const BorderSide(color: Colors.red, width: 1),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius ?? 8.r),
                borderSide: const BorderSide(color: Colors.red, width: 2),
              ),
            ),
          ),
        ),

        // The Label (if exists)
        // if (widget.label != null)
        //   Positioned(
        //     left: 12.w,
        //     top: -10.h,
        //     child: Container(
        //       padding: EdgeInsets.symmetric(horizontal: 8.w),
        //       child: Text(
        //         widget.label!,
        //         style: TextStyles.smallw600(context).copyWith(
        //           fontSize: 14.sp,
        //           color: const Color(0xFF8C37F8), // Label color
        //           fontWeight: FontWeight.w600,
        //         ),
        //       ),
        //     ),
        //   ),
      ],
    );
  }
}
