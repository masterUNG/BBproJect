import 'dart:io';

import 'package:flutterstylehint/model/user_model.dart';
import 'package:get/get.dart';

import '../model/post_model.dart';

class AppController extends GetxController {
  RxInt indexBody = 0.obs;
  RxString uidLogin = ''.obs;
  RxList<UserModel> currentUserModels = <UserModel>[].obs;
  RxList<File> files = <File>[].obs;
  RxString urlImage = ''.obs;
  RxList<PostModel> postPostModels = <PostModel>[].obs;
  RxList<PostModel> discoverPostModels = <PostModel>[].obs;
  RxList<UserModel> discoverUserModels = <UserModel>[].obs;
}
