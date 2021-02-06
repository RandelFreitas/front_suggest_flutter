import 'package:dio/dio.dart';
import '../main.dart';

Dio getDio() {
  Dio dio = new Dio();
  var token = sp.getString('token');

  dio.options.headers["authorization"] = "Bearer $token";

  return dio;
}