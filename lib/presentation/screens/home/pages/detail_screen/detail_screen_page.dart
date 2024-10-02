import 'package:flutter/material.dart';

import 'package:catbreeds/presentation/common/theme/theme_scaffold.dart';
import 'widgets/widget.dart';

class DetailScreenPage extends StatelessWidget {
  const DetailScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    Map<dynamic, dynamic> arguments =
        (ModalRoute.of(context)?.settings.arguments ?? <String, dynamic>{})
            as Map;

    return WidgetScaffold(
      title: arguments['title'],
      textAlign: TextAlign.center,
      body: const BodyDetailScreenPage(),
      bodyColor: Colors.white,
      fullScreen: true,
      gestureDetector: false,
      resizeToAvoidBottomInset: false,
      top: false,
      bottom: true,
    );
  }
}
