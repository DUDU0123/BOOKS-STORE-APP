import 'package:books_app/core/components/text_widget_common.dart';
import 'package:books_app/core/constants/colors.dart';
import 'package:flutter/material.dart';

Widget bookPrice({
  required double bookPrice,
}) {
  return TextWidgetCommon(
    text: "\u20B9 $bookPrice",
    fontWeight: FontWeight.w500,
    fontSize: 22,
  );
}

Widget bookRating({
  required double bookRating,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      const Icon(
        Icons.star,
        size: 24,
        color: Color.fromARGB(255, 239, 217, 15),
      ),
      TextWidgetCommon(
        text: bookRating.toString(),
        fontSize: 18,
      ),
    ],
  );
}

Widget bookAuthor({
  required String bookAuthorName,required BuildContext context,
}) {
  return TextWidgetCommon(
    text: bookAuthorName,
    overflow: TextOverflow.ellipsis,
    fontSize: 16,
    textColor: Theme.of(context).colorScheme.onPrimary,
    fontWeight: FontWeight.normal,
  );
}

Widget bookTitle({
  required String bookName,
}) {
  return TextWidgetCommon(
    text: bookName,
    overflow: TextOverflow.ellipsis,
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );
}