// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutterstylehint/widget/widget_form.dart';
import 'package:flutterstylehint/widget/widget_image.dart';
import 'package:get/get.dart';

import 'package:flutterstylehint/model/user_model.dart';
import 'package:flutterstylehint/widget/widget_icon_button.dart';
import 'package:flutterstylehint/widget/widget_text.dart';

import '../model/post_model.dart';
import '../widget/widget_image_network.dart';

class DisplayDetailPost extends StatelessWidget {
  const DisplayDetailPost({
    Key? key,
    required this.postModel,
    required this.userModel,
  }) : super(key: key);

  final PostModel postModel;
  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ListView(
            children: [
              WidgetImageNetwork(urlImage: postModel.urlImage),
              panalIcon(),
              displayOwnerPost(context),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: WidgetText(
                  data: postModel.detail,
                  textStyle: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 20),
                          child: WidgetImage(
                            size: 24,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 10),
                          child: WidgetImage(path: 'images/girl.png',
                            size: 24,
                          ),
                        ),
                        WidgetImage(path: 'images/batman.png',
                          size: 24,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 250,
                      child: WidgetText(
                          data:
                              'detail comment detail comment detail comment detail comment'),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: WidgetForm(
                  label: 'Add Comment',
                  changeFunc: (p0) {},
                  suffixWidget: WidgetIconButton(
                    iconData: Icons.add_box,
                    pressFunc: () {},
                  ),
                ),
              )
            ],
          ),
          backButton()
        ],
      ),
    );
  }

  Row displayOwnerPost(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 4,
        ),
        userModel.urlAvatar.isEmpty
            ? const WidgetImage(
                size: 36,
              )
            : WidgetImageNetwork(
                urlImage: userModel.urlAvatar,
                width: 36,
                height: 36,
              ),
        const SizedBox(
          width: 4,
        ),
        WidgetText(
          data: userModel.displayName,
          textStyle: Theme.of(context).textTheme.titleMedium,
        ),
      ],
    );
  }

  Row panalIcon() {
    return Row(
      children: [
        WidgetIconButton(
          iconData: Icons.star_outline,
          pressFunc: () {},
        ),
        WidgetIconButton(
          iconData: Icons.maps_ugc_outlined,
          pressFunc: () {},
        ),
        WidgetIconButton(
          iconData: Icons.ios_share_outlined,
          pressFunc: () {},
        ),
      ],
    );
  }

  Positioned backButton() {
    return Positioned(
      top: 70,
      left: 10,
      child: WidgetIconButton(
        iconData: Icons.cancel,
        pressFunc: () {
          Get.back();
        },
        color: Colors.black.withOpacity(0.5),
        size: 36,
      ),
    );
  }
}
