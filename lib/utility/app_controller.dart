import 'package:flutterstylehint/model/user_model.dart';
import 'package:get/get.dart';

class AppController extends GetxController {
  RxInt indexBody = 0.obs;
  RxString uidLogin = ''.obs;
  RxList<UserModel> currentUserModels = <UserModel>[].obs;
}
