import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterstylehint/utility/app_controller.dart';
import 'package:flutterstylehint/utility/app_dialoge.dart';
import 'package:flutterstylehint/utility/app_service.dart';
import 'package:flutterstylehint/widget/widget_button.dart';
import 'package:flutterstylehint/widget/widget_form.dart';
import 'package:flutterstylehint/widget/widget_icon_button.dart';
import 'package:flutterstylehint/widget/widget_image.dart';
import 'package:flutterstylehint/widget/widget_text.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../model/post_model.dart';

class AddNewPost extends StatefulWidget {
  const AddNewPost({super.key});

  @override
  State<AddNewPost> createState() => _AddNewPostState();
}

class _AddNewPostState extends State<AddNewPost> {
  String? post, detail;
  Timestamp? timestamp;

  @override
  void initState() {
    super.initState();
    timestamp = Timestamp.fromDate(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const WidgetText(data: 'Add New Post'),
      ),
      body: GetX(
          init: AppController(),
          builder: (AppController appController) {
            print('files ----> ${appController.files.length}');
            return ListView(
              children: [
                buildimage(appController, context),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    WidgetText(
                      data:
                          AppService().timeStampToString(timestamp: timestamp!),
                      textStyle: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    WidgetForm(
                      label: 'Post',
                      changeFunc: (p0) {
                        post = p0.trim();
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    WidgetForm(
                      label: 'Detail',
                      changeFunc: (p0) {
                        detail = p0.trim();
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    WidgetButton(
                      label: 'Add New Post',
                      pressFunc: () async {
                        if (appController.files.isEmpty) {
                          Get.snackbar('No Photo ?', 'Please Take Photo');
                        } else if ((post?.isEmpty ?? true) ||
                            (detail?.isEmpty ?? true)) {
                          Get.snackbar(
                              'Have Space ?', 'Please Fill every blank');
                        } else {
                          AppService()
                              .processUploadImage(path: 'post')
                              .then((value) async {
                            print(
                                'urlImage ----> ${appController.urlImage.value}');

                            PostModel postModel = PostModel(
                                post: post!,
                                detail: detail!,
                                urlImage: appController.urlImage.value,
                                timestamp: timestamp!);

                            await FirebaseFirestore.instance
                                .collection('user')
                                .doc(appController.currentUserModels.last.uid)
                                .collection('post')
                                .doc()
                                .set(postModel.toMap()).then((value) {
                                  Get.back();
                                });
                          });
                        }
                      },
                    ),
                  ],
                )
              ],
            );
          }),
    );
  }

  Row buildimage(AppController appController, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            appController.files.isEmpty
                ? const WidgetImage(
                    path: 'images/image.png',
                    size: 200,
                  )
                : Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                        image: FileImage(appController.files.last),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
            Positioned(
              bottom: 0,
              right: 0,
              child: WidgetIconButton(
                iconData: Icons.camera,
                pressFunc: () {
                  AppDialog(context: context).normalDialog(
                    title: 'Take Photo Image',
                    subTitle: 'Please Take Photo by camera or gallary',
                    pathImage: 'images/image.png',
                    firstAction: WidgetButton(
                      label: 'Camera',
                      pressFunc: () {
                        Get.back();
                        AppService()
                            .processTakePhoto(imageSource: ImageSource.camera);
                      },
                    ),
                    secondAction: WidgetButton(
                      label: 'Gallary',
                      pressFunc: () {
                        Get.back();
                        AppService()
                            .processTakePhoto(imageSource: ImageSource.gallery);
                      },
                    ),
                  );
                },
                size: 36,
                color: Colors.amber,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
