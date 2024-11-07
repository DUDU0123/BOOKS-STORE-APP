import 'package:books_app/features/authors/presentation/pages/authors_page.dart';
import 'package:books_app/features/home/presentation/pages/home_page.dart';
import 'package:books_app/features/main_nav/presentation/bloc/bottom_nav/bottom_navigation_cubit.dart';
import 'package:books_app/features/main_nav/presentation/widgets/bottom_navbar.dart';
import 'package:books_app/features/main_nav/presentation/widgets/main_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final pages = [
  const HomePage(),
  const AuthorsPage(),
];

class MainEntryPage extends StatelessWidget {
  const MainEntryPage({super.key});
  @override
  Widget build(BuildContext context) {
    final currentIndex =
        context.watch<BottomNavigationCubit>().state.currentIndex;
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            MainAppBar(
              currentIndex: currentIndex,
            ),
          ];
        },
        body: pages[currentIndex],
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
