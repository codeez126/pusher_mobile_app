import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_colors.dart';
import '../constants/app_fonts_and_styles.dart';

class GenderSelectionContainerWidget extends StatelessWidget {
  GenderSelectionContainerWidget({super.key,required this.onTap,required this.selectedGender,this.icon=Icons.male,required this.genderName,this.isIcon=true});

  Function onTap;
  String selectedGender;
  IconData icon;
  bool isIcon;
  String genderName;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          onTap();
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 15),
          decoration: BoxDecoration(
            color: selectedGender == genderName
                ? Colors.white.withOpacity(0.3)
                : Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: AppColors.whiteColor,
              width: 1.2.w,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isIcon?Icon(
                icon,
                color: Colors.white,
                size: 20,
              ):SizedBox(),
              SizedBox(width: 8),
              Text(
                  genderName,
                  style: AppStyles.poppins14w700white
              ),
            ],
          ),
        ),
      ),
    );
  }
}
