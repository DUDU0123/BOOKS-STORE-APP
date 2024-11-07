import 'package:books_app/core/constants/height_width.dart';
import 'package:books_app/features/authors/presentation/widgets/author_container_tile.dart';
import 'package:flutter/material.dart';

class AuthorsPage extends StatelessWidget {
  const AuthorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        itemBuilder: (context, index) {
          return authorContainerTile(avatarColor: Colors.accents[index], context: context);
        },
        separatorBuilder: (context, index) => kHeight10,
        itemCount: 10,
      ),
    );
  }
}
