import 'package:flutter/material.dart';

class SomethingWrongWidget extends StatelessWidget {
  final Function onTap;

  SomethingWrongWidget({this.onTap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/image/error.png",
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.15,
            left: MediaQuery.of(context).size.width * 0.3,
            right: MediaQuery.of(context).size.width * 0.3,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF70DAAD),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              onPressed: onTap,
              child: Text(
                "Try Again".toUpperCase(),
                style: Theme.of(context).textTheme.button,
              ),
            ),
          )
        ],
      ),
    );
  }
}
