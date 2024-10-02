import 'package:flutter/material.dart';
import 'package:catbreeds/presentation/common/common.dart' as widgets;

class BodySplashScreenPage extends StatefulWidget {
  const BodySplashScreenPage({super.key});

  @override
  State<BodySplashScreenPage> createState() => _BodySplashScreenPageState();
}

class _BodySplashScreenPageState extends State<BodySplashScreenPage> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          buildLogo(context),
          Positioned(
            bottom: 50,
            child: Image.asset('assets/images/png/cat_splash.png',
                width: 180, fit: BoxFit.contain),
          )
        ],
      ),
    );
  }

  Widget buildLogo(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          "Catbreeds",
          style: TextStyle(
            fontFamily: 'SourceSansPro',
            fontSize: 30,
            fontWeight: FontWeight.w900,
            color: Colors.grey.shade800,
          ),
          textScaler: widgets.ScaleSize.textScaler(context),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
