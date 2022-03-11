import 'package:bodytech/app/Pages/Register/registerController.dart';
import 'package:get/instance_manager.dart';

class RegisterBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(() => RegisterController());
  }
}
