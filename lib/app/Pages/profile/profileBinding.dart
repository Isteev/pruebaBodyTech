import 'package:bodytech/app/Pages/profile/profileController.dart';
import 'package:bodytech/app/layout/layoutController.dart';
import 'package:get/instance_manager.dart';

class ProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(() => ProfileController());
    Get.lazyPut<LayoutController>(() => LayoutController());
  }
}
