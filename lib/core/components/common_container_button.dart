import 'package:books_app/core/components/text_widget_common.dart';
import 'package:books_app/core/constants/colors.dart';
import 'package:books_app/core/constants/height_width.dart';
import 'package:flutter/material.dart';

class CommonContainerButton extends StatelessWidget {
  const CommonContainerButton({
    super.key,
    required this.buttonText, this.onTap,
  });
  final String buttonText;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        width: screenWidth(context: context),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: kDarkOrange,
        ),
        child: Center(
          child: TextWidgetCommon(
            textColor: kWhite,
            fontWeight: FontWeight.w500,
            text: buttonText,
          ),
        ),
      ),
    );
  }
}
