import 'package:books_app/core/components/text_widget_common.dart';
import 'package:books_app/core/constants/colors.dart';
import 'package:books_app/core/constants/height_width.dart';
import 'package:flutter/material.dart';

Widget authorContainerTile({
  required Color? avatarColor,
  required BuildContext context,
}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    width: screenWidth(context: context),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: kWhite,
      border: Border.all(color: kGrey),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundColor: avatarColor,
          radius: 20,
          child: const TextWidgetCommon(text: "A"),
        ),
        kWidth10,
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextWidgetCommon(
                text: "Robert t Kiyosaki",
                fontSize: 18,
                textColor: kBlack,
                fontWeight: FontWeight.w500,
              ),
              TextWidgetCommon(
                maxLines: 2,
                text:
                    "Robert t KiyosakiRobert Robert t KiyosakiRobert t KiyosakiRobert t KiyosakiRobert t KiyosakiRobert t KiyosakiRobert t KiyosakiRobert t KiyosakiRobert t Kiyosaki",
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
