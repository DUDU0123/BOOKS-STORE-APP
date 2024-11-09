import 'package:books_app/core/components/text_widget_common.dart';
import 'package:books_app/core/constants/colors.dart';
import 'package:books_app/core/constants/height_width.dart';
import 'package:books_app/features/description/presentation/utils/book_desc_model.dart';
import 'package:books_app/features/description/presentation/widgets/description_bottom_row.dart';
import 'package:books_app/features/description/presentation/widgets/rating_show_widget.dart';
import 'package:books_app/features/home/presentation/widgets/book_detail_small_container_widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const data = '''
Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.

The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.
''';

class BookDescription extends StatelessWidget {
  const BookDescription({super.key, required this.bookDescModel});
  final BookDescModel? bookDescModel;

  @override
  Widget build(BuildContext context) {
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
                      ratingShowWidget(rating: 4.0),
                    ],
                  ),
                  bookAuthor(
                    context: context,
                    bookAuthorName:
                        "by ${bookDescModel?.book.bookTitle ?? 'No Name'}",
                  ),
                  kHeight10,
                  TextWidgetCommon(
                    text: "Published date: Apr 11,2017",
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
      floatingActionButton: const DescriptionBottomRow(),
    );
  }
}
