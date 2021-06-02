import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:zstask/controllers/authentication_controller.dart';
import 'package:zstask/routes/routes.dart';

class ConnectionController extends GetxController {
  var connectionStatus = 0.obs;
  StreamSubscription<ConnectivityResult> _connectivitySubscription;
  final Connectivity _connectivity = Connectivity();

  static ConnectionController to = Get.find();

  @override
  void onInit() {
    super.onInit();
    initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  navigateToMenuScreen() {
    if (AuthenticationController.to.token != null) {
      Get.offAllNamed(Routes.MENU);
    } else {
      Get.offAllNamed(Routes.LOGIN);
    }
  }

  startTime() async {
    var duration = new Duration(seconds: 3);
    return new Timer(duration, navigateToMenuScreen);
  }

  Future<int> initConnectivity() async {
    ConnectivityResult result;
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (error) {
      print(error);
    }
    return _updateConnectionStatus(result);
  }

  _updateConnectionStatus(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.wifi:
        connectionStatus.value = 1;
        Get.snackbar('Wi-Fi', 'You are connected!',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            borderRadius: 12,
            margin: EdgeInsets.only(bottom: 20, left: 12, right: 12),
            colorText: Colors.white);
        break;
      case ConnectivityResult.mobile:
        connectionStatus.value = 2;
        Get.snackbar('Mobile', 'You are connected!',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            borderRadius: 12,
            margin: EdgeInsets.only(bottom: 20, left: 12, right: 12),
            colorText: Colors.white);
        break;
      case ConnectivityResult.none:
        connectionStatus.value = 0;
        Get.snackbar('Connection Error!', 'Please try again later!',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            borderRadius: 12,
            margin: EdgeInsets.only(bottom: 20, left: 12, right: 12),
            colorText: Colors.white);
        break;
      default:
        Get.snackbar('Connection Error!', 'Please try again later!',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            borderRadius: 12,
            margin: EdgeInsets.only(bottom: 20, left: 12, right: 12),
            colorText: Colors.white);
        break;
    }
  }

  @override
  void onClose() {
    super.onClose();
    _connectivitySubscription.cancel();
  }
}
