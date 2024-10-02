// import 'package:intl/intl.dart';

bool isNullOrEmpty(dynamic value) {
  return (["", "null", null, false, [], List.empty(), 0].contains(value));
}

// String fechaddMMMyyyHm(String fecha) {
//   var dt = DateTime.parse(fecha);
//   var formatter = DateFormat('dd MMM yyyy - hh:mm:ss a');
//   return formatter.format(dt);
// }

// String obtenerFechaLarga() {
//   var date = DateTime.now();
//   // print(DateTime.now());
//   var formatter = DateFormat('yyyyMMddhhmmss');
//   return formatter.format(date);
// }
