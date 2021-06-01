import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:zstask/bindings/authentication_binding.dart';
import 'package:zstask/routes/routes.dart';
import 'package:zstask/views/screens/details_screen.dart';
import 'package:zstask/views/screens/login_screen.dart';
import 'package:zstask/views/screens/menu_screen.dart';
import 'package:zstask/views/screens/splash_screen.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.INITIAL,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginScreen(),
      binding: AuthenticationBinding(),
    ),
    GetPage(
      name: Routes.MENU,
      page: () => MenuScreen(),
    ),
    GetPage(
      name: Routes.DETAILS,
      page: () => DetailsScreen(),
    ),
  ];
}
