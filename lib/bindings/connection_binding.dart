import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:zstask/controllers/authentication_controller.dart';
import 'package:zstask/controllers/connection_controller.dart';
import 'package:zstask/data/repositories/login_repository.dart';
import 'package:zstask/utils/services/local_storage.dart';

class ConnectionBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConnectionController>(() => ConnectionController());

    Get.put<Dio>(Dio(), permanent: true);

    Get.put<LocalStorage>(LocalStorageImpl(), permanent: true);

    Get.lazyPut<LoginRepository>(() => LoginRepositoryImpl(Get.find<Dio>()));

    Get.put<AuthenticationController>(
      AuthenticationController(
        Get.find<LocalStorage>(),
        Get.find<LoginRepository>(),
      ),
      permanent: true,
    );
  }
}
