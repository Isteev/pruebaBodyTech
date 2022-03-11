import 'package:bodytech/app/Pages/DataList/DataListController.dart';
import 'package:bodytech/app/models/dataModel.dart';
import 'package:bodytech/app/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DataItem extends StatelessWidget {
  const DataItem({
    Key? key,
    required this.responsive,
    required this.data,
  }) : super(key: key);

  final Responsive responsive;
  final DataModel data;

  @override
  Widget build(BuildContext context) {
    DataListController controller = Get.find();

    return GestureDetector(
      onTap: () async {
        await controller.getItemDetail(data.id.toString());
        controller.showDetail(context);
      },
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(vertical: responsive.hp(1)),
        padding: EdgeInsets.symmetric(
            vertical: responsive.hp(2), horizontal: responsive.wp(4)),
        decoration: BoxDecoration(
            color: const Color(0xffc5dbff),
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(0, 101, 190, 0.14),
                spreadRadius: 0.5,
                blurRadius: 2,
                offset: Offset(0, 2),
              ),
            ],
            borderRadius: BorderRadius.circular(responsive.wp(5))),
        child: Text(
          data.title.toUpperCase(),
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: responsive.wp(4)),
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.clip,
        ),
      ),
    );
  }
}
