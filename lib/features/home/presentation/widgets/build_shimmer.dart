import 'package:books_app/core/components/shimmer_widget.dart';
import 'package:flutter/material.dart';

Widget buildShimmer() {
  return ShimmerWidget.rectangular(
    height: 0,
    shapeBorder: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(0),
    ),

  );
}
