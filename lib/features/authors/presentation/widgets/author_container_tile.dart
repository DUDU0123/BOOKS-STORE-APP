import 'package:books_app/core/components/text_widget_common.dart';
import 'package:books_app/core/constants/colors.dart';
import 'package:books_app/core/constants/height_width.dart';
import 'package:books_app/features/authors/domain/entity/author_entity.dart';
import 'package:flutter/material.dart';

Widget authorContainerTile({
  required Color? avatarColor,
  required BuildContext context,
  required AuthorEntity author,
}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    width: screenWidth(context: context),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      // color: kWhite,
      border: Border.all(color: kGrey),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundColor: avatarColor,
          radius: 20,
          child: TextWidgetCommon(
            text: author.name != null ? author.name![0] ?? 'U' : 'U',
          ),
        ),
        kWidth10,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextWidgetCommon(
                text: author.name ?? "No Author",
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
              TextWidgetCommon(
                maxLines: 2,
                text: author.biography ?? "No Bio",
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
