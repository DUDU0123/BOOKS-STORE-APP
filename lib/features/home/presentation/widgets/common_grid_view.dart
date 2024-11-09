import 'package:books_app/features/home/domain/entity/book_entity.dart';
import 'package:books_app/features/home/presentation/widgets/book_preview_container.dart';
import 'package:books_app/features/home/presentation/widgets/build_shimmer.dart';
import 'package:flutter/material.dart';

class CommonGridView extends StatelessWidget {
  const CommonGridView({
    super.key,
    this.bookList = const [],
    required this.isShimmer,this.controller,
  });
  final List<BookEntity> bookList;
  final bool isShimmer;
  final ScrollController? controller;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: controller,
      padding: EdgeInsets.symmetric(
          horizontal: isShimmer ? 10 : 0, vertical: isShimmer ? 20 : 10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: isShimmer ? 0.7 : 0.5,
        crossAxisSpacing: isShimmer ? 3 : 0,
        mainAxisSpacing: isShimmer ? 3 : 0,
      ),
      itemCount: isShimmer ? 10 : bookList.length,
      itemBuilder: (context, index) {
        return isShimmer
            ? buildShimmer()
            : BookPreviewContainer(
                backgroundColor: Colors.accents[index],
                book: bookList[index],
              );
      },
    );
  }
}
