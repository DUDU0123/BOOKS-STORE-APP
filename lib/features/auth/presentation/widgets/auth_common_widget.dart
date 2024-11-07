import 'package:books_app/core/components/app_logo.dart';
import 'package:books_app/core/components/common_container_button.dart';
import 'package:books_app/core/constants/height_width.dart';
import 'package:books_app/core/enums/enums.dart';
import 'package:books_app/features/auth/presentation/widgets/common_auth_text_field.dart';
import 'package:flutter/material.dart';

class AuthCommonWidget extends StatelessWidget {
  const AuthCommonWidget({
    super.key,
    required this.usernameController,
    required this.passwordController,
    this.confirmPasswordController,
    required this.pageType,
  });

  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final TextEditingController? confirmPasswordController;
  final PageType pageType;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth(context: context),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            const AppLogo(),
            const Spacer(),
            CommonAuthTextField(
              focusNode: FocusNode(),
              controller: usernameController,
              labelText: "Username",
              hintText: "Enter your username",
            ),
            kHeight17,
            CommonAuthTextField(
              focusNode: FocusNode(),
              isObscureAndIconNeed: true,
              controller: passwordController,
              labelText: "Password",
              hintText: "Enter your password",
            ),
            if (pageType == PageType.register) ...[
              kHeight17,
              CommonAuthTextField(
                focusNode: FocusNode(),
                isObscureAndIconNeed: true,
                controller: confirmPasswordController,
                labelText: "Confirm Password",
                hintText: "Confirm your password",
              ),
            ],
            kHeight20,
            CommonContainerButton(
              buttonText: pageType == PageType.register ? "Register" : "Login",
            ),
            const Spacer(),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
