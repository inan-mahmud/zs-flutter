import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zstask/bindings/connection_binding.dart';
import 'package:zstask/constants/app_constants.dart';
import 'package:zstask/constants/app_theme.dart';
import 'package:zstask/controllers/authentication_controller.dart';
import 'package:zstask/controllers/connection_controller.dart';
import 'package:zstask/routes/app_pages.dart';
import 'package:zstask/routes/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(ConnectionController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: Constants.APPNAME,
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.rightToLeft,
      initialBinding: ConnectionBinding(),
      getPages: AppPages.pages,
      initialRoute: Routes.INITIAL,
      theme: AppThemes.appTheme,
    );
  }
}
