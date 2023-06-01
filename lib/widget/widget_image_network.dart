// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class WidgetImageNetwork extends StatelessWidget {
  const WidgetImageNetwork({
    Key? key,
    required this.urlImage,
    this.width,
    this.height,
    this.boxFit,
  }) : super(key: key);

  final String urlImage;
  final double? width;
  final double? height;
  final BoxFit? boxFit;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      urlImage,
      width: width,
      height: height,
      fit: boxFit,
    );
  }
}
