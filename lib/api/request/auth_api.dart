import 'dart:io';
import 'package:dio/dio.dart';
import 'package:letmegrab/api/dio_client.dart';
import 'package:letmegrab/utils/constant.dart';

class AuthApi {
  final DioClient dioClient;

  AuthApi({required this.dioClient});

  Future<Response?> getNews({String? phoneCode, String? phone, String? token, role}) async {
    try {
      final Response? response = await dioClient
          .get(Endpoints.news, queryParameters: {"q": "all", "apiKey": "99e1f146f8624bf48eea59a630d15ce6"});
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
