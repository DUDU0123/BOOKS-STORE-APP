import 'package:books_app/core/components/text_widget_common.dart';
import 'package:books_app/core/constants/colors.dart';
import 'package:flutter/material.dart';

Widget ratingShowWidget({required double rating}) {
  return Container(
    padding: const EdgeInsets.only(left: 5, right: 10, top: 2, bottom: 2),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: kGrey)),
    child: Row(
      children: [
        const Icon(
          Icons.star,
          color: kYellow,
        ),
        TextWidgetCommon(
          text: rating.toString(),
        )
      ],
    ),
  );
}

