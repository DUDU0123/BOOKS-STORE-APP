import 'package:books_app/core/components/text_widget_common.dart';
import 'package:books_app/core/constants/colors.dart';
import 'package:flutter/material.dart';

Widget commonMessageWidget() {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextWidgetCommon(
              textAlign: TextAlign.center,
              text: "Data Loading...\nPlease Wait...",fontWeight: FontWeight.bold,
              textColor: kGrey.withOpacity(0.8),
            ),
          ],
        ),
      );
  }