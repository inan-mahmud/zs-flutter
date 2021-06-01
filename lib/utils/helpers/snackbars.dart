import 'package:flutter/material.dart';
import 'package:get/get.dart';

showErrorSnackBar(e) {
  Get.snackbar(
    'Failed',
    '${e.toString()}',
    snackPosition: SnackPosition.BOTTOM,
    duration: Duration(seconds: 1),
    backgroundColor: Colors.red,
    colorText: Get.theme.snackBarTheme.actionTextColor,
    margin: EdgeInsets.all(10.0),
    isDismissible: true,
  );
}

showSuccessSnackBar(e) {
  Get.snackbar(
    'Success',
    '${e.toString()}',
    snackPosition: SnackPosition.BOTTOM,
    duration: Duration(seconds: 1),
    backgroundColor: Colors.green,
    colorText: Get.theme.snackBarTheme.actionTextColor,
    margin: EdgeInsets.all(10.0),
  );
}
