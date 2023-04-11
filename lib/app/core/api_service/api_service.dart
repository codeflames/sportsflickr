import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiService {
  BaseOptions options = BaseOptions(
    baseUrl: kReleaseMode
        ? 'http://www.boredapi.com/api'
        : 'https://staging.api.attenvo.com/api/v1',
    headers: {},
  );

  late Dio dio;
  late Dio cachedDio;
  ApiService._();

  void onInit() {
    dio = Dio(options);
    (dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    dio
        // ..interceptors.add(TokenExpiredInterceptor(loadingService))
        // ..interceptors.add(TokenErrorInterceptor())
        // ..interceptors.add(TokenCheckInterceptor())
        // ..interceptors.add(TokenSaveInterceptor())
        .interceptors
        .add(PrettyDioLogger(
      request: true,
      requestBody: true,
      responseBody: true,
      // requestHeader: true,
    ));

    // cachedDio = Dio()
    //   ..interceptors.add(DioCacheManager(
    //     CacheConfig(
    //       defaultMaxAge: Duration(hours: 4),
    //       defaultMaxStale: Duration(days: 7),
    //     ),
    //   ).interceptor)
    //   ..interceptors.add(PrettyDioLogger(responseBody: false));
    // if (!kDebugMode) {
    //   dio.addSentry(captureFailedRequests: true);
    // }
  }
}

// ApiService provider
final apiServiceProvider =
    Provider<ApiService>((ref) => ApiService._()..onInit());
