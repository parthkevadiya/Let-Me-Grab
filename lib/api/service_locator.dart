import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:letmegrab/api/dio_client.dart';
import 'package:letmegrab/api/request/auth_api.dart';
import 'package:letmegrab/api/request/home_api.dart';
import 'package:letmegrab/api/services/auth_service.dart';
import 'package:letmegrab/api/services/home_service.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  getIt.registerSingleton(Dio());
  getIt.registerSingleton(DioClient(getIt<Dio>()));
  getIt.registerSingleton(AuthApi(dioClient: getIt<DioClient>()));
  getIt.registerSingleton(AuthService(getIt.get<AuthApi>()));
  getIt.registerSingleton(HomeApi(dioClient: getIt<DioClient>()));
  getIt.registerSingleton(HomeService(getIt.get<HomeApi>()));
}
