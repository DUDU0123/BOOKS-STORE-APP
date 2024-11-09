import 'package:books_app/core/components/common_message_widget.dart';
import 'package:books_app/core/constants/height_width.dart';
import 'package:books_app/core/utils/message_show_helper.dart';
import 'package:books_app/features/authors/presentation/bloc/author/auhtor_bloc.dart';
import 'package:books_app/features/authors/presentation/widgets/author_container_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthorsPage extends StatelessWidget {
  const AuthorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuhtorBloc, AuhtorState>(
        listener: (context, state) {
          if (state is AuthorsErrorState) {
            MessageShowhelper.showSnackbar(snackBarContent: state.message, context: context);
          }
        },
        builder: (context, state) {
          if (state is AuthorsLoadedState) {
            return ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            itemBuilder: (context, index) {
              return authorContainerTile(
                  avatarColor: Colors.accents[index], context: context);
            },
            separatorBuilder: (context, index) => kHeight10,
            itemCount: state.authorList.length,
          );
          }
          return commonMessageWidget();
        },
      ),
    );
  }
}
