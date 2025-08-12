import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
class CustomFeatureItem extends StatelessWidget {
  CustomFeatureItem({super.key,
    required this.text,
    this.svgImage='',
    required this.textStyle,
    this.isSvgImage=false,
  });

  bool isSvgImage;
  String svgImage;
  String text;
  TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (isSvgImage) SvgPicture.asset(svgImage),
        if (isSvgImage) 12.horizontalSpace,
        Expanded(
          child: Text(
            text,
            softWrap: true,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: textStyle,
          ),
        ),
      ],
    );
  }
}
