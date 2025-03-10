import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';

enum HttpMethod { get, post }

class DioClient {
  ///Singleton instance
  static final DioClient _instance = DioClient._internal();

  ///Dio instance
  late Dio _dio;

  /// Hive box for token storage
  late Box _authBox;

  ///factory constructor toreturn the same instance
  factory DioClient() {
    return _instance;
  }
  final _dioOptions = BaseOptions(
      baseUrl: '',
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      });

  ///private constructor
  DioClient._internal() {
    _dio = Dio(_dioOptions);
    _initializeInterceptors();
    _authBox = Hive.box('authBox');
  }

  void _initializeInterceptors() {
    _dio.interceptors.add(InterceptorsWrapper(onRequest:
        (RequestOptions options, RequestInterceptorHandler handler) async {
      final token = _authBox.get('accessToken');
      // if (token != null) {
      //   options.headers['Authorization'] = 'Bearer $token';
      // }

      ///
      log('Request: [${options.method}] ${options.path}');
      log('Headers: ${options.headers}');
      log('Data: ${options.data}');

      ///
      handler.next(options);
    }, onResponse: (Response response, ResponseInterceptorHandler handler) {
      log('Response: [${response.statusCode}] ${response.data}');
      handler.next(response); // Continue the response
    }, onError: (DioException e, ErrorInterceptorHandler handler) {
      log('Error: [${e.response?.statusCode}] ${e.response?.data['error']['message']}');
      if (e.response?.statusCode == 401) {
        // Handle token expiration (refresh token logic)
        handler.next(e);
      }
      if (e.response?.statusCode == 400) {
        handler.next(DioException(
          requestOptions: e.requestOptions,
          response: e.response,
          type: e.type,
          error: e.response?.data['error']['message']=='INVALID_LOGIN_CREDENTIALS'?'INVALID LOGIN CREDENTIALS':e.response?.data['error']['message'], // Manual error message
        ));
      }
    }));
  }

  Future<Response> apiRequestWithDio({
    required String url,
    HttpMethod requestType = HttpMethod.get,
    dynamic requestBody,
    Map<String, dynamic>? queryParameters,
    ResponseType responseType = ResponseType.json,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      final options = Options(
        headers: customHeaders,
        responseType: responseType,
      );

      switch (requestType) {
        case HttpMethod.get:
          final response = await _dio.get(url,
              queryParameters: queryParameters, options: options);
          return response;
        case HttpMethod.post:
          final response =
              await _dio.post(url, data: requestBody, options: options);
          return response;
      }
    } on DioException catch (e) {
      rethrow;
    } catch (e) {
      throw Exception('$requestType Request Failed: $e');
    }
  }
}
