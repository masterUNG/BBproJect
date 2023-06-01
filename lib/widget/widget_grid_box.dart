// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutterstylehint/widget/widget_image.dart';
import 'package:flutterstylehint/widget/widget_image_network.dart';
import 'package:flutterstylehint/widget/widget_text.dart';

import '../model/post_model.dart';

class WidgetGridBox extends StatelessWidget {
  const WidgetGridBox({
    Key? key,
    required this.postModel,
    this.tabFunc,
  }) : super(key: key);

  final PostModel postModel;
  final Function()? tabFunc;

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: tabFunc,
      child: Column(
        children: [
          WidgetImageNetwork(
            urlImage: postModel.urlImage,
            width: 200,
            height: 270,
            boxFit: BoxFit.cover,
          ),
          WidgetText(
            data: postModel.post,
            textStyle: Theme.of(context).textTheme.labelLarge,
          ),
          WidgetText(
            data: postModel.detail,
            textStyle: Theme.of(context).textTheme.labelSmall,
          )
        ],
      ),
    );
  }
}
