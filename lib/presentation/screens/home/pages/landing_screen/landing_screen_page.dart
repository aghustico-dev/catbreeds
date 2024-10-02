import 'package:flutter/material.dart';

import 'package:catbreeds/presentation/common/theme/theme_scaffold.dart';
import 'widgets/widget.dart';

class LandingScreenPage extends StatelessWidget {
  const LandingScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const WidgetScaffold(
      title: 'Catbreeds',
      textAlign: TextAlign.center,
      body: BodyLandingScreenPage(),
      bodyColor: Colors.white,
      fullScreen: true,
      gestureDetector: true,
      resizeToAvoidBottomInset: true,
      top: true,
      bottom: true,
    );
  }
}
