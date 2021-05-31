import 'package:get/get.dart';
import 'package:zstask/controllers/connection_controller.dart';

class ConnectionBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConnectionController>(() => ConnectionController());
  }
}
