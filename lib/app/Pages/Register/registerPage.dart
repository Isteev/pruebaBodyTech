import 'package:bodytech/app/Pages/Register/registerController.dart';
import 'package:bodytech/app/utils/responsive.dart';
import 'package:bodytech/app/widgets/button.dart';
import 'package:bodytech/app/widgets/formInput.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    RegisterController controller = Get.find();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: responsive.wp(8), vertical: responsive.hp(4)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: responsive.hp(10),
              ),
              Text(
                'Crear Cuenta',
                style: TextStyle(
                    color: const Color(0xFF7894e4),
                    fontSize: responsive.wp(7),
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: responsive.hp(4),
              ),
              GetBuilder<RegisterController>(builder: (_) {
                return Column(
                  children: [
                    FormInput(
                      responsive: responsive,
                      controller: _.email,
                      placeholder: 'correo@gmail.com',
                      textInputType: TextInputType.emailAddress,
                    ),
                    SizedBox(
                      height: responsive.hp(3),
                    ),
                    FormInput(
                        responsive: responsive,
                        controller: _.password,
                        placeholder: 'Contraseña',
                        obscureText: true,
                        type: 'password'),
                  ],
                );
              }),
              const Spacer(),
              Button(
                responsive: responsive,
                label: 'Crear Cuenta',
                onPressed: () {
                  controller.createUser();
                },
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'ya tienes cuenta?',
                    style: TextStyle(
                        color: const Color(0xFFbebebe),
                        fontSize: responsive.wp(4)),
                  ),
                  SizedBox(
                    width: responsive.wp(3),
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.goToLogin();
                    },
                    child: Text('Iniciar sesion',
                        style: TextStyle(
                            color: const Color(0xFF80a3f4),
                            fontWeight: FontWeight.w500,
                            fontSize: responsive.wp(4))),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
