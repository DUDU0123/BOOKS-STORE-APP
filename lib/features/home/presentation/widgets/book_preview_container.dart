import 'dart:developer';

import 'package:books_app/config/routes/app_routes_name.dart';
import 'package:books_app/core/constants/colors.dart';
import 'package:books_app/core/constants/height_width.dart';
import 'package:books_app/features/authors/presentation/bloc/author/author_bloc.dart';
import 'package:books_app/features/description/presentation/utils/book_desc_model.dart';
import 'package:books_app/features/home/domain/entity/book_entity.dart';
import 'package:books_app/features/home/presentation/widgets/book_detail_small_container_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class BookPreviewContainer extends StatelessWidget {
  const BookPreviewContainer({
    super.key,
    required this.book,
    required this.backgroundColor,
  });
  final BookEntity book;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    if (book.bookAuthorId != null && book.bookId!=null) {
      context
          .read<AuthorBloc>()
          .add(GetOneAuthorEvent(authorId: book.bookAuthorId!, bookId: book.bookId!));
    }
    log(book.bookAuthorId ?? "");
    return GestureDetector(
      onTap: () {
        context.pushNamed(
          AppRoutesName.descriptionPage,
          extra: BookDescModel(
            color: backgroundColor,
            book: book,
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          border: Border(
            bottom: BorderSide(
              color: kGrey.withOpacity(0.4),
            ),
            right: BorderSide(
              color: kGrey.withOpacity(0.4),
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Image.network(
                book.bookCoverPictureURL ??
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQQ6EO4caRrtQkHq2YBXezwxuOiYNP4rD1evg&s',
              ),
            ),
            kHeight10,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                bookTitle(
                  isPreview: true,
                  bookName: book.bookTitle ?? "",
                ),
                BlocBuilder<AuthorBloc, AuthorState>(
                  builder: (context, state) {
                    return bookAuthor(
                      context: context,
                      bookAuthorName: (state is AuthorsLoadedState)? state.authorMap!=null?state.authorMap![book.bookId]?.name??'Unknown':'Unknown':"Unknown",
                    );
                  },
                ),
                bookRating(
                    bookRating: book.bookRatings?.length.toDouble() ?? 0.0),
                kHeight5,
                bookPrice(bookPrice: book.bookPrice?.toDouble() ?? 0.0),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
