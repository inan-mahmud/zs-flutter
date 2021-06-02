import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:zstask/controllers/menu_controller.dart';
import 'package:zstask/data/repositories/menu_repository.dart';

class MenuBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies]
    Get.put<MenuRepository>(MenuRepositoryImpl(Get.find<Dio>()));
    Get.put<MenuController>(MenuController(Get.find<MenuRepository>()));
  }
}
