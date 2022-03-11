import 'package:bodytech/app/Pages/profile/profileController.dart';
import 'package:bodytech/app/layout/defaultLayout.dart';
import 'package:bodytech/app/utils/responsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    ProfileController controller = Get.find();

    return DefaultLayout(
      body: SizedBox(
        width: responsive.width,
        height: responsive.hp(70),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: responsive.hp(5),
            ),
            Text(
              'Perfil',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: responsive.wp(7),
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: responsive.hp(5),
            ),
            Obx(() {
              return GestureDetector(
                  onTap: () {
                    controller.openCamera();
                  },
                  child: CircleAvatar(
                    backgroundColor: Color(0xffc5dbff),
                    maxRadius: responsive.hp(15),
                    child: controller.image.value.path == ''
                        ? Text('Agregar imagen de perfil')
                        : Container(
                            height: responsive.hp(50),
                            width: responsive.hp(50),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(200),
                                image: DecorationImage(
                                    image: FileImage(controller.image.value),
                                    fit: BoxFit.fitWidth)),
                          ),
                  ));
            }),
            SizedBox(
              height: responsive.hp(5),
            ),
            Text(
              Hive.box('userData').get('email'),
              style: TextStyle(
                  color: const Color(0xFF80a3f4),
                  fontSize: responsive.wp(5),
                  fontWeight: FontWeight.w500),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                controller.goToLogin();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Cerrar Sesion',
                    style: TextStyle(
                        fontSize: responsive.wp(4),
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    width: responsive.wp(2),
                  ),
                  SvgPicture.asset(
                    'assets/icons/logout.svg',
                    color: Color(0xFFff5890),
                    height: responsive.hp(4),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
