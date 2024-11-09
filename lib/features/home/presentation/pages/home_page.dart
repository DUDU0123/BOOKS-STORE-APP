import 'package:books_app/core/components/common_message_widget.dart';
import 'package:books_app/core/utils/message_show_helper.dart';
import 'package:books_app/features/home/presentation/bloc/bloc/book_bloc.dart';
import 'package:books_app/features/home/presentation/widgets/common_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  int _currentPage = 1;

  @override
  void initState() {
    super.initState();
    context.read<BookBloc>().add(GetAllBooksEvent(page: _currentPage));
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent) {
        _loadNextPage();
      }
    });
  }

  void _loadNextPage() {
    // Increase the page count and trigger the event
    _currentPage++;
    context.read<BookBloc>().add(GetAllBooksEvent(page: _currentPage));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<BookBloc, BookState>(
      listener: (context, state) {
        if (state is BooksErrorState) {
          print(state.message);
          MessageShowhelper.showSnackbar(
              snackBarContent: state.message, context: context);
        }
      },
      builder: (context, state) {
        if (state is BooksLoadingState) {
          return const CommonGridView(
            isShimmer: true,
          );
        }
        if (state is BooksLoadedState) {
          return CommonGridView(
            controller: _scrollController,
            bookList: state.bookList,
            isShimmer: false,
          );
        }
        return commonMessageWidget();
      },
    ));
  }
}
