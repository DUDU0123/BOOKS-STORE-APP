import 'package:books_app/core/components/text_field_common.dart';
import 'package:books_app/core/components/text_widget_common.dart';
import 'package:books_app/core/constants/colors.dart';
import 'package:books_app/core/constants/height_width.dart';
import 'package:books_app/features/auth/presentation/bloc/authentication/authentication_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommonAuthTextField extends StatelessWidget {
  const CommonAuthTextField({
    super.key,
    required this.controller,
    this.isObscureAndIconNeed = false,
    required this.labelText,
    required this.hintText,
    required this.focusNode,
  });
  final TextEditingController? controller;
  final String labelText;
  final String hintText;
  final bool isObscureAndIconNeed;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    focusNode.addListener(() {
      context.read<AuthenticationBloc>().add(
            FieldFocusChangeEvent(
              controller: controller,
              isFieldFocused: focusNode.hasFocus,
            ),
          );
    });

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
            final isFocused = state.focusStates?[controller] ?? false;
            return TextWidgetCommon(
              text: labelText,
              textColor: isFocused ? kOrange : ksmallDarkGrey,
            );
          },
        ),
        kHeight5,
        BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
            return TextFieldCommon(
              focusNode: focusNode,
              suffixIcon: isObscureAndIconNeed
                  ? GestureDetector(
                      onTap: () {
                        context
                            .read<AuthenticationBloc>()
                            .add(PasswordVisibilityChangeEvent());
                      },
                      child: Icon(
                        state.isHided
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                      ))
                  : null,
              obscureText: state.isHided ? isObscureAndIconNeed : false,
              controller: controller,
              hintText: hintText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(13),
                borderSide: const BorderSide(
                  color: kGrey,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(13),
                borderSide: const BorderSide(
                  color: kOrange,
                  width: 2,
                ),
              ),
              
            );
          },
        ),
      ],
    );
  }
}
