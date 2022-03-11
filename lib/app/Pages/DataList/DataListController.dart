import 'package:bodytech/app/Pages/DataList/widgets/DataDetail.dart';
import 'package:bodytech/app/apis/DataRepository.dart';
import 'package:bodytech/app/models/dataModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DataListController extends GetxController {
  DataRepository dataRepository = DataRepository();

  bool search = true;
  List<DataModel> data = [];

  late DataModel dataDetail;

  @override
  void onInit() async {
    super.onInit();

    data = await dataRepository.getData();
    search = false;
    update(['list']);
  }

  getItemDetail(String id) async {
    dataDetail = await dataRepository.getDataById(id);
  }

  showDetail(context) {
    showBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (_) {
          return DataDetail(data: dataDetail);
        });
  }
}
