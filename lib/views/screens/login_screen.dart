import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zstask/constants/app_constants.dart';
import 'package:zstask/controllers/authentication_controller.dart';
import 'package:zstask/views/widgets/bezier_curve/bezier_container.dart';
import 'package:zstask/views/widgets/modal_progress.dart';

class LoginScreen extends GetView<AuthenticationController> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Obx(() {
      return ModalProgressHUD(
        progressIndicator: CircularProgressIndicator(),
        inAsyncCall: controller.inAsyncCall.value,
        child: Scaffold(
          body: Container(
            height: height,
            child: Stack(
              children: [
                Positioned(
                  top: -height * .15,
                  right: -MediaQuery.of(context).size.width * .4,
                  child: BezierContainer(),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: SingleChildScrollView(
                    child: Form(
                      key: controller.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: height * .3),
                          Text(
                            Constants.APPNAME,
                            style: Theme.of(context).textTheme.headline1,
                          ),
                          SizedBox(height: 50),
                          _emailPasswordWidget(context),
                          SizedBox(height: 20),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Theme.of(context).primaryColor,
                                ),
                                onPressed: () {
                                  if (controller.formKey.currentState
                                      .validate()) {
                                    controller.login();
                                  }
                                },
                                child: Text(Constants.LOGIN)),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget _emailPasswordWidget(BuildContext context) {
    return Column(
      children: <Widget>[
        _emailField(context),
        _entryPasswordField(context),
      ],
    );
  }

  Widget _emailField(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            Constants.EMAIL,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            autofocus: true,
            controller: controller.emailController,
            keyboardType: TextInputType.emailAddress,
            validator: controller.emailValidator,
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: .5),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: .5),
                ),
                fillColor: Colors.grey[50],
                hintText: Constants.EMAIL_HINT,
                hintStyle: Theme.of(context).textTheme.caption,
                filled: true),
          ),
        ],
      ),
    );
  }

  Widget _entryPasswordField(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            Constants.Password,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: controller.passwordController,
            obscureText: true,
            validator: controller.passwordValidator,
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: .5),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: .5),
                ),
                fillColor: Colors.grey[50],
                hintText: Constants.Password_HINT,
                hintStyle: Theme.of(context).textTheme.caption,
                filled: true),
          )
        ],
      ),
    );
  }
}
