import 'package:flutter/material.dart';
import 'package:zstask/constants/app_constants.dart';
import 'package:zstask/controllers/connection_controller.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final ConnectionController _controller = ConnectionController.to;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              Constants.APPNAME,
              style: Theme.of(context).textTheme.headline1,
            ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            CircularProgressIndicator(
              backgroundColor: Colors.white,
              strokeWidth: 2,
            )
          ],
        )),
      ),
    );
  }
}
