import 'dart:convert';
import 'package:bodytech/app/models/authModel.dart';
import 'package:dio/dio.dart';

class Auth {
  final String baseUrl = 'https://identitytoolkit.googleapis.com/v1';
  final String firebaseToken = 'AIzaSyCFgsk27EiKTSBemiK94NcamdyV8OnAZMg';

  Future<AuthModel?> createUser(Map<String, String> auth) async {
    final Map<String, dynamic> Auth = {...auth, 'returnSecureToken': true};

    try {
      Response response = await Dio().post(
          '$baseUrl/accounts:signUp?key=$firebaseToken',
          data: json.encode(auth));

      return AuthModel.fromJson(response.data);
    } catch (e) {
      return null;
    }
  }

  Future<AuthModel?> login(Map<String, String> auth) async {
    final Map<String, dynamic> Auth = {...auth, 'returnSecureToken': true};

    try {
      Response response = await Dio().post(
          '$baseUrl/accounts:signInWithPassword?key=$firebaseToken',
          data: json.encode(auth));

      return AuthModel.fromJson(response.data);
    } catch (e) {
      return null;
    }
  }
}
