import 'package:books_app/core/components/text_widget_common.dart';
import 'package:books_app/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MessageShowhelper {
  static void showDialogBox({
    required String dialogTitle,
    required String dialogContent,
    required String actionButtonName,
    required void Function()? buttonActionMethod,required BuildContext context,
  }) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        title: TextWidgetCommon(
          text: dialogTitle,
          fontSize: 18,
        ),
        content: TextWidgetCommon(
          fontSize: 16,
          text: dialogContent,
        ),
        actions: [
          commonTextButton(
            buttonActionMethod: () {
              context.pop();
            },
            buttonText: 'Cancel',
          ),
          commonTextButton(
            buttonActionMethod: buttonActionMethod,
            buttonText: actionButtonName,
          ),
        ],
      ),
    );
  }

  static void showSnackbar({
    required String snackBarContent,
    required BuildContext context,
  }) {
    ScaffoldMessenger.of(context)..hideCurrentSnackBar()..showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        content: TextWidgetCommon(
          text: snackBarContent,
          textColor: kDarkOrange.withOpacity(0.8),
          fontSize: 18,
        ),
        backgroundColor: kBlack,
        duration: const Duration(
          seconds: 1,
        ),
      ),
    );
  }
}

Widget commonTextButton({
  required String buttonText,
  required void Function()? buttonActionMethod,
}) {
  return TextButton(
    onPressed: buttonActionMethod,
    child: TextWidgetCommon(
      fontSize: 18,
      text: buttonText,
    ),
  );
}
