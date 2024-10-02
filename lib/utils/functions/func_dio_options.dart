import 'package:dio/dio.dart';

import 'package:catbreeds/utils/constants/const_app_global.dart' as utils;

Dio getOptions() {
  var dio = Dio(BaseOptions());
  dio.options.headers['Accept'] = utils.GlobalConstants.applicationJson;
  dio.options.headers['Content-Type'] = utils.GlobalConstants.applicationJson;
  return dio;
}
