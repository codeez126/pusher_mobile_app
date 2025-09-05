import 'dart:ui';
import 'package:base_project/app/views/home_section/controller/home_controller.dart';
import 'package:base_project/core/constants/app_colors.dart';
import 'package:base_project/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FadeThreeWidgets extends StatefulWidget {
  const FadeThreeWidgets({super.key});

  @override
  State<FadeThreeWidgets> createState() => _FadeThreeWidgetsState();
}

class _FadeThreeWidgetsState extends State<FadeThreeWidgets> {
  var con = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 107,
      child: Obx(
        () => CustomPaint(
          painter: DottedArcPainter(con: con),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedSwitcher(
                duration: const Duration(seconds: 1),
                transitionBuilder: (child, animation) {
                  return FadeTransition(opacity: animation, child: child);
                },
                child:
                    con.currentIndex.value == 1
                        ? Column(
                          key: const ValueKey(1),
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.yellow,
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2,
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/images/homeplay.png",
                                    width: 35,
                                    height: 35,
                                  ),
                                  Text(
                                    "Daily course",
                                    style: AppTextStyles.medium.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 0,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      con.currentIndex.value = 0;
                                      con.controller.animateToPage(
                                        0,
                                        duration: Duration(seconds: 1),
                                        curve: Curves.easeInOut,
                                      );
                                    },
                                    child: Image.asset(
                                      "assets/images/calender.png",
                                      width: 60,
                                      height: 60,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      con.currentIndex.value = 2;
                                      con.controller.animateToPage(
                                        2,
                                        duration: Duration(seconds: 1),
                                        curve: Curves.easeInOut,
                                      );
                                    },
                                    child: Image.asset(
                                      "assets/images/star.png",
                                      width: 60,
                                      height: 60,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                        : con.currentIndex.value == 0
                        ? Column(
                          key: const ValueKey(0),
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: Color(0xffe4e4e4),
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2,
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/images/calender.png",
                                    width: 35,
                                    height: 35,
                                  ),
                                  Text(
                                    "Daily challenge",
                                    style: AppTextStyles.medium.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Transform(
                              transform: Matrix4.translationValues(-5, -5, 0),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 0,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        con.currentIndex.value = 1;
                                        con.controller.animateToPage(
                                          1,
                                          duration: Duration(seconds: 1),
                                          curve: Curves.easeInOut,
                                        );
                                      },
                                      child: Image.asset(
                                        "assets/images/homeplay.png",
                                        width: 60,
                                        height: 60,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                        : Column(
                          key: const ValueKey(2),
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: Color(0xffe4e4e4),
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2,
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/images/star.png",
                                    width: 35,
                                    height: 35,
                                  ),
                                  Text(
                                    "Pusher Challenge",
                                    style: AppTextStyles.medium.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Transform(
                              transform: Matrix4.translationValues(5, -5, 0),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 0,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        con.currentIndex.value = 1;
                                        con.controller.animateToPage(
                                          1,
                                          duration: Duration(seconds: 1),
                                          curve: Curves.easeInOut,
                                        );
                                      },
                                      child: Image.asset(
                                        "assets/images/homeplay.png",
                                        width: 60,
                                        height: 60,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DottedArcPainter extends CustomPainter {
  final HomeController con;

  DottedArcPainter({super.repaint, required this.con});
  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = Colors.white
          ..strokeWidth = 2
          ..style = PaintingStyle.stroke;

    // Use full screen width for the arc
    final double width = Get.width;
    // Height is constrained to fit within the 107 height container
    const double height = 107;
    // Center the arc vertically within the container
    final center = Offset(width / 2, height);
    // Create an oval-shaped arc that spans the screen width
    final rect = Rect.fromCenter(
      center: center,
      width: width + 25, // Full screen width
      height: height + 50, // Slightly less than container height to fit
    );

    const double startAngle = 3.14; // Start from the top (180 degrees)
    const double sweepAngle = 3.14; // 180 degrees arc

    // Create the arc path
    final path = Path()..addArc(rect, startAngle, sweepAngle);

    // Draw dotted line
    const double dashWidth = 5;
    const double dashSpace = 5;
    final dashPath = Path();
    for (PathMetric metric in path.computeMetrics()) {
      double distance = 0;
      while (distance < metric.length) {
        dashPath.addPath(
          metric.extractPath(distance, distance + dashWidth),
          Offset.zero,
        );
        distance += dashWidth + dashSpace;
      }
    }

    canvas.drawPath(dashPath, paint);

    // Draw a vertical dotted line from the center downward
    final linePath =
        Path()
          ..moveTo(width / 2, height / 2 - 5) // Start at the center of the arc
          ..lineTo(
            width / 2,
            height + 20,
          ); // Extend downward to match arc height

    // Create dotted effect for the line
    final lineDashPath = Path();
    for (PathMetric metric in linePath.computeMetrics()) {
      double distance = 0;
      while (distance < metric.length) {
        lineDashPath.addPath(
          metric.extractPath(distance, distance + dashWidth),
          Offset.zero,
        );
        distance += dashWidth + dashSpace;
      }
    }

    canvas.drawPath(lineDashPath, paint);

    if (con.currentIndex.value != 0) {
      final leftDiagonalPath =
          Path()
            ..moveTo(25, height / 2 + 5) // Start at the center of the arc
            ..lineTo(70, height + 20); // Extend to bottom-left corner

      // Create dotted effect for the left diagonal line
      final leftDiagonalDashPath = Path();
      for (PathMetric metric in leftDiagonalPath.computeMetrics()) {
        double distance = 0;
        while (distance < metric.length) {
          leftDiagonalDashPath.addPath(
            metric.extractPath(distance, distance + dashWidth),
            Offset.zero,
          );
          distance += dashWidth + dashSpace;
        }
      }

      canvas.drawPath(leftDiagonalDashPath, paint);
    }

    if (con.currentIndex.value != 2) {
      final rightDiagonalPath =
          Path()
            ..moveTo(
              width - 25,
              height / 2 + 5,
            ) // Start at the center of the arc
            ..lineTo(width - 70, height + 20); // Extend to bottom-right corner

      // Create dotted effect for the right diagonal line
      final rightDiagonalDashPath = Path();
      for (PathMetric metric in rightDiagonalPath.computeMetrics()) {
        double distance = 0;
        while (distance < metric.length) {
          rightDiagonalDashPath.addPath(
            metric.extractPath(distance, distance + dashWidth),
            Offset.zero,
          );
          distance += dashWidth + dashSpace;
        }
      }

      canvas.drawPath(rightDiagonalDashPath, paint);
    }

    // Draw a diagonal dotted line from the center to the bottom-left

    // Draw a diagonal dotted line from the center to the bottom-right
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
