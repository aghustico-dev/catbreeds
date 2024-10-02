import 'package:catbreeds/core/error/error_failures.dart';

class ResponseEntity {
  Failure? errores;
  dynamic response;
  ResponseEntity({this.errores, this.response});
}
