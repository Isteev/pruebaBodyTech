import 'package:bodytech/app/Pages/DataList/DataListController.dart';
import 'package:bodytech/app/models/dataModel.dart';
import 'package:bodytech/app/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DataDetail extends StatelessWidget {
  const DataDetail({Key? key, required this.data}) : super(key: key);

  final DataModel data;

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);

    return Container(
      color: Colors.black12,
      child: Stack(
        children: [
          //
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: responsive.width,
              constraints: BoxConstraints(maxHeight: responsive.hp(40)),
              padding: EdgeInsets.symmetric(
                  vertical: responsive.hp(4), horizontal: responsive.wp(6)),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(responsive.wp(5)),
                      topRight: Radius.circular(responsive.wp(5)))),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    data.title,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: responsive.wp(4),
                        fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: responsive.hp(2),
                  ),
                  Text(
                    data.body,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: responsive.wp(4),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: responsive.hp(2),
                  ),
                  Text(
                    'user id: ${data.userId.toString()}',
                    style: TextStyle(
                        color: const Color(0xFF7894e4),
                        fontSize: responsive.wp(4),
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
