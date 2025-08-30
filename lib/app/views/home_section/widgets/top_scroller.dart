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
    return SizedBox(
      // height: 200,
      // width: Get.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(
            () => AnimatedSwitcher(
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
                            // width: Get.width * 0.50,
                            padding: EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.yellow,
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(color: Colors.white, width: 2),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              spacing: 5,
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
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              border: Border.all(color: Colors.white, width: 2),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              spacing: 0,
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
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
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
                        ],
                      )
                      : Column(
                        key: const ValueKey(2),
                        children: [
                          Container(
                            // width: Get.width * 0.50,
                            padding: EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Color(0xffe4e4e4),
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(color: Colors.white, width: 2),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              spacing: 0,
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
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
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
                        ],
                      ),
            ),
          ),
        ],
      ),
    );
  }
}
