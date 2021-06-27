import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dana/core/config/config.dart';
import 'package:dana/core/error/exceptions.dart';
import 'package:dana/core/generics.dart';
import 'package:dio/dio.dart';
import 'package:downloads_path_provider/downloads_path_provider.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';

import '../../client.dart';


abstract class DanaRemoteDataSource {
  Future<T> get<T, K>(String url);
  Future<T> post<T, K>(Map body, String url);
}
class DanaRemoteDataSourceImpl implements DanaRemoteDataSource {
  @override
  Future<T> get<T, K>(String url) async {
    try {
      Response response = await Client.dio.get(url);
      if (response.statusCode == 200) {
        if (T == bool)
          return true as T;
        return Generics.fromJson<T, K>(response.data);
      }
    } on DioError catch (e) {
      throw ServerException(e.response.statusCode, url);
    }
  }

  @override
  Future<T> post<T, K>(Map body, String url) async {
    // TODO: implement post
    try {
      Response response = await Client.dio.post(url, data: body);
      if (response.statusCode == 200) {
        if (T == bool) return true as T;
        return Generics.fromJson<T, K>(response.data);
      }
    } on DioError catch (e) {
      throw ServerException(e.response.statusCode, url);
    }
  }
}
