import 'dart:ui';

import 'package:base_project/core/constants/app_fonts_and_styles.dart';
import 'package:base_project/core/widgets/custom_app_bar_term_of_use.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_images.dart';

class TermOfUseView extends StatelessWidget {
  const TermOfUseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.editProfileBackground),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomAppBarTermOfUse(tittle: "Terms Of Use"),
              20.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas orci ex, mattis sed tortor et, consequat tempus dolor. In neque mauris, eleifend sed feugiat vitae, egestas eget ligula. Vestibulum vitae mauris ultrices, euismod tortor vel, ullamcorper nunc. Morbi ultrices eros bibendum nunc pharetra interdum . In posuere augue nec ante maximus, a convallis odio vehicula. Sed in sollicitudin lectus. Aliquam erat purus, consectetur a sem faucibus, pharetra posuere lectus. Vivamus faucibus ipsum quis tellus consectetur, eget tempus est tempor. Donec cursus arcu et arcu congue, eu varius sem varius. Phasellus ac luctus purus. Nullam molestie \nfaucibus ipsum. \nDonec laoreet risus eu risus scelerisque, sed bibendum lorem porta. Suspendisse quam massa, commodo nec leo et, ornare rhoncus mauris. Nulla in mattis purus. Sed vel hendrerit nunc. Sed faucibus, mi vitae maximus elementum, felis tellus bibendum sapien, vel semper dolor purus vitae odio. Fusce ornare velit id purus gravida, id placerat ligula commodo. Fusce ipsum tortor, suscipit id euismod auctor, cursus sed felis. Maecenas velit leo, aliquam sed mauris id, semper rhoncus neque. Sed et orci risus. Quisque in lorem bibendum, finibus neque at, pretium metus. Cras dignissim purus justo. Proin viverra sem vitae lacus porta scelerisque. Mauris lobortis est arcu, ut porta nunc eleifend id. Suspendisse quis leo efficitur, scelerisque justo quis, tristique odio. Aliquam id nisl sit amet metus venenatis placerat sit amet eget nunc. Etiam ac consectetur metus, a lobortis ante.",
                textAlign: TextAlign.center,
                  style: AppStyles.poppins14w400darkGrey2,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
