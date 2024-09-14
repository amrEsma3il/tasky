import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
// import '../../../../../service_locator.dart' as di;
import 'api_consumer.dart';
import 'app_interceptors.dart';
import 'end_points.dart';

class DioConsumer extends ApiConsumer {
  final Dio client;
final AppIntercepters appIntercepters;
final LogInterceptor logInterceptor;
  DioConsumer({required this.appIntercepters,required this.logInterceptor, required this.client}) {
    (client.httpClientAdapter as IOHttpClientAdapter).createHttpClient =
      () {
        final HttpClient client = HttpClient();
        client.badCertificateCallback = 
            (X509Certificate cert, String host, int port) => true;
        return client;
    };

    client.options
      ..baseUrl = EndPoints.baseUrl
      ..responseType = ResponseType.plain
      ..followRedirects = false;
    client.interceptors.add(appIntercepters);
    if (kDebugMode) {
      client.interceptors.add(logInterceptor);
    }
  }

  @override
  Future<dynamic> get(String path,
      {Map<String, dynamic>? queryParameters,
      Map<String, String>? headers}) async {

      final response = await client.get(
        path,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
        ),
      );
      return response.data;
  
  }

  @override
  Future<dynamic> post(String path,
      {Map<String, dynamic>? body,
      bool formDataIsEnabled = false,
      Map<String, String>? headers,
      Map<String, dynamic>? queryParameters}) async {
      final response = await client.post(path,
          data: formDataIsEnabled ? FormData.fromMap(body!) : body,
          options: Options(
            headers: headers,
          ),
          queryParameters: queryParameters);

      return response.data;
 
  }

  @override
  Future<dynamic> delete(String path,
      {Map<String, dynamic>? body,
      Map<String, String>? headers,
      Map<String, dynamic>? queryParameters}) async {
      final response = await client.delete(path,
          data: body,
          options: Options(
            headers: headers,
          ),
          queryParameters: queryParameters);
      return response.data;

  }

  @override
  Future<dynamic> put(String path,
      {Map<String, dynamic>? body,
      Map<String, String>? headers,
      bool responseIsParsing = true,
      Map<String, dynamic>? queryParameters}) async {
      final response = await client.put(
        path,
        data: body,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
        ),
      );

      return response.data;
   
  }
  



}
