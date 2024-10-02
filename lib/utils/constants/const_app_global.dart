import 'package:flutter/material.dart';

class GlobalConstants {
  static const double paddingMinWidth = 0.03;
  static const double paddingWidth = 0.06;
  static const double paddingHeight = 0.005;
  static const int connectTimeout = 5000;
  static const int receiveTimeout = 5000;
  static const Color primary = Color(0xFF101820);
  static const Color secondary = Color(0xFFEA1341);
  static const String textPlain = 'text/plain';
  static const String applicationJson = 'application/json';

  // static const String apiPaypal = "https://api.paypal.com"; // PROD
  static const String apiPaypal = "https://api.sandbox.paypal.com"; // DEV
  static const String paypalClienteId =
      "AfwxXm2SLm2eCSeJtWu1GJOci6Bep3vri97tVDcbAEpCWZvdKPi4CVc2B4kOWogM8W7pNHSKQVHIyZ7s";
  static const String paypalSecretKey =
      "EPprApNeYC77uNgpwGLzP1fhtRHgDfVp5w3LMEGEnGmh1CR242VmughAvd5oWn11zRz2sr6v9y4kinxe";

//PayU
  // static const String payuApiKey = "ZPk6QzyGP54ogayiybmjNbR9lU";
  // static const String payuApiLogin = "2y7F0ljeZQxCyEh";
  // static const String payuPublicKey = "PKhl7ZWh8985uLt52M6H9RngEr";

  // static const String linkPath = "https://servicio-rest.binquito.app/app"; // -- Producción
  static const String linkPath =
      "https://apirest-charcoal.lopezquito.com/app/api"; // -- Desarrollo
}

class ApiEndpoint {
  static const apiMaestro = "${GlobalConstants.linkPath}/v1/maestro";
  static const apiUsuario = "${GlobalConstants.linkPath}/v1/usuario";
  static const apiAuth = "${GlobalConstants.linkPath}/v1/auth";
}
