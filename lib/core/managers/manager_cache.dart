// import 'dart:developer';

// import 'package:shared_preferences/shared_preferences.dart';

// class Cache {
//   static Future<bool> saveData(String key, dynamic value) async {
//     final prefs = await SharedPreferences.getInstance();
//     if (value is int) {
//       return prefs.setInt(key, value);
//     } else if (value is String) {
//       return prefs.setString(key, value);
//     } else if (value is bool) {
//       return prefs.setBool(key, value);
//     } else {
//       log("Invalid Type");
//       return false;
//     }
//   }

//   static Future<dynamic> readData(String key) async {
//     final prefs = await SharedPreferences.getInstance();
//     dynamic obj = prefs.get(key);
//     return obj;
//   }

//   static Future<bool> deleteData(String key) async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.remove(key);
//   }

//   static Future<bool> clearCache() async {
//     final prefs = await SharedPreferences.getInstance();
//     return await prefs.clear();
//   }
// }
