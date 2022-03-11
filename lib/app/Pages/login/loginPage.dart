import 'package:bodytech/app/pages/login/loginController.dart';
import 'package:bodytech/app/utils/responsive.dart';
import 'package:bodytech/app/widgets/button.dart';
import 'package:bodytech/app/widgets/formInput.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    LoginController controller = Get.find();

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
                'Iniciar Sesion',
                style: TextStyle(
                    color: Color(0xFF7894e4),
                    fontSize: responsive.wp(7),
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: responsive.hp(4),
              ),
              GetBuilder<LoginController>(
                  id: 'form',
                  builder: (_) {
                    return Column(
                      children: [
                        FormInput(
                          responsive: responsive,
                          controller: _.email,
                          placeholder: 'correo@gmail.com',
                          textInputType: TextInputType.emailAddress,
                          error: _.emailError,
                        ),
                        SizedBox(
                          height: responsive.hp(3),
                        ),
                        FormInput(
                            responsive: responsive,
                            controller: _.password,
                            error: _.passwordError,
                            placeholder: 'Contraseña',
                            obscureText: true,
                            type: 'password'),
                      ],
                    );
                  }),
              const Spacer(),
              Button(
                responsive: responsive,
                label: 'Iniciar Sesion',
                onPressed: () {
                  controller.login();
                },
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'No tienes cuenta?',
                    style: TextStyle(
                        color: const Color(0xFFbebebe),
                        fontSize: responsive.wp(4)),
                  ),
                  SizedBox(
                    width: responsive.wp(3),
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.goToRegister();
                    },
                    child: Text('Crear Cuenta',
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
