import 'package:bodytech/app/utils/responsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FormInput extends StatefulWidget {
  FormInput(
      {Key? key,
      required this.responsive,
      required this.controller,
      this.placeholder = '',
      this.textInputType = TextInputType.text,
      this.obscureText = false,
      this.suffix,
      this.type = 'text',
      this.error = false})
      : super(key: key);

  final Responsive responsive;
  final String placeholder;
  final String type;
  final TextEditingController controller;
  final TextInputType textInputType;
  final Widget? suffix;
  final bool error;

  bool obscureText;

  @override
  State<FormInput> createState() => _FormInputState();
}

class _FormInputState extends State<FormInput> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.responsive.hp(7),
      child: CupertinoTextField(
        padding: EdgeInsets.symmetric(horizontal: widget.responsive.wp(4)),
        keyboardType: widget.textInputType,
        controller: widget.controller,
        obscuringCharacter: '*',
        obscureText: widget.obscureText,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
                color: widget.error
                    ? const Color(0xFFfd5990)
                    : const Color(0xFFd8dff9),
                width: widget.responsive.wp(0.5)),
            borderRadius: BorderRadius.circular(widget.responsive.wp(10))),
        placeholder: widget.placeholder,
        suffix: widget.type == 'password'
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    widget.obscureText = !widget.obscureText;
                  });
                },
                child: Padding(
                  padding: EdgeInsets.only(right: widget.responsive.wp(5)),
                  child: SvgPicture.asset('assets/icons/eye.svg'),
                ),
              )
            : widget.suffix,
      ),
    );
  }
}
