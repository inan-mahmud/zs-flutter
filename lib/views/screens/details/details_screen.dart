import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zstask/constants/urls.dart';
import 'package:zstask/data/models/menus/menu.dart';
import 'package:zstask/views/screens/details/components/item_image.dart';
import 'package:zstask/views/screens/details/components/item_info.dart';

class DetailsScreen extends StatelessWidget {
  Menu menu;

  DetailsScreen() {
    this.menu = Get.arguments;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          ItemImage(
            imgSrc: URLs.baseUrl + menu.photo,
          ),
          ItemInfo(
            menu: menu,
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 64,
        color: Theme.of(context).backgroundColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Theme.of(context).primaryColor),
            onPressed: () {
              Get.back();
            },
            child: Text(
              "Back",
              style: Theme.of(context).textTheme.button,
            ),
          ),
        ),
      ),
    );
  }
}
