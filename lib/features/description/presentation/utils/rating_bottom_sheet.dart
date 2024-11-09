import 'package:books_app/core/components/common_container_button.dart';
import 'package:books_app/core/components/text_widget_common.dart';
import 'package:books_app/core/constants/colors.dart';
import 'package:books_app/core/constants/height_width.dart';
import 'package:books_app/core/services/token_storage.dart';
import 'package:books_app/features/description/presentation/bloc/cubit/description_cubit.dart';
import 'package:books_app/features/home/domain/entity/book_entity.dart';
import 'package:books_app/features/home/presentation/bloc/bloc/book_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

Future<dynamic> ratingBottomSheet({
  required BuildContext context,
  required BookEntity? book,
}) {
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
        decoration: BoxDecoration(
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
            BlocBuilder<DescriptionCubit, DescriptionState>(
              builder: (context, state) {
                final int starCount = state.starCount;
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    5,
                    (index) {
                      return IconButton(
                        onPressed: () async {
                          context.read<DescriptionCubit>().setStarCount(count: index+1);
                        },
                        icon:  Icon(
                          Icons.star,
                          color:  index < starCount ? kYellow : kGrey,
                          size: 40,
                        ),
                      );
                    },
                  ),
                );
              },
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
                    onTap: () async {
                      final userToken = await TokenStorage.readToken();

                      if (book != null &&
                          book.bookId != null &&
                          userToken != null) {
                        context.read<BookBloc>().add(
                              AddBookRatingEvent(
                                startCount: 3,
                                bookId: book.bookId!,
                                userToken: userToken,
                              ),
                            );
                      }
                      context.pop();
                    },
                  )
              // BlocBuilder<DescriptionCubit, DescriptionState>(
              //   builder: (context, state) {
              //     return CommonContainerButton(
              //       buttonText: "Submit",
              //       onTap: () async {
              //         final userToken = await TokenStorage.readToken();

              //         if (book != null &&
              //             book.bookId != null &&
              //             userToken != null) {
              //           context.read<BookBloc>().add(
              //                 AddBookRatingEvent(
              //                   startCount: 3,
              //                   bookId: book.bookId!,
              //                   userToken: userToken,
              //                 ),
              //               );
              //         }
              //       },
              //     );
              //   },
              // ),
            )
          ],
        ),
      );
    },
  );
}
