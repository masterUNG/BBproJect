import 'package:flutter/material.dart';
import 'package:flutterstylehint/utility/app_service.dart';
import 'package:get/get.dart';

import '../states/display_detail_post.dart';
import '../utility/app_controller.dart';
import '../widget/widget_grid_box.dart';

class DiscoverBody extends StatefulWidget {
  const DiscoverBody({super.key});

  @override
  State<DiscoverBody> createState() => _DiscoverBodyState();
}

class _DiscoverBodyState extends State<DiscoverBody> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AppService().readPostForDiscover();
  }

  @override
  Widget build(BuildContext context) {
    return GetX(
        init: AppController(),
        builder: (AppController appController) {
          print(
              'discoveryModel -----> ${appController.discoverPostModels.length}');
          return appController.discoverPostModels.isEmpty
              ? const SizedBox()
              : GridView.builder(
                  itemCount: appController.discoverPostModels.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 3 / 5),
                  itemBuilder: (context, index) => WidgetGridBox(
                    postModel: appController.discoverPostModels[index],
                    tabFunc: () {
                      print('you tap index -----> $index');
                      Get.to(DisplayDetailPost(
                        postModel: appController.discoverPostModels[index],
                        userModel: appController.discoverUserModels[index],
                      ));
                    },
                  ),
                );
        });
  }
}
