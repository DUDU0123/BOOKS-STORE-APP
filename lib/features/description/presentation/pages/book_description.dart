import 'dart:developer';
import 'package:books_app/core/components/text_widget_common.dart';
import 'package:books_app/core/constants/colors.dart';
import 'package:books_app/core/constants/height_width.dart';
import 'package:books_app/features/authors/presentation/bloc/author/author_bloc.dart';
import 'package:books_app/features/description/presentation/utils/book_desc_model.dart';
import 'package:books_app/features/description/presentation/widgets/description_bottom_row.dart';
import 'package:books_app/features/description/presentation/widgets/rating_show_widget.dart';
import 'package:books_app/features/home/presentation/widgets/book_detail_small_container_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class BookDescription extends StatelessWidget {
  const BookDescription({super.key, required this.bookDescModel});
  final BookDescModel? bookDescModel;

  @override
  Widget build(BuildContext context) {
    log("${bookDescModel?.book.bookPublishedDate}");
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                color: bookDescModel?.color.withOpacity(0.5),
              ),
              height: screenHeight(context: context) / 2.8,
              width: screenWidth(context: context),
              child: Image.network(
                bookDescModel?.book.bookCoverPictureURL ??
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQQ6EO4caRrtQkHq2YBXezwxuOiYNP4rD1evg&s',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, bottom: 80, top: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  kHeight15,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: bookTitle(
                          isPreview: false,
                          bookName: bookDescModel?.book.bookTitle ?? 'No Name',
                        ),
                      ),
                      kWidth10,
                      ratingShowWidget(
                          rating:
                              bookDescModel?.book.bookStarCount?.toDouble() ??
                                  4.0),
                    ],
                  ),
                  BlocBuilder<AuthorBloc, AuthorState>(
                    builder: (context, state) {
                      return bookAuthor(
                        context: context,
                        bookAuthorName:
                            "by ${(state is AuthorsLoadedState) ? state.authorMap != null ? state.authorMap![bookDescModel?.book.bookId]?.name ?? 'Unknown' : 'Unknown' : "Unknown"}",
                      );
                    },
                  ),
                  kHeight10,
                  TextWidgetCommon(
                    text: "Published date: ${convertDate(dateTime: bookDescModel?.book.bookPublishedDate)}",
                    overflow: TextOverflow.ellipsis,
                    fontSize: 12,
                    textColor: kBlack.withOpacity(0.7),
                    fontWeight: FontWeight.normal,
                  ),
                  kHeight10,
                  TextWidgetCommon(
                    text: bookDescModel?.book.bookDescription ?? "",
                    fontSize: 16,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: DescriptionBottomRow(
        book: bookDescModel?.book,
      ),
    );
  }
}


String convertDate({required DateTime? dateTime}){
  if (dateTime!=null) {
    String formattedDate = DateFormat('MMM dd, yyyy').format(dateTime);
  return formattedDate;
  } else {
    return "Jan 01, 2024";
  }
}