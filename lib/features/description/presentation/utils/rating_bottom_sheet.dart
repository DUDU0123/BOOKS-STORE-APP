import 'package:books_app/core/components/common_container_button.dart';
import 'package:books_app/core/components/text_widget_common.dart';
import 'package:books_app/core/constants/colors.dart';
import 'package:books_app/core/constants/height_width.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Future<dynamic> ratingBottomSheet({required BuildContext context}) {
  return showModalBottomSheet(
    isDismissible: false,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
      topLeft: Radius.circular(20),
      topRight: Radius.circular(20),
    )),
    context: context,
    builder: (context) {
      return Container(
        decoration:  BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            )),
        height: screenHeight(context: context) / 2.5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            kHeight15,
            GestureDetector(
              onTap: () {
                context.pop();
              },
              child: Container(
                height: 10,
                width: screenWidth(context: context) / 4,
                decoration: BoxDecoration(
                  color: kGrey,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            kHeight25,
            const TextWidgetCommon(
              text: "Add rating",
              fontWeight: FontWeight.bold,
              fontSize: 26,
            ),
            kHeight15,
             Divider(
              thickness: 1,
              color: kGrey.withOpacity(0.5),
            ),
            kHeight15,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                5,
                (index) {
                  return IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.star,
                      color: kGrey,
                      size: 40,
                    ),
                  );
                },
              ),
            ),
            kHeight15,
            Divider(
              thickness: 1,
              color: kGrey.withOpacity(0.5),
            ),
            kHeight10,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CommonContainerButton(
                buttonText: "Submit",
                onTap: () {},
              ),
            )
          ],
        ),
      );
    },
  );
}
