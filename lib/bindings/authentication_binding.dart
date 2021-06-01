import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:zstask/controllers/authentication_controller.dart';
import 'package:zstask/data/repositories/login_repository.dart';
import 'package:zstask/utils/services/local_storage.dart';

class AuthenticationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthenticationController>(
        () => Get.find<AuthenticationController>());
  }
}
