import 'package:books_app/config/theme/theme_manager/theme_manager_cubit.dart';
import 'package:books_app/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  final double width;
  final double height;
  final Widget? child;
  final ShapeBorder? shapeBorder;
  const ShimmerWidget.rectangular({
    super.key,
    this.width = double.infinity,
    required this.height,
    this.child,
    this.shapeBorder,
  });
  const ShimmerWidget.circular({
    super.key,
    this.width = double.infinity,
    required this.height,
    this.child,
    this.shapeBorder,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeManagerCubit, ThemeManagerState>(
      builder: (context, state) {
        return Shimmer.fromColors(
          baseColor: state.themeMode == ThemeMode.dark
              ? const Color.fromARGB(255, 21, 21, 21)
              : kWhite,
          highlightColor: state.themeMode == ThemeMode.dark
              ? const Color.fromARGB(144, 32, 31, 31)
              : const Color.fromARGB(255, 218, 217, 217),
          child: Container(
            height: height,
            width: width,
            decoration: ShapeDecoration(
                color: Colors.grey,
                shape: shapeBorder ?? const RoundedRectangleBorder()),
            child: child,
          ),
        );
      },
    );
  }
}
