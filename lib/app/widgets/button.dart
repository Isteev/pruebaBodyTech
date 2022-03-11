import 'package:bodytech/app/utils/responsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({
    Key? key,
    required this.responsive,
    required this.label,
    required this.onPressed,
    this.width,
    this.height,
  }) : super(key: key);

  final Responsive responsive;
  final String label;
  final Function onPressed;

  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width ?? double.infinity,
        height: height ?? responsive.hp(6),
        decoration: BoxDecoration(
            color: const Color(0xFFff5890),
            borderRadius: BorderRadius.circular(responsive.wp(10))),
        child: CupertinoButton(
            padding: const EdgeInsets.all(0),
            child: Text(
              label,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: responsive.wp(5),
                  fontWeight: FontWeight.w500),
            ),
            onPressed: () => onPressed()));
  }
}
