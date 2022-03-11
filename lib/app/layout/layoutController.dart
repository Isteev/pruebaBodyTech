import 'package:bodytech/app/routes/appPages.dart';
import 'package:get/get.dart';

class LayoutController extends GetxController {
  goToProfile() {
    Get.offNamed(Routes.PROFILE);
  }

  goToData() {
    Get.offNamed(Routes.DATALIST);
  }
}
