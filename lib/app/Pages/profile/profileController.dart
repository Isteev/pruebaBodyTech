import 'dart:io';

import 'package:bodytech/app/routes/appPages.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  Rx<File> image = File('').obs;

  @override
  void onInit() {
    super.onInit();

    String? imagePath = Hive.box('userData').get('image');

    if (imagePath != null) {
      this.image.value = File(imagePath);
    }
  }

  openCamera() async {
    XFile? image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image != null) {
      Hive.box('userData').put('image', image.path);

      this.image.value = File(image.path);
    }
  }

  goToLogin() {
    Hive.box('userData').clear();
    Get.offAllNamed(Routes.LOGIN);
  }
}
