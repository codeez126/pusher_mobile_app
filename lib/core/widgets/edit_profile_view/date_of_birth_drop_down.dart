import 'dart:math' as math;

import 'package:base_project/core/constants/app_svgs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../app/views/auth/controllers/profile_registration_controller.dart';
import '../../Constants/app_colors.dart';
import '../../constants/app_fonts_and_styles.dart';

class DateOfBirthDropDown extends StatelessWidget {
  const DateOfBirthDropDown({
    super.key,
    required this.label,
    required this.selectedValue,
    required this.isOpen,
    required this.onTap,
    required this.items,
    required this.onSelect,
  });

  final String label;
  final String selectedValue;
  final bool isOpen;
  final VoidCallback onTap;
  final List<String> items;
  final ValueChanged<String> onSelect;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.sp),
      decoration: BoxDecoration(
        color: AppColors.whiteColor.withOpacity(0.40),
        borderRadius: BorderRadius.circular(20.sp),
        border: Border.all(
          color: AppColors.whiteColor,
          width: 1.5.w,
        ),
      ),
      child: Column(
        children: [
          Text(label, style: AppStyles.poppins12w600darkGrey2),
          10.verticalSpace,
          GestureDetector(
            onTap: onTap,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 15.sp),
              decoration: BoxDecoration(
                color: AppColors.whiteColor.withOpacity(0.80),
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(10.sp),
                  bottom: isOpen ? Radius.circular(0) : Radius.circular(10.sp),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(selectedValue.isEmpty ? label : selectedValue,
                      style: AppStyles.poppins16w700darkGrey2),
                  isOpen?Transform.rotate(
                      angle: math.pi,
                      child: SvgPicture.asset(AppSvgs.arrowDownSvg)):SvgPicture.asset(AppSvgs.arrowDownSvg),
                ],
              ),
            ),
          ),
          ClipRRect(
            borderRadius:
            BorderRadius.vertical(bottom: Radius.circular(10.sp)),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              height: isOpen ? 150.h : 0,
              color: AppColors.whiteColor.withOpacity(0.8),
              child: SingleChildScrollView(
                child: Column(
                  children: items.map((item) {
                    return InkWell(
                      onTap: () => onSelect(item),
                      child: Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(
                            vertical: 8.h, horizontal: 12.w),
                        child: Text(item,
                            style: AppStyles.poppins14w400darkGrey2),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DateOfBirthContainer extends StatelessWidget {
  final ProfileRegistrationController controller;
  final Color borderColor;

  const DateOfBirthContainer({
    super.key,
    required this.controller,
    this.borderColor = AppColors.lightBlue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15.sp),
      padding: EdgeInsets.symmetric(horizontal: 5.sp, vertical: 10.sp),
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor,
          width: 1.w,
        ),
        color: AppColors.whiteColor.withOpacity(0.40),
        borderRadius: BorderRadius.circular(20.sp),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10.sp),
            child: Text("Date Of Birth".tr,
                style: AppStyles.poppins14w700darkGrey2),
          ),
          10.verticalSpace,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Obx(() => DateOfBirthDropDown(
                  label: "Days".tr,
                  selectedValue: controller.selectedDay.value,
                  isOpen: controller.isDayDropdownOpen.value,
                  onTap: () =>
                      controller.isDayDropdownOpen.toggle(),
                  items: List.generate(
                      31, (i) => (i + 1).toString().padLeft(2, '0')),
                  onSelect: (val) {
                    controller.selectedDay.value = val;
                    controller.isDayDropdownOpen.value = false;
                    controller.saveDOB();
                  },
                )),
              ),
              10.horizontalSpace,
              Expanded(
                child: Obx(() => DateOfBirthDropDown(
                  label: "Months".tr,
                  selectedValue: controller.selectedMonth.value,
                  isOpen: controller.isMonthDropdownOpen.value,
                  onTap: () =>
                      controller.isMonthDropdownOpen.toggle(),
                  items: List.generate(
                      12, (i) => (i + 1).toString().padLeft(2, '0')),
                  onSelect: (val) {
                    controller.selectedMonth.value = val;
                    controller.isMonthDropdownOpen.value = false;
                    controller.saveDOB();
                  },
                )),
              ),
              10.horizontalSpace,
              Expanded(
                child: Obx(() => DateOfBirthDropDown(
                  label: "Years".tr,
                  selectedValue: controller.selectedYear.value,
                  isOpen: controller.isYearDropdownOpen.value,
                  onTap: () =>
                      controller.isYearDropdownOpen.toggle(),
                  items: List.generate(
                    DateTime.now().year - 1900 + 1,
                        (i) => (DateTime.now().year - i).toString(),
                  ),
                  onSelect: (val) {
                    controller.selectedYear.value = val;
                    controller.isYearDropdownOpen.value = false;
                    controller.saveDOB();
                  },
                )),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void printDOB() {
    final dob =
        "${controller.selectedYear.value}-${controller.selectedMonth.value.padLeft(2, '0')}-${controller.selectedDay.value.padLeft(2, '0')}";
    print("Selected Date of Birth: $dob");
  }
}

