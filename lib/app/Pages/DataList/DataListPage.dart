import 'package:bodytech/app/Pages/DataList/DataListController.dart';
import 'package:bodytech/app/Pages/DataList/widgets/DataItem.dart';
import 'package:bodytech/app/layout/defaultLayout.dart';
import 'package:bodytech/app/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DataListPage extends StatelessWidget {
  const DataListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);

    return DefaultLayout(
        body: GetBuilder<DataListController>(
            id: 'list',
            builder: (_) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: responsive.wp(7)),
                child: Column(
                  children: [
                    SizedBox(
                      height: responsive.hp(5),
                    ),
                    Text(
                      'Informacion',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: responsive.wp(7),
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: responsive.hp(4),
                    ),
                    _.search
                        ? const Center(child: CircularProgressIndicator())
                        : SizedBox(
                            height: responsive.hp(70),
                            child: SingleChildScrollView(
                              child: Column(
                                children: _.data
                                    .map((e) => DataItem(
                                          responsive: responsive,
                                          data: e,
                                        ))
                                    .toList(),
                              ),
                            ),
                          )
                  ],
                ),
              );
            }));
  }
}
