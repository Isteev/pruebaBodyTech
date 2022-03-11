import 'package:bodytech/app/utils/responsive.dart';
import 'package:bodytech/app/widgets/menu.dart';
import 'package:flutter/material.dart';

class DefaultLayout extends StatelessWidget {
  const DefaultLayout({Key? key, required this.body}) : super(key: key);

  final Widget body;

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);

    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Stack(
            children: [
              Positioned(
                  top: -responsive.hp(85),
                  left: -responsive.hp(24.7),
                  child: Container(
                    height: responsive.height,
                    width: responsive.height,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(responsive.height),
                        color: const Color(0xFF597bfa)),
                  )),
              body,
            ],
          ),
          Spacer(),
          Menu(responsive: responsive)
        ],
      )),
    );
  }
}
