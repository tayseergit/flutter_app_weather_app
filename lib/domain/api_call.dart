import 'package:dio/dio.dart';

class ApiCall {
  static Dio _dio = Dio();
  static Dio _dioDaily = Dio();
  static String baseurl = "https://api.openweathermap.org/data/2.5/";
  static String baseurlDaily = "https://api.openweathermap.org/data/2.5/";
  static void initData() {
    _dio = Dio(BaseOptions(
      baseUrl: baseurl,
      receiveDataWhenStatusError: true,
      receiveTimeout: Duration(seconds: 60),
      connectTimeout: Duration(seconds: 60),
    ));
    _dioDaily = Dio(BaseOptions(
      baseUrl: baseurlDaily,
      receiveDataWhenStatusError: true,
      receiveTimeout: Duration(seconds: 60),
      connectTimeout: Duration(seconds: 60),
    ));
  }

  static Future<Response> getData(
      {required String url, Map<String, dynamic>? queryParms}) async {
    return await _dio.get(url, queryParameters: queryParms);
  }

  static Future<Response> getDataDaily(
      {required String url, Map<String, dynamic>? queryParms}) async {
    return await _dioDaily.get(url, queryParameters: queryParms);
  }
}
