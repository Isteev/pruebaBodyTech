import 'package:bodytech/app/Pages/DataList/DataListBinding.dart';
import 'package:bodytech/app/Pages/DataList/DataListPage.dart';
import 'package:bodytech/app/Pages/Register/registerBinding.dart';
import 'package:bodytech/app/Pages/Register/registerPage.dart';
import 'package:bodytech/app/Pages/profile/profileBinding.dart';
import 'package:bodytech/app/Pages/profile/profilePage.dart';
import 'package:bodytech/app/pages/login/loginBinding.dart';
import 'package:bodytech/app/pages/login/loginPage.dart';
import 'package:get/get.dart';
part './appRoutes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
        name: Routes.LOGIN,
        page: () => const LoginPage(),
        transition: Transition.fadeIn,
        binding: loginBinding()),
    GetPage(
        name: Routes.REGISTER,
        page: () => const RegisterPage(),
        transition: Transition.fadeIn,
        binding: RegisterBinding()),
    GetPage(
        name: Routes.PROFILE,
        page: () => const ProfilePage(),
        transition: Transition.fadeIn,
        binding: ProfileBinding()),
    GetPage(
        name: Routes.DATALIST,
        page: () => const DataListPage(),
        transition: Transition.fadeIn,
        binding: DataListBindings()),
  ];
}
