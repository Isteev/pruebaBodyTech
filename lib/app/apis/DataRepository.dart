import 'package:bodytech/app/models/dataModel.dart';
import 'package:dio/dio.dart';

class DataRepository {
  Future<List<DataModel>> getData() async {
    List<DataModel> data = [];

    try {
      Response response =
          await Dio().get('https://jsonplaceholder.typicode.com/posts/');

      data = (response.data as List).map((e) => DataModel.fromJson(e)).toList();
    } catch (e) {}

    return data;
  }

  Future<DataModel> getDataById(String id) async {
    late DataModel data;

    try {
      Response response =
          await Dio().get('https://jsonplaceholder.typicode.com/posts/$id');

      data = DataModel.fromJson(response.data);
    } catch (e) {}

    return data;
  }
}
