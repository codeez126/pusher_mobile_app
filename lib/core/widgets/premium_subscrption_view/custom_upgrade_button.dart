import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/app_fonts_and_styles.dart';
class CustomUpgradeButton extends StatelessWidget {
  CustomUpgradeButton({
    super.key,
    required this.text,
    required this.image,
    required this.color,
    required this.onTap,


  });

  String text;
  String image;
  Color color;
  Function onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onTap();
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(image,height: 30.h,),
            Text(
                text,
                style: AppStyles.poppins14w700darkGrey2
            ),
          ],
        ),
      ),
    );
  }
}
