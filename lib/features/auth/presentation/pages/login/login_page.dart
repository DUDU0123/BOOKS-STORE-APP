import 'package:books_app/core/enums/enums.dart';
import 'package:books_app/features/auth/presentation/widgets/auth_common_widget.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthCommonWidget(
        passwordController: passwordController,
        usernameController: usernameController,
        pageType: PageType.login,
      ),
    );
  }
}
