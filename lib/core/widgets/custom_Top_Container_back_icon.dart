import 'package:base_project/core/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/app_colors.dart';
import '../constants/app_svgs.dart';

class CustomTopContainerBackIcon extends StatelessWidget {
  CustomTopContainerBackIcon({super.key,required this.onTap,required this.image});

  Function onTap;
  SvgPicture image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50.sp),bottomRight: Radius.circular(50.sp)),
        color: AppColors.whiteColor.withOpacity(0.40),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(left: 0,bottom: 0,child: InkWell(onTap: (){onTap();},child: Image.asset(AppImages.imageBackIcon,height: 120.h,))),
          Positioned(bottom: 35,child: SvgPicture.asset(AppSvgs.logo,height: 50.h,)),
        ],
      ),
    );
  }
}
