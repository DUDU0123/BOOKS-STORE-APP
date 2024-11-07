import 'package:books_app/core/enums/enums.dart';
import 'package:books_app/features/auth/presentation/widgets/auth_common_widget.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController usernameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();
  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthCommonWidget(
        pageType: PageType.register,
        passwordController: passwordController,
        usernameController: usernameController,
        confirmPasswordController: confirmPasswordController,
      ),
    );
  }
}
