import 'package:bodytech/app/pages/login/loginController.dart';
import 'package:get/instance_manager.dart';

class loginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
