import 'package:bodytech/app/Pages/profile/profileBinding.dart';
import 'package:bodytech/app/pages/login/loginBinding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app/routes/appPages.dart';

void main() async {
  await Hive.initFlutter();

  await Hive.openBox('userData');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? token = Hive.box('userData').get('token');

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: appThemeData,
      initialRoute: token != null ? Routes.PROFILE : Routes.LOGIN,
      defaultTransition: Transition.fadeIn,
      initialBinding: token != null ? ProfileBinding() : loginBinding(),
      getPages: AppPages.pages,
      textDirection: TextDirection.ltr,
      locale: Get.deviceLocale,
      fallbackLocale: const Locale("es"),
    );
  }
}
