import 'package:flutter/material.dart';

class GlobalConstants {
  static const double paddingMinWidth = 0.03;
  static const double paddingWidth = 0.06;
  static const double paddingHeight = 0.005;
  static const Color primary = Color(0xFF101820);
  static const Color secondary = Color(0xFFEA1341);
  static const String applicationJson = 'application/json';

  static const String linkPath = "https://api.thecatapi.com/v1";
  static const String apiKey =
      "live_99Qe4Ppj34NdplyLW67xCV7Ds0oSLKGgcWWYnSzMJY9C0QOu0HUR4azYxWkyW2nr";
}

class ApiEndpoint {
  static const api = GlobalConstants.linkPath;
}
