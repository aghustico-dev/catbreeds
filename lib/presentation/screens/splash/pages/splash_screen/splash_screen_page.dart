import 'package:flutter/material.dart';

import 'package:catbreeds/presentation/common/theme/theme_scaffold.dart';
import 'widgets/widget.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const WidgetScaffold(
      body: BodySplashScreenPage(),
      bodyColor: Colors.white,
      fullScreen: true,
      resizeToAvoidBottomInset: true,
      top: false,
      bottom: false,
    );
  }
}
