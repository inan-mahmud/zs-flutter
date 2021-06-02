import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ItemImage extends StatelessWidget {
  final String imgSrc;

  const ItemImage({
    Key key,
    this.imgSrc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return CachedNetworkImage(
      imageUrl: imgSrc,
      placeholder: (context, url) => Image.asset(
          'assets/image/ic_placeholder_wide.png'),
      height: size.height * 0.3,
      width: double.infinity,
      fit: BoxFit.fill,
    );
  }
}
