import 'package:flutter/material.dart';

final shimmerGradient = LinearGradient(
  colors: [
    Colors.grey.shade400,
    Colors.grey.shade300,
    Colors.grey.shade400,
  ],
  stops: const [
    0.1,
    0.3,
    0.4,
  ],
  begin: const Alignment(-1.0, -0.3),
  end: const Alignment(1.0, 0.3),
  tileMode: TileMode.clamp,
);
