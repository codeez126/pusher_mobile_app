import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../Constants/app_colors.dart';
import '../../constants/app_fonts_and_styles.dart';

class DateOfBirthDropDown extends StatelessWidget {
  DateOfBirthDropDown({super.key,
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

  bool boxClosed = true;

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
              padding: EdgeInsets.symmetric(
                vertical: 15.sp,
              ),
              decoration: BoxDecoration(
                color: AppColors.whiteColor.withOpacity(0.80),
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(10.sp),
                  bottom: isOpen
                      ? Radius.circular(0)
                      : (boxClosed
                      ? Radius.circular(10.sp)
                      : Radius.circular(0.sp)),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(selectedValue, style: AppStyles.poppins16w700darkGrey2),
                  Icon(isOpen ? Icons.arrow_drop_up : Icons.arrow_drop_down)
                ],
              ),
            ),
          ),
          ClipRRect(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(10.sp)),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 1300),
                curve: Curves.easeInOut,
                height: isOpen ? 150.h : 00,
                onEnd: () {
                  boxClosed = !isOpen;
                },
                //margin: EdgeInsets.only(top: 8.h),
                color: AppColors.whiteColor.withOpacity(0.8),
                child: SingleChildScrollView(
                  child: Column(
                    children: items.map((item) {
                      return InkWell(
                        onTap: () => onSelect(item),
                        child: Container(
                          width: double.infinity,
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
                          child: Text(
                            item,
                            style: AppStyles.poppins14w400darkGrey2,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              )

          ),
        ],
      ),
    );
  }
}

class DateOfBirthContainer extends StatefulWidget {
  DateOfBirthContainer({
    super.key,
    this.borderColor = AppColors.lightBlue,
  });

  Color borderColor;

  @override
  State<DateOfBirthContainer> createState() => _DateOfBirthContainerState();
}

class _DateOfBirthContainerState extends State<DateOfBirthContainer> {
  bool isDropdownOpen = false;

  String selectedDay = "01";

  bool isMonthDropdownOpen = false;

  String selectedMonth = "01";

  bool isYearDropdownOpen = false;

  String selectedYear = DateTime.now().year.toString();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15.sp),
      padding: EdgeInsets.symmetric(horizontal: 5.sp, vertical: 10.sp),
      decoration: BoxDecoration(
        border: Border.all(
          color: widget.borderColor,//AppColors.lightBlue,
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
            child: Text("Date Of Birth".tr, style: AppStyles.poppins14w700darkGrey2),
          ),
          10.verticalSpace,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: DateOfBirthDropDown(
                  label: "Days".tr,
                  selectedValue: selectedDay,
                  isOpen: isDropdownOpen,
                  onTap: () => setState(() {
                    isDropdownOpen = !isDropdownOpen;
                  }),
                  items: List.generate(31, (i) => (i + 1).toString().padLeft(2, '0')),
                  onSelect: (val) => setState(() {
                    selectedDay = val;
                    isDropdownOpen = false;
                    printDOB();
                  }),
                ),
              ),
              10.horizontalSpace,
              Expanded(
                child: DateOfBirthDropDown(
                  label: "Months".tr,
                  selectedValue: selectedMonth,
                  isOpen: isMonthDropdownOpen,
                  onTap: () => setState(() {
                    isMonthDropdownOpen = !isMonthDropdownOpen;
                  }),
                  items: List.generate(12, (i) => (i + 1).toString().padLeft(2, '0')),
                  onSelect: (val) => setState(() {
                    selectedMonth = val;
                    isMonthDropdownOpen = false;
                    printDOB();
                  }),
                ),
              ),
              10.horizontalSpace,
              Expanded(
                child: DateOfBirthDropDown(
                  label: "Years".tr,
                  selectedValue: selectedYear,
                  isOpen: isYearDropdownOpen,
                  onTap: () => setState(() {
                    isYearDropdownOpen = !isYearDropdownOpen;
                  }),
                  items: List.generate(
                    DateTime.now().year - 1900 + 1,
                        (i) => (DateTime.now().year - i).toString(),
                  ),
                  onSelect: (val) => setState(() {
                    selectedYear = val;
                    isYearDropdownOpen = false;
                    printDOB();
                  }),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  void printDOB() {
    String dob = "$selectedDay/$selectedMonth/$selectedYear";
    print("Selected Date of Birth: $dob");
  }

}
