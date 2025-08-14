import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Api {
  final Dio dio = Dio();

  Future<dynamic> get({required String url, @required String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({
        'Authorization': 'Bearer $token',
        // 'Content-Type': 'application/x-www-form-urlencoded',
      });
    }
    var response = await dio.get(url, options: Options(headers: headers));
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception(
        'there was an error with status code = ${response.statusCode}',
      );
    }
  }

  Future<dynamic> post({
    required String url,
    @required dynamic body,
    @required String? token,
  }) async {
    Map<String, String> headers = {};

    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    var response = await Dio().post(
      url,
      data: body,
      options: Options(headers: headers),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> data = response.data;
      return data;
    } else {
      throw Exception(
        'there was an error with status code = ${response.statusCode}',
      );
    }
  }

  Future<dynamic> put({
    required String url,
    @required dynamic body,
    @required String? token,
  }) async {
    Map<String, String> headers = {};

    if (token != null) {
      headers.addAll({
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/x-www-form-urlencoded',
      });
    }
    var response = await dio.put(
      url,
      data: body,
      options: Options(headers: headers),
    );
    print(url);
    print(response);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = response.data;
      return data;
    } else {
      throw Exception(
        'there was an error with status code = ${response.statusCode}',
      );
    }
  }
}
