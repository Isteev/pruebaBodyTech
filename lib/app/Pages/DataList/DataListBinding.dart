import 'package:bodytech/app/Pages/DataList/DataListController.dart';
import 'package:bodytech/app/layout/layoutController.dart';
import 'package:get/get.dart';

class DataListBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DataListController>(() => DataListController());
    Get.lazyPut<LayoutController>(() => LayoutController());
  }
}
