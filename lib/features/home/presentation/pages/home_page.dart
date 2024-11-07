import 'package:books_app/config/routes/app_routes_name.dart';
import 'package:books_app/core/components/shimmer_widget.dart';
import 'package:books_app/core/constants/app_keys.dart';
import 'package:books_app/core/constants/colors.dart';
import 'package:books_app/core/constants/height_width.dart';
import 'package:books_app/features/description/presentation/pages/book_description.dart';
import 'package:books_app/features/home/presentation/widgets/book_detail_small_container_widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.5,
      ),
      itemCount: 10,
      itemBuilder: (context, index) {
        // return buildShimmer();
        return GestureDetector(
          onTap: () {
            navigatorKey.currentState?.push(MaterialPageRoute(builder: (context) {
              return BookDescription( color: Colors.accents[index],);
            },));
            context.pushNamed(AppRoutesName.descriptionPage, extra: Colors.accents[index]);
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
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQQ6EO4caRrtQkHq2YBXezwxuOiYNP4rD1evg&s',
                  ),
                ),
                kHeight10,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    bookTitle(
                      bookName: "Rich Dad Poor Dad",
                    ),
                    bookAuthor(
                      context: context,
                      bookAuthorName: "Robert T. Kiyosaki",
                    ),
                    bookRating(bookRating: 4.5),
                    kHeight5,
                    bookPrice(bookPrice: 200.00),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    ));
  }
}

Widget buildShimmer() {
  return ShimmerWidget.rectangular(
    height: 0,
    shapeBorder: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(0),
    ),
  );
}
