import 'package:dio/dio.dart';

import 'package:catbreeds/utils/constants/const_app_global.dart' as utils;
// import 'package:catbreeds/core/services/service_security.dart' as service;

Dio getOptions() {
  var dio = Dio(BaseOptions(
      // connectTimeout:
      //     const Duration(milliseconds: utils.GlobalConstants.connectTimeout),
      // receiveTimeout:
      //     const Duration(milliseconds: utils.GlobalConstants.receiveTimeout),
      ));
  dio.options.headers['Accept'] = 'application/json';
  dio.options.headers['Content-Type'] = utils.GlobalConstants.applicationJson;
  return dio;
}

Dio dioPaypal(String accessToken) {
  var dio = Dio();
  dio.options.headers['Accept'] = 'application/json';
  dio.options.headers['Authorization'] = 'Bearer $accessToken';
  return dio;
}

Future<Dio> dioInterceptos() async {
  // final service.SecurityService securityService = service.SecurityService();

  // var token = await securityService.obtenerAuthToken();
  var dio = Dio();
  // dio.options.headers['Authorization'] = token.response;

  return dio
    ..interceptors.add(
      InterceptorsWrapper(
        onRequest:
            (RequestOptions options, RequestInterceptorHandler handler) async {
          if (options.contentType == null) {
            final dynamic data = options.data;
            final String? contentType;
            if (data is FormData) {
              contentType = Headers.multipartFormDataContentType;
            } else if (data is Map) {
              contentType = Headers.formUrlEncodedContentType;
            } else if (data is String) {
              contentType = Headers.jsonContentType;
            } else if (data != null) {
              contentType = Headers.textPlainContentType;
            } else {
              contentType = null;
            }
            options.contentType = contentType;
          }
          return handler.next(options);
        },
        onResponse: (Response response, ResponseInterceptorHandler handler) {
          return handler.next(response);
        },
        onError: (DioException e, ErrorInterceptorHandler handler) async {
          if (e.response?.statusCode == 403 || e.response?.statusCode == 401) {
            // await refreshToken( context );
          }
          return handler.next(e);
        },
      ),
    );
}
