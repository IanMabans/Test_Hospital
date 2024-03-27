import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/signup_model.dart';

/// A provider class for the SignupScreen.
///
/// This provider manages the state of the SignupScreen, including the
/// current signupModelObj

// ignore_for_file: must_be_immutable
class SignupProvider extends ChangeNotifier {
  TextEditingController fullNameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController passwordController1 = TextEditingController();

  SignupModel signupModelObj = SignupModel();

  @override
  void dispose() {
    super.dispose();
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    passwordController1.dispose();
  }
}
