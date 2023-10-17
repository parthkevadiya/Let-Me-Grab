import 'package:dio/dio.dart';
import 'package:letmegrab/api/dio_exceptions.dart';
import 'package:letmegrab/api/request/auth_api.dart';
import 'package:letmegrab/model/news_model.dart';

class AuthService {
  final AuthApi authApi;

  AuthService(this.authApi);

  Future<NewsModel?> getNews({String? phoneCode, String? phone, String? token}) async {
    try {
      final response = await authApi.getNews();
      if (response != null) {
        return NewsModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
    return null;
  }
}
