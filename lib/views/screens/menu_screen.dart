import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zstask/constants/app_constants.dart';
import 'package:zstask/constants/urls.dart';
import 'package:zstask/controllers/menu_controller.dart';
import 'package:zstask/data/models/menus/menu.dart';
import 'package:zstask/routes/routes.dart';
import 'package:zstask/utils/enums/app_state.dart';
import 'package:zstask/views/widgets/error_widget.dart';
import 'package:zstask/views/widgets/shimmer_widget.dart';

class MenuScreen extends GetView<MenuController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text(
          Constants.MENU,
          style: Theme.of(context).textTheme.subtitle2,
        ),
        centerTitle: true,
        leading: Container(),
      ),
      bottomNavigationBar: Container(
        height: 64,
        color: Theme.of(context).backgroundColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Theme.of(context).primaryColor,
            ),
            onPressed: () {
              controller.signOut();
            },
            child: Text(
              "Sign Out",
              style: Theme.of(context).textTheme.button,
            ),
          ),
        ),
      ),
      body: Obx(() {
        if (controller.apiResponse.value.status == AppState.LOADING) {
          return ShimmerWidget();
        }
        if (controller.apiResponse.value.status == AppState.ERROR) {
          return SomethingWrongWidget(
            onTap: () {
              controller.fetchMenus();
            },
          );
        }
        return ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            MenuModel model = controller.apiResponse.value.data[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: Container(
                      child: Text(
                        model.name,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline2,
                      ),
                    ),
                  ),
                  ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      Menu menu = model.menus[index];
                      return Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        child: InkWell(
                          onTap: () =>
                              Get.toNamed(Routes.DETAILS, arguments: menu),
                          child: Container(
                            height: 96,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 96,
                                  height: double.infinity,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: CachedNetworkImage(
                                      imageUrl: URLs.baseUrl + menu.photo,
                                      placeholder: (context, url) => Image.asset(
                                          'assets/image/ic_placeholder.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 12.0),
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    child: Flex(
                                      direction: Axis.vertical,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          menu.title,
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle1,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Text(
                                          "Price: " + menu.price,
                                          style: Theme.of(context)
                                              .textTheme
                                              .caption,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.zero,
                                      topRight: Radius.zero,
                                      bottomLeft: Radius.zero,
                                      bottomRight: Radius.circular(8),
                                    ),
                                    child: Container(
                                      color: Theme.of(context).primaryColor,
                                      child: Icon(
                                        Icons.arrow_forward,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: model.menus.length,
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                  )
                ],
              ),
            );
          },
          itemCount: controller.apiResponse.value.data.length,
          shrinkWrap: true,
        );
      }),
    );
  }
}
