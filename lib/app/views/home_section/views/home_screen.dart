import 'dart:developer';
import 'dart:math';
import 'package:base_project/app/routes/app_routes.dart';
import 'package:base_project/app/views/home_section/controller/home_controller.dart';
import 'package:base_project/app/views/home_section/widgets/top_scroller.dart';
import 'package:base_project/core/constants/app_svgs.dart';
import 'package:base_project/core/utils/text_styles.dart';
import 'package:base_project/core/widgets/custom_info_dialoge.dart';
import 'package:base_project/core/widgets/daily_course_view/custom_audio_waveform_player.dart';
import 'package:base_project/core/widgets/daily_goals_done_view/animated_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../core/Constants/app_colors.dart';
import '../../../../core/constants/app_fonts_and_styles.dart';
import '../../../../core/constants/app_images.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var con = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.dailyChallengeBackground),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.topCenter,
              children: [
                // Container(height: 210.h),
                Container(
                  height: 120,
                  width: Get.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(50.sp),
                    ),
                    color: AppColors.whiteColor.withOpacity(0.30),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        left: 0,
                        bottom: 0,
                        child: SizedBox(
                          height: 100,
                          width: 100,
                          child: Stack(
                            children: [
                              Image.asset(
                                'assets/images/back.png',
                                height: 120,
                                width: 50,
                              ),
                              Positioned(
                                bottom: 30,
                                left: 5,
                                child: Image.asset(
                                  "assets/images/coin.png",
                                  height: 40,
                                  width: 40,
                                ),
                              ),
                              Positioned(
                                left: -20.w,
                                child: CustomPaint(
                                  size: const Size(100, 100), // widget size
                                  painter: CurvedTextPainter('165'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        right: -20,
                        bottom: 0,
                        child: SizedBox(
                          height: 100,
                          width: 100,
                          child: GestureDetector(
                            onTap: () {
                              Get.toNamed(AppRoutes.notificationsView);
                            },
                            child: Image.asset(
                              "assets/images/notify.png",
                              height: 120,
                              width: 50,
                            ),
                          ),
                        ),
                      ),
                      // Positioned(
                      //   bottom: 55,
                      //   child: Text(
                      //     'Daily Challenge'.tr,
                      //     style: AppStyles.poppins20w600darkGrey2,
                      //   ),
                      // ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: -50,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        bottom: -45,
                        child: Container(
                          width: Get.width * 0.70,
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 12,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.20),
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: Colors.white, width: 1),
                          ),
                          child: Center(
                            child: Text(
                              "Good Morning Or",
                              style: AppTextStyles.medium.copyWith(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 1),
                          color: const Color(0xff0E1E2E4),
                        ),
                        child: CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage('assets/images/user.png'),
                        ),
                      ),
                    ],
                  ),
                ),
                // Positioned(
                //   bottom: 0,
                //   right: 0,
                //   child: GestureDetector(
                //     onTap: () {
                //       Get.dialog(
                //         CustomInfoDialog(
                //           description:
                //               "Every day you can choose one daily challenge from three possible challenges. After you choose and carry it out, three new challenge will appear every other day."
                //                   .tr,
                //         ),
                //       );
                //     },
                //     child: Container(
                //       margin: EdgeInsets.all(20.sp),
                //       padding: EdgeInsets.all(5.sp),
                //       decoration: BoxDecoration(
                //         color: AppColors.whiteColor.withOpacity(0.60),
                //         shape: BoxShape.circle,
                //         border: Border.all(
                //           color: AppColors.whiteColor,
                //           width: 1.8.w,
                //         ),
                //       ),
                //       child: SvgPicture.asset(AppSvgs.infoSvg),
                //     ),
                //   ),
                // ),
              ],
            ),
            SizedBox(height: 120),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Container(
                        width: Get.width,
                        height: 65,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.20),
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: Colors.white, width: 1),
                        ),
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: 7,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                              ),
                              child: SizedBox(
                                width: 40,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    if (index < 2)
                                      Icon(
                                        Icons.check,
                                        size: 20,
                                        color: AppColors.darkGrey2,
                                      ),
                                    SizedBox(height: 0),
                                    Container(
                                      padding: EdgeInsets.only(bottom: 10),
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 8,
                                          vertical: 4,
                                        ),
                                        decoration: BoxDecoration(
                                          color:
                                              index == 2
                                                  ? Colors.white.withValues(
                                                    alpha: 0.30,
                                                  )
                                                  : Colors.transparent,
                                          borderRadius:
                                              index == 2
                                                  ? BorderRadius.circular(8)
                                                  : null,
                                          border:
                                              index == 2
                                                  ? Border.all(
                                                    color: Colors.white,
                                                    width: 1,
                                                  )
                                                  : null,
                                        ),
                                        child: Text(
                                          "0${index + 1}",
                                          style: AppTextStyles.medium.copyWith(
                                            color:
                                                index < 2
                                                    ? AppColors.darkGrey2
                                                    : Colors.white,
                                            fontWeight:
                                                index == 2
                                                    ? FontWeight.w600
                                                    : FontWeight.w300,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.30),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 20),
                          Container(
                            width: Get.width,
                            margin: EdgeInsets.symmetric(horizontal: 16),
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 12,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.20),
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(color: Colors.white, width: 1),
                            ),
                            child: Center(
                              child: Text(
                                "Complete your daily goals",
                                style: AppTextStyles.medium.copyWith(
                                  color: AppColors.darkGrey2,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          FadeThreeWidgets(),
                          // SizedBox(height: 20.h),
                          SizedBox(
                            height: 320,
                            width: Get.width,
                            child: Stack(
                              // spacing: 2,
                              alignment: Alignment.center,

                              children: [
                                PageView.builder(
                                  onPageChanged: (value) {
                                    con.currentIndex.value = value;
                                  },
                                  controller: con.controller,
                                  itemCount: 3,
                                  itemBuilder: (context, index) {
                                    return AnimatedBuilder(
                                      animation: con.controller,
                                      builder: (context, child) {
                                        double value = 0.0;
                                        if (con
                                            .controller
                                            .position
                                            .haveDimensions) {
                                          value = con.controller.page! - index;
                                        } else {
                                          value =
                                              con.controller.initialPage
                                                  .toDouble() -
                                              index;
                                        }

                                        // Limit tilt range
                                        value = (value * 0.5).clamp(-1.0, 1.0);

                                        // Rotation angle in radians
                                        double angle = value * 0.25;

                                        // adjust tilt strength

                                        return Transform(
                                          alignment: Alignment.center,
                                          transform:
                                              Matrix4.identity()
                                                ..setEntry(
                                                  3,
                                                  2,
                                                  0.001,
                                                ) // perspective
                                                ..rotateZ(-angle),

                                          child: GestureDetector(
                                            onTap: () {
                                              if (index == 1) {
                                                Get.toNamed(
                                                  AppRoutes.dailyCourseView,
                                                );
                                              }
                                              if (index == 0) {
                                                Get.toNamed(
                                                  AppRoutes.dailyGoalsView,
                                                );
                                              }

                                              if (index == 2) {
                                                Get.toNamed(
                                                  AppRoutes.pusherChallengeView,
                                                );
                                              }
                                            },
                                            child:
                                                index == 1
                                                    ? DailyMotivation()
                                                    : index == 0
                                                    ? DailyTask()
                                                    : DailyPusher(),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),

                                Positioned(
                                  left: 0,
                                  child: GestureDetector(
                                    onTap: () {
                                      if (con.currentIndex.value == 0) {
                                        return;
                                      }
                                      con.currentIndex.value -= 1;
                                      con.controller.animateToPage(
                                        con.currentIndex.value,
                                        duration: Duration(seconds: 1),
                                        curve: Curves.easeInOut,
                                      );
                                    },
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Image.asset('assets/images/hpre.png'),
                                        Icon(Icons.arrow_back_ios, size: 20),
                                      ],
                                    ),
                                  ),
                                ),

                                Positioned(
                                  right: 0,
                                  child: GestureDetector(
                                    onTap: () {
                                      if (con.currentIndex.value == 2) {
                                        return;
                                      }
                                      con.currentIndex.value += 1;
                                      con.controller.animateToPage(
                                        con.currentIndex.value,
                                        duration: Duration(seconds: 1),
                                        curve: Curves.easeInOut,
                                      );
                                    },
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Image.asset('assets/images/hnext.png'),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          size: 20,
                                        ).marginOnly(bottom: 10),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 60),
                        ],
                      ),
                    ),
                    Transform(
                      transform: Matrix4.translationValues(0, -80, 0),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          width: Get.width,
                          height: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/yellowback.png'),
                              fit: BoxFit.contain,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: 20),
                              Text(
                                'Premium',
                                style: AppTextStyles.largew600.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                              Flexible(
                                child: Text(
                                  'unlock extra challenges to get the complete progress for yourself',
                                  style: AppTextStyles.medium.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Transform(
                                transform: Matrix4.translationValues(0, 30, 0),
                                child: Container(
                                  // width: Get.width * 0.60,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.lightBlue,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    spacing: 5,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/images/star.png",
                                        width: 35,
                                        height: 35,
                                      ),
                                      Text(
                                        "upgrade from  20\$",
                                        style: AppTextStyles.medium.copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                          color: AppColors.darkGrey2,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DailyMotivation extends StatelessWidget {
  const DailyMotivation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.motivationalVideoBackgroundOne),
          fit: BoxFit.cover,
        ),
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: Colors.black.withValues(alpha: 0.3),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedProgressBar(
              targetProgress: 0.78,
              backgroundColor: AppColors.whiteColor.withOpacity(0.25),
              height: 30.h,
              progressColor: AppColors.yellow,
              borderColor: AppColors.whiteColor,
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                // width: Get.width * 0.50,
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: Colors.white, width: 1),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 0,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "35",
                      style: AppTextStyles.medium.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    Image.asset(
                      "assets/images/point.png",
                      width: 35,
                      height: 35,
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
            Text(
              "“Nothing Will Stop Me”",
              style: AppTextStyles.largew600.copyWith(color: Colors.white),
            ),
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.white.withValues(alpha: 0.25),
              ),
              child: Text(
                "By Amit Cohen",
                style: AppTextStyles.medium.copyWith(color: Colors.white),
              ),
            ),

            const SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: Colors.white, width: 0.5),
              ),
              child: CustomAudioWaveformPlayer(
                isTimerEnabled: false,
                height: 50.h,
                buttonHeight: 50.h,
                buttonWidth: 50.w,
                isAudioContainerBackground: true,
                isBackgroundContainerEnabled: false,
                backgroundColor: Colors.transparent,
              ),
            ),
            // const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class DailyTask extends StatelessWidget {
  const DailyTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      decoration: BoxDecoration(
        color: Color(0xffcedeff),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: Colors.black.withValues(alpha: 0.02),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedProgressBar(
              targetProgress: 0,
              backgroundColor: Color(0xffd9e5ff),
              height: 30.h,
              progressColor: AppColors.yellow,
              borderColor: AppColors.whiteColor,
            ),
            SizedBox(height: 10),

            Text(
              "Choose One Daily Challenge From Three Possible Challenges",
              style: AppTextStyles.largew600.copyWith(color: Colors.white),
            ),

            const SizedBox(height: 10),
            Flexible(
              child: Center(
                child: Image.asset(
                  'assets/images/numbers.png',
                  // height: 60,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                // width: Get.width * 0.50,
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: Colors.white, width: 1),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 0,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "35",
                      style: AppTextStyles.medium.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    Image.asset(
                      "assets/images/point.png",
                      width: 35,
                      height: 35,
                    ),
                  ],
                ),
              ),
            ),
            // const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class DailyPusher extends StatelessWidget {
  const DailyPusher({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      decoration: BoxDecoration(
        color: Color(0xff60A9FE),
        borderRadius: BorderRadius.circular(24),
        image: DecorationImage(
          image: AssetImage('assets/images/bigstart.png'),
          fit: BoxFit.cover,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: Colors.black.withValues(alpha: 0.02),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedProgressBar(
              textColor: Colors.black,
              targetProgress: 0.35,
              backgroundColor: Color(0xff83baf9),
              height: 30.h,
              progressColor: Colors.white,
              borderColor: AppColors.whiteColor,
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                // width: Get.width * 0.50,
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: Colors.white, width: 1),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 0,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "35",
                      style: AppTextStyles.medium.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    Image.asset(
                      "assets/images/point.png",
                      width: 35,
                      height: 35,
                    ),
                  ],
                ),
              ),
            ),

            Spacer(),
            Center(
              child: Image.asset(
                'assets/images/pusher.png',
                // height: 60,
              ),
            ),

            // const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class CurvedTextPainter extends CustomPainter {
  final String text;
  CurvedTextPainter(this.text);

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = Colors.blue
          ..strokeWidth = 12
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round;

    // Arc path
    final rect = Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2),
      radius: size.width / 3,
    );

    const startAngle = -pi / 1.8;
    const sweepAngle = pi / 2;

    // Draw arc
    canvas.drawArc(rect, startAngle, sweepAngle, false, paint);

    // ===== CURVED TEXT =====
    final textStyle = const TextStyle(
      fontSize: 12,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    );

    // measure each character
    List<TextPainter> charPainters =
        text.split("").map((char) {
          final tp = TextPainter(
            text: TextSpan(text: char, style: textStyle),
            textDirection: TextDirection.ltr,
          )..layout();
          return tp;
        }).toList();

    // total text width
    final totalWidth = charPainters.fold<double>(
      0.0,
      (sum, tp) => sum + tp.width,
    );

    final radius = rect.width / 2;
    final arcLength = radius * sweepAngle;

    // start offset so text is centered
    double charOffset = (arcLength - totalWidth) / 2;

    double currentAngle = startAngle + charOffset / radius;

    for (var tp in charPainters) {
      final charAngle = (tp.width / 2) / radius;

      final x = rect.center.dx + radius * cos(currentAngle + charAngle);
      final y = rect.center.dy + radius * sin(currentAngle + charAngle);

      canvas.save();
      canvas.translate(x, y);
      canvas.rotate(currentAngle + charAngle + pi / 2); // rotate char
      tp.paint(canvas, Offset(-tp.width / 2, -tp.height / 2));
      canvas.restore();

      currentAngle += tp.width / radius;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
