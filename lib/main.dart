import 'package:base_project/core/locale/locale_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'app/routes/app_pages.dart';
import 'app/routes/app_routes.dart';
import 'core/Constants/app_colors.dart';
import 'core/Managers/PrefManager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Status bar background color
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  //Initialize GetStorage
  await PrefManager.init();
  await GetStorage.init();
  //await initializeGoogleSignIn();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final box = GetStorage();

    // read saved language or fallback to English
    final String langCode = box.read('langCode') ?? 'en';
    final String countryCode = box.read('countryCode') ?? 'US';
    return ScreenUtilInit(
      designSize: const Size(390, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pusher',
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
          useMaterial3: true,
        ),
        //locale: const Locale('en', 'US'),
        locale: Locale(langCode, countryCode),
        translations: LocaleString(),
        fallbackLocale: const Locale('en', 'US'),
        initialRoute: AppRoutes.splashView,
        getPages: AppPages.routes,
      ),
    );
  }
}
// Future<void> initializeGoogleSignIn() async {
//   try {
//     await GoogleSignIn.instance.initialize(
//       serverClientId: "1012067083699-do0mtlqea05tjqj22n18n1rnim7e733m.apps.googleusercontent.com"
//     );
//     print("Google Sign In initialized successfully");
//   } catch (e) {
//     print("Failed to initialize Google Sign In: $e");
//   }
// }
