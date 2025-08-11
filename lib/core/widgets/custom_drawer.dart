import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

import '../Constants/app_colors.dart';

class CustomEndDrawer extends StatelessWidget {
  CustomEndDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 16,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
      ),
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
              color: AppColors.primaryColor,
              child: Row(
                children: [
                  ClipOval(
                    child: CachedNetworkImage(
                      imageUrl: "https://picsum.photos/200",
                      width: 60.w,
                      height: 60.h,
                      fit: BoxFit.cover,
                      placeholder:
                          (context, url) => Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              width: 60.w,
                              height: 60.h,
                              color: Colors.white,
                            ),
                          ),
                      errorWidget:
                          (context, url, error) => Container(
                            width: 60.w,
                            height: 60.h,
                            color: Colors.grey[200],
                            child: Icon(Icons.error, color: Colors.red),
                          ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello User",
                        style: GoogleFonts.rubik(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "User Name",
                        style: GoogleFonts.rubik(
                          color: Colors.white70,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView(
                children: [
                  _buildDrawerItem(
                    icon: Icons.home,
                    label: "Home",
                    onTap: () {},
                  ),
                  _buildDrawerItem(
                    icon: Icons.home,
                    label: "Home2",
                    onTap: () {},
                  ),
                  _buildDrawerItem(
                    icon: Icons.home,
                    label: "Home3",
                    onTap: () {},
                  ),
                  _buildDrawerItem(
                    icon: Icons.home,
                    label: "Home4",
                    onTap: () {},
                  ),
                  _buildDrawerItem(
                    icon: Icons.home,
                    label: "Home5",
                    onTap: () {},
                  ),
                  _buildDrawerItem(
                    icon: Icons.home,
                    label: "Logout",
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _buildDrawerItem({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: AppColors.primaryColor),
      title: Text(
        label,
        style: GoogleFonts.rubik(fontSize: 14, fontWeight: FontWeight.w500),
      ),
      onTap: onTap,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
      horizontalTitleGap: 12,
    );
  }
}
