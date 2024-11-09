import 'package:books_app/config/routes/app_routes_name.dart';
import 'package:books_app/config/routes/router.dart';
import 'package:books_app/config/theme/theme_manager/theme_manager_cubit.dart';
import 'package:books_app/core/components/text_field_common.dart';
import 'package:books_app/core/components/text_widget_common.dart';
import 'package:books_app/core/constants/colors.dart';
import 'package:books_app/core/constants/height_width.dart';
import 'package:books_app/features/auth/presentation/bloc/authentication/authentication_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class MainAppBar extends StatelessWidget {
  const MainAppBar({
    super.key,
    required this.currentIndex,
  });

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: TextWidgetCommon(
        text: currentIndex == 0 ? "BooksBox" : "Authors",
        fontWeight: FontWeight.w500,
        fontSize: 30,
      ),
      actions: [
        IconButton(
          onPressed: () {
            context.read<AuthenticationBloc>().add(LogOutUserEvent(context: context));
          },
          icon: const Icon(
            Icons.power_settings_new_outlined,
            color: kBlack,
          ),
        ),
        IconButton(
          onPressed: () {
            context.read<ThemeManagerCubit>().changeTheme();
          },
          icon: BlocBuilder<ThemeManagerCubit, ThemeManagerState>(
            builder: (context, state) {
              return Icon(
                state.themeMode == ThemeMode.dark ? Icons.light : Icons.sunny,
                color: state.themeMode == ThemeMode.dark
                    ? kYellow
                    : kOrange.withOpacity(0.8),
              );
            },
          ),
        ),
      ],
      bottom: currentIndex == 0
          ? PreferredSize(
              preferredSize: const Size.fromHeight(48),
              child: Container(
                height: 40,
                margin: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: kGrey.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    kWidth10,
                    Icon(
                      Icons.search,
                      color: kGrey,
                    ),
                    kWidth5,
                    Expanded(
                      child: TextFieldCommon(
                        cursorColor: kGrey,
                        hintText: "Search...",
                        border: InputBorder.none,
                      ),
                    ),
                  ],
                ),
              ),
            )
          : null,
    );
  }
}
