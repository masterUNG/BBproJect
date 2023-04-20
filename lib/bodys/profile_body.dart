import 'package:flutter/material.dart';
import 'package:flutterstylehint/utility/app_dialoge.dart';
import 'package:flutterstylehint/utility/app_service.dart';
import 'package:flutterstylehint/widget/widget_button.dart';
import 'package:get/get.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return WidgetButton(
      label: 'Signout',
      pressFunc: () {
        AppDialog(context: context).normalDialog(
          title: 'SignOut ?',
          subTitle: 'Please Confirm SignOut',
          firstAction: WidgetButton(
            label: 'SignOut',
            pressFunc: () {
              Get.back;
              AppService().processSignOut();
            },
          ),
        );
      },
    );
  }
}
