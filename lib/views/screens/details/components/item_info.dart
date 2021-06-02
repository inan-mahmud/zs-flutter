import 'package:flutter/material.dart';
import 'package:zstask/data/models/menus/menu.dart';
import 'package:zstask/views/screens/details/components/price_clipper.dart';

class ItemInfo extends StatelessWidget {
  Menu menu;

  ItemInfo({this.menu});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(20),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  menu.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
              SizedBox(
                width: 16,
              ),
              priceTag(context, price: menu.price)
            ],
          ),
          SizedBox(
            height: 36,
          ),
          Text(
            "Ingredients",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            menu.ingredientLists,
            style: Theme.of(context).textTheme.bodyText2,
          ),
          SizedBox(
            height: 16,
          ),
          menu.addonCategories.length > 0
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Add-Ons",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Container(
                      height: 56,
                      child: ListView.builder(
                        itemBuilder: (BuildContext context, int index) {
                          AddonCategory category = menu.addonCategories[index];
                          return Padding(
                            padding:
                                const EdgeInsets.only(right: 16.0, top: 12),
                            child: Container(
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
                              height: 56,
                              width: 100,
                              child: Center(
                                child: Text(category.category.name),
                              ),
                            ),
                          );
                        },
                        itemCount: menu.addonCategories.length,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                      ),
                    ),
                  ],
                )
              : Container(),
          SizedBox(height: size.height * 0.1),
        ],
      ),
    );
  }
}

ClipPath priceTag(BuildContext context, {String price}) {
  return ClipPath(
    clipper: PricerCliper(),
    child: Container(
      alignment: Alignment.center,
      height: 66,
      width: 65,
      color: Theme.of(context).primaryColorLight,
      child: Text(
        "\$$price",
        style: Theme.of(context).textTheme.subtitle2,
      ),
    ),
  );
}
