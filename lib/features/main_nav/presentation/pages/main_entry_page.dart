import 'package:books_app/features/authors/presentation/bloc/author/author_bloc.dart';
import 'package:books_app/features/authors/presentation/pages/authors_page.dart';
import 'package:books_app/features/home/presentation/bloc/bloc/book_bloc.dart';
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

class MainEntryPage extends StatefulWidget {
  const MainEntryPage({super.key});

  @override
  State<MainEntryPage> createState() => _MainEntryPageState();
}

class _MainEntryPageState extends State<MainEntryPage> {
  @override
  void initState() {
    context.read<AuthorBloc>().add(GetAllAuthorsEvent());
    super.initState();
  }
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
