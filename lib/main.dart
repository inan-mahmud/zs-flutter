import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zstask/bindings/connection_binding.dart';
import 'package:zstask/controllers/connection_controller.dart';
import 'package:zstask/routes/app_pages.dart';
import 'package:zstask/routes/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(ConnectionController());
  runApp(
    GetMaterialApp(
      title: 'Zs-Flutter',
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.native,
      initialBinding: ConnectionBinding(),
      getPages: AppPages.pages,
      initialRoute: Routes.MENU,
      theme: ThemeData(
        primarySwatch: Colors.green,
        appBarTheme: AppBarTheme(
          color: Colors.green.shade700,
          textTheme: TextTheme(
            headline6: GoogleFonts.roboto(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    ),
  );
}
