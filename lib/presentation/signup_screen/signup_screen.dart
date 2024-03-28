import 'package:firebase_auth/firebase_auth.dart';
import 'package:utibu/core/utils/validation_functions.dart';
import 'package:utibu/widgets/custom_text_form_field.dart';
import 'package:utibu/widgets/custom_elevated_button.dart';
import 'models/signup_model.dart';
import 'package:flutter/material.dart';
import 'package:utibu/core/app_export.dart';
import 'provider/signup_provider.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  SignupScreenState createState() => SignupScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => SignupProvider(), child: SignupScreen());
  }
}

// ignore_for_file: must_be_immutable
class SignupScreenState extends State<SignupScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void onTapTxtHaveanaccount(BuildContext context) {
    NavigatorService.pushNamed(AppRoutes.loginScreen);
  }

  bool _isLoading = false; // Track loading state
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.cyan300,
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: SizedBox(
              height: SizeUtils.height,
              child: Form(
                key: _formKey,
                child: Container(
                  width: double.maxFinite,
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.h, vertical: 35.v),
                  child: Column(
                    children: [
                      SizedBox(height: 70.v),
                      _buildPageTitle(context),
                      SizedBox(height: 29.v),
                      _buildFullName(context),
                      SizedBox(height: 8.v),
                      _buildEmail(context),
                      SizedBox(height: 8.v),
                      _buildPassword(context),
                      SizedBox(height: 8.v),
                      _buildPassword1(context),
                      SizedBox(height: 39.v),
                      _buildSignUp(context),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          onTapTxtHaveanaccount(context);
                        },
                        child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                    text: "msg_have_an_account2".tr,
                                    style: CustomTextStyles.bodySmallffffffff),
                                TextSpan(text: " "),
                                TextSpan(
                                    text: "lbl_sign_in".tr,
                                    style: CustomTextStyles.labelLargeffffffff)
                              ],
                            ),
                            textAlign: TextAlign.left),
                      ),
                      if (_isLoading) // Show loading indicator if _isLoading is true
                        Container(
                          color: Colors.black.withOpacity(0.5),
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildPageTitle(BuildContext context) {
    return Column(children: [
      CustomImageView(
          imagePath: ImageConstant.imgHiDocLogo42x115, height: 42.v),
      SizedBox(height: 27.v),
      Text("msg_let_s_get_started".tr,
          style: CustomTextStyles.titleMediumOnPrimaryContainer),
      SizedBox(height: 10.v),
      Text("msg_create_an_new_account".tr,
          style: CustomTextStyles.labelLargeGray50)
    ]);
  }

  /// Section Widget
  Widget _buildFullName(BuildContext context) {
    return Selector<SignupProvider, TextEditingController?>(
        selector: (context, provider) => provider.fullNameController,
        builder: (context, fullNameController, child) {
          return CustomTextFormField(
              controller: fullNameController,
              hintText: "lbl_full_name".tr,
              prefix: Container(
                  margin: EdgeInsets.fromLTRB(16.h, 12.v, 10.h, 12.v),
                  child: CustomImageView(
                      imagePath: ImageConstant.imgLock,
                      height: 24.adaptSize,
                      width: 24.adaptSize)),
              prefixConstraints: BoxConstraints(maxHeight: 48.v),
              validator: (value) {
                if (!isText(value)) {
                  return "err_msg_please_enter_valid_text".tr;
                }
                return null;
              });
        });
  }

  /// Section Widget
  Widget _buildEmail(BuildContext context) {
    return Selector<SignupProvider, TextEditingController?>(
        selector: (context, provider) => provider.emailController,
        builder: (context, emailController, child) {
          return CustomTextFormField(
              controller: emailController,
              hintText: "lbl_your_email".tr,
              textInputType: TextInputType.emailAddress,
              prefix: Container(
                  margin: EdgeInsets.fromLTRB(16.h, 12.v, 10.h, 12.v),
                  child: CustomImageView(
                      imagePath: ImageConstant.imgSystemIcon,
                      height: 24.adaptSize,
                      width: 24.adaptSize)),
              prefixConstraints: BoxConstraints(maxHeight: 48.v),
              validator: (value) {
                if (value == null || (!isValidEmail(value, isRequired: true))) {
                  return "err_msg_please_enter_valid_email".tr;
                }
                return null;
              });
        });
  }

  /// Section Widget
  Widget _buildPassword(BuildContext context) {
    return Selector<SignupProvider, TextEditingController?>(
        selector: (context, provider) => provider.passwordController,
        builder: (context, passwordController, child) {
          return CustomTextFormField(
              controller: passwordController,
              hintText: "lbl_password".tr,
              textInputType: TextInputType.visiblePassword,
              prefix: Container(
                  margin: EdgeInsets.fromLTRB(16.h, 12.v, 10.h, 12.v),
                  child: CustomImageView(
                      imagePath: ImageConstant.imgLocation,
                      height: 24.adaptSize,
                      width: 24.adaptSize)),
              prefixConstraints: BoxConstraints(maxHeight: 48.v),
              validator: (value) {
                if (value == null ||
                    (!isValidPassword(value, isRequired: true))) {
                  return "err_msg_please_enter_valid_password".tr;
                }
                return null;
              },
              obscureText: true);
        });
  }

  /// Section Widget
  /// Section Widget
  Widget _buildPassword1(BuildContext context) {
    return Selector<SignupProvider, TextEditingController?>(
      selector: (context, provider) => provider.passwordController1,
      builder: (context, passwordController1, child) {
        return CustomTextFormField(
          controller: passwordController1,
          hintText: "lbl_password_again".tr,
          textInputAction: TextInputAction.done,
          textInputType: TextInputType.visiblePassword,
          prefix: Container(
            margin: EdgeInsets.fromLTRB(16.h, 12.v, 10.h, 12.v),
            child: CustomImageView(
              imagePath: ImageConstant.imgLocation,
              height: 24.adaptSize,
              width: 24.adaptSize,
            ),
          ),
          prefixConstraints: BoxConstraints(maxHeight: 48.v),
          validator: (value) {
            if (value == null ||
                (!isValidPassword(value, isRequired: true)) ||
                (value !=
                    context.read<SignupProvider>().passwordController.text)) {
              return "err_msg_passwords_do_not_match".tr;
            }
            return null;
          },
          obscureText: true,
        );
      },
    );
  }

  Widget _buildSignUp(BuildContext context) {
    return CustomElevatedButton(
      text: "lbl_sign_up".tr,
      buttonStyle: CustomButtonStyles.fillPrimary,
      buttonTextStyle: CustomTextStyles.titleSmallTeal300,
      onPressed: () => _signUp(context),
    );
  }

  void _signUp(BuildContext context) async {
    SignupProvider signupProvider = context.read<SignupProvider>();

    // Validate the form
    if (!_formKey.currentState!.validate()) {
      // If the form is not valid, return early
      return;
    }

    // If the form is valid, proceed with sign-up
    // Set loading state to true
    setState(() {
      _isLoading = true;
    });

    try {
      final String email = signupProvider.emailController.text.trim();
      final String password = signupProvider.passwordController.text.trim();
      final String passwordAgain =
          signupProvider.passwordController1.text.trim();

      if (password != passwordAgain) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Passwords do not match')),
        );
        return;
      }

      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Sign up successful, navigate to the next page
      // After sign-up logic completes, set loading state to false
      setState(() {
        _isLoading = false;
      });
      Navigator.pushReplacementNamed(
          context, AppRoutes.dashboardContainerScreen);
    } catch (e) {
      // Handle sign up errors
      print('Sign up error: $e');
      // Display error message to the user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Sign up failed. Please try again.')),
      );
    }
  }
}
