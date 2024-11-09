import 'package:books_app/config/routes/app_routes_name.dart';
import 'package:books_app/config/routes/router.dart';
import 'package:books_app/core/components/app_logo.dart';
import 'package:books_app/core/components/common_container_button.dart';
import 'package:books_app/core/components/text_widget_common.dart';
import 'package:books_app/core/constants/colors.dart';
import 'package:books_app/core/constants/height_width.dart';
import 'package:books_app/core/enums/enums.dart';
import 'package:books_app/core/utils/message_show_helper.dart';
import 'package:books_app/features/auth/presentation/bloc/authentication/authentication_bloc.dart';
import 'package:books_app/features/auth/presentation/utils/auth_methods.dart';
import 'package:books_app/features/auth/presentation/widgets/common_auth_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: BlocConsumer<AuthenticationBloc, AuthenticationState>(
            listener: (context, state) {
          if (state is AuthenticationErrorState) {
            MessageShowhelper.showSnackbar(
              snackBarContent: state.message,
              context: context,
            );
          }
          if (state is AuthenticationSuccessState) {
            if (state.isLoggedIn != null) {
              if (state.isLoggedIn!) {
                context.goNamed(AppRoutesName.mainEntry);
              }
            }
          }
        }, builder: (context, state) {
          return ConstrainedBox(
            constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
            child: IntrinsicHeight(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // const Spacer(),
                  kHeight40,
                  const AppLogo(),
                  // const Spacer(),
                  kHeight40,
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
                  (state is AuthenticationLoadingState)
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: kDarkOrange,
                          ),
                        )
                      : CommonContainerButton(
                          buttonText:
                              pageType == PageType.register ? "Register" : "Login",
                          onTap: () async {
                            String username = usernameController.text;
                            String password = passwordController.text;
                            String? confirmPassword =
                                confirmPasswordController?.text;
                            AuthMethods.loginOrRegisterUser(
                              confirmPassword: confirmPassword,
                              context: context,
                              pageType: pageType,
                              password: password,
                              username: username,
                            );
                          },
                        ),
                  if (pageType == PageType.login) ...[
                    kHeight15,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextWidgetCommon(
                          text: "Don't have an account?",
                          textColor: Theme.of(context).colorScheme.onPrimary,
                        ),
                        kWidth5,
                        GestureDetector(
                          onTap: () {
                            context.push(AppRoutesName.register);
                          },
                          child: const TextWidgetCommon(
                            text: "Register",
                            fontWeight: FontWeight.bold,
                            textColor: kDarkOrange,
                          ),
                        ),
                      ],
                    )
                  ],
                  // const Spacer(),
                  // const Spacer(),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
