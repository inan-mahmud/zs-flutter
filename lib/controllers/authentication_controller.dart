import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zstask/constants/app_constants.dart';
import 'package:zstask/controllers/connection_controller.dart';
import 'package:zstask/data/models/login_model.dart';
import 'package:zstask/data/repositories/login_repository.dart';
import 'package:zstask/routes/routes.dart';
import 'package:zstask/utils/enums/app_state.dart';
import 'package:zstask/utils/helpers/failure.dart';
import 'package:zstask/utils/helpers/snackbars.dart';
import 'package:zstask/utils/helpers/validators.dart';
import 'package:zstask/utils/services/local_storage.dart';

class AuthenticationController extends GetxController {
  final LocalStorage _localStorage;
  final LoginRepository _loginRepository;

  AuthenticationController(this._localStorage, this._loginRepository);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final emailValidator = MultiValidator([
    RequiredValidator(errorText: 'Email is required'),
    EmailValidator(errorText: "Please enter a valid email address"),
  ]);

  final passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'Password is required'),
    MinLengthValidator(6, errorText: 'password must be at least 6 digits long'),
  ]);

  String token;

  final formKey = GlobalKey<FormState>();

  final _inAsyncCall = false.obs;

  get inAsyncCall => _inAsyncCall;

  static AuthenticationController to = Get.find();

  set inAsyncCall(value) {
    _inAsyncCall.value = value;
  }

  @override
  void onInit() {
    super.onInit();
    loadToken();
  }

  login() async {
    if (ConnectionController.to.connectionStatus.value > 0) {
      inAsyncCall = true;

      var data = {
        "email": emailController.text.trim(),
        "password": passwordController.text,
        "restaurant": "kababbox",
        "is_terms_accepted": true
      };
      try {
        LoginModel model = await _loginRepository.signIn(data);
        saveToken(model.access);
        inAsyncCall = false;
      } on Failure catch (e) {
        inAsyncCall = false;
        showErrorSnackBar(e.message);
      }
    }
  }

  loadToken() async {
    token = await _localStorage.read(Constants.TOKEN);
  }

  void saveToken(String token) async {
    bool result = await _localStorage.write(Constants.TOKEN, token);
    if (result) {
      showSuccessSnackBar("Signed in successfully");
      navigateToMenuScreen();
    }
  }

  void navigateToMenuScreen() {
    Get.offAllNamed(Routes.MENU);
  }

  void signOut() async {
    bool isLogout = await _localStorage.remove(Constants.TOKEN);
    if (isLogout) {
      Get.offAllNamed(Routes.LOGIN);
    }
  }
}
