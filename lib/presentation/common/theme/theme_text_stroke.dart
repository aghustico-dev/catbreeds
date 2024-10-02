import 'package:flutter/material.dart';

import 'package:catbreeds/presentation/common/theme/theme_text_scale_size.dart'
    as widgets;

class WidgetTextStroke extends StatelessWidget {
  final String texto;
  final String fontFamily;
  final double fontSize;
  final double strokeWidth;
  final AlignmentGeometry alignment;
  const WidgetTextStroke(
      {super.key,
      required this.texto,
      required this.fontFamily,
      required this.fontSize,
      required this.strokeWidth,
      required this.alignment});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: alignment,
      children: [
        Text(texto,
            style: TextStyle(
                fontFamily: fontFamily,
                fontSize: fontSize,
                fontWeight: FontWeight.w900,
                foreground: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = strokeWidth
                  ..color = const Color(0xFF3B3B3B)),
            textAlign: TextAlign.center,
            textScaler: widgets.ScaleSize.textScaler(context)),
        Text(texto,
            style: TextStyle(
                fontFamily: fontFamily,
                fontSize: fontSize,
                fontWeight: FontWeight.w900,
                color: Colors.white),
            textAlign: TextAlign.center,
            textScaler: widgets.ScaleSize.textScaler(context)),
      ],
    );
  }
}
