import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';

import 'package:catbreeds/utils/util.dart' as utils;

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  HttpOverrides.global = utils.AppHttpOverrides();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(const CatBreedsApp()));
}

class CatBreedsApp extends StatelessWidget {
  const CatBreedsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      builder: (BuildContext context, Widget? widget) {
        return MediaQuery(
            data: MediaQuery.of(context)
                .copyWith(textScaler: const TextScaler.linear(1.1)),
            child: widget!);
      },
      initialRoute: utils.LocalRouting.splashPage,
      routes: utils.Routes().routes,
    );
  }
}
