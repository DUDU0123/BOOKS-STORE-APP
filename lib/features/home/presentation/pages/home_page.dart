import 'package:books_app/core/components/common_message_widget.dart';
import 'package:books_app/core/components/text_widget_common.dart';
import 'package:books_app/core/constants/colors.dart';
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
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<BookBloc, BookState>(
      listener: (context, state) {
        if (state is BooksErrorState) {
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
            bookList: state.bookList,
            isShimmer: false,
          );
        }
        return commonMessageWidget();
      },
    ));
  }

  
}




