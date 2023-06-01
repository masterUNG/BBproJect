// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutterstylehint/widget/widget_image.dart';
import 'package:get/get.dart';

import 'package:flutterstylehint/model/demo_model.dart';
import 'package:flutterstylehint/utility/app_controller.dart';
import 'package:flutterstylehint/widget/widget_image_network.dart';
import 'package:flutterstylehint/widget/widget_text.dart';

class ShowGridView extends StatefulWidget {
  const ShowGridView({
    Key? key,
    required this.demoModels,
  }) : super(key: key);

  final List<DemoModel> demoModels;

  @override
  State<ShowGridView> createState() => _ShowGridViewState();
}

class _ShowGridViewState extends State<ShowGridView> {
  AppController appController = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const ScrollPhysics(),
      shrinkWrap: true,
      itemCount: widget.demoModels.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 1 / 2),
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(2.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WidgetImageNetwork(urlImage: widget.demoModels[index].url),
            SizedBox(
              width: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    Icons.star_border_outlined,
                    color: Colors.grey,
                  ),
                  WidgetText(
                      data: widget.demoModels[index].star.toString()),
                  WidgetImage(path: 'images/profile.png',size: 24,),
                ],
              ),
            ),
            WidgetText(
              data: widget.demoModels[index].name,
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            WidgetText(data: widget.demoModels[index].tags),
          ],
        ),
      ),
    );
  }
}
