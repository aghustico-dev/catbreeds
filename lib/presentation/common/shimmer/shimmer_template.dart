import 'package:flutter/material.dart';
import 'package:catbreeds/presentation/common/shimmer/shimmer.dart' as widgets;
import 'package:catbreeds/utils/constants/const_shimmer_gradient.dart';

Widget shimmerBuilder(Widget skeleton) {
  return widgets.Shimmer(
    linearGradient: shimmerGradient,
    child: widgets.ShimmerLoading(isLoading: true, child: skeleton),
  );
}
