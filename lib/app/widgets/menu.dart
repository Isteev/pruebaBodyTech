import 'package:bodytech/app/layout/layoutController.dart';
import 'package:bodytech/app/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class Menu extends StatelessWidget {
  const Menu({
    Key? key,
    required this.responsive,
  }) : super(key: key);

  final Responsive responsive;

  @override
  Widget build(BuildContext context) {
    String route = Get.currentRoute;
    LayoutController controller = Get.find();

    return Container(
      width: responsive.width,
      height: responsive.hp(8),
      decoration: BoxDecoration(color: Colors.grey.shade200),
      padding: EdgeInsets.symmetric(horizontal: responsive.wp(35)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              controller.goToProfile();
            },
            child: SvgPicture.asset(
              'assets/icons/user.svg',
              height: responsive.hp(5),
              color: route == '/profile'
                  ? const Color(0xFFff5890)
                  : const Color(0xFFcad8ff),
            ),
          ),
          GestureDetector(
            onTap: () {
              controller.goToData();
            },
            child: SvgPicture.asset(
              'assets/icons/menu.svg',
              color: route == '/dataList'
                  ? const Color(0xFFff5890)
                  : const Color(0xFFcad8ff),
              height: responsive.hp(4),
            ),
          )
        ],
      ),
    );
  }
}
