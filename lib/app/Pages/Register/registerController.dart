import 'package:bodytech/app/apis/auth.dart';
import 'package:bodytech/app/models/authModel.dart';
import 'package:bodytech/app/routes/appPages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class RegisterController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool emailError = false;
  bool passwordError = false;

  goToLogin() {
    Get.offNamed(Routes.LOGIN);
  }

  goToProfile() {
    Get.offNamed(Routes.PROFILE);
  }

  bool validateForm() {
    emailError = !GetUtils.isEmail(email.text);
    passwordError = !(password.text.length > 5);

    update(['form']);

    if (!emailError && !passwordError) {
      return true;
    }

    return false;
  }

  createUser() async {
    if (validateForm()) {
      AuthModel? result = await Auth().createUser({
        'email': email.text,
        'password': password.text,
      });

      if (result != null) {
        var box = Hive.box('userData');
        box.put('token', result.idToken);
        box.put('email', result.email);
        goToProfile();
      } else {
        Get.snackbar("Datos Erroneos", "Esta cuenta ya existe",
            snackPosition: SnackPosition.BOTTOM,
            colorText: Colors.white,
            backgroundColor: Colors.black87);
      }
    }
  }
}
