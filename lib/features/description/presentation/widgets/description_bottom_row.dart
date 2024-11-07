import 'package:books_app/core/components/text_widget_common.dart';
import 'package:books_app/core/constants/colors.dart';
import 'package:books_app/core/constants/height_width.dart';
import 'package:books_app/features/description/presentation/utils/rating_bottom_sheet.dart';
import 'package:flutter/material.dart';

class DescriptionBottomRow extends StatelessWidget {
  const DescriptionBottomRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      width: screenWidth(context: context),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        border: const Border(
          top: BorderSide(
            color: kGrey,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const TextWidgetCommon(
            text: "\u20B9200.00",
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: kDarkOrange,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {
              ratingBottomSheet(context: context);
            },
            child: const TextWidgetCommon(
              text: "Add rating",
              textColor: kWhite,
            ),
          ),
        ],
      ),
    );
  }
}
