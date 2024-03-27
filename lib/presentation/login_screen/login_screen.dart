import 'package:utibu/core/utils/validation_functions.dart';
import 'package:utibu/widgets/custom_text_form_field.dart';
import 'package:utibu/widgets/custom_elevated_button.dart';
import 'models/login_model.dart';
import 'package:flutter/material.dart';
import 'package:utibu/core/app_export.dart';
import 'provider/login_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  LoginScreenState createState() => LoginScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => LoginProvider(), child: LoginScreen());
  }
}

// ignore_for_file: must_be_immutable
class LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                        height: MediaQuery.of(context).size.height,
                        child: Form(
                            key: _formKey,
                            child: Container(
                                width: double.maxFinite,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20.h, vertical: 35.v),
                                child: Column(children: [
                                  SizedBox(height: 70.v),
                                  _buildPageTitle(context),
                                  SizedBox(height: 32.v),
                                  Selector<LoginProvider,
                                          TextEditingController?>(
                                      selector: (context, provider) =>
                                          provider.emailController,
                                      builder:
                                          (context, emailController, child) {
                                        return CustomTextFormField(
                                            controller: emailController,
                                            hintText: "lbl_your_email".tr,
                                            textInputType:
                                                TextInputType.emailAddress,
                                            prefix: Container(
                                                margin: EdgeInsets.fromLTRB(
                                                    16.h, 12.v, 10.h, 12.v),
                                                child: CustomImageView(
                                                    imagePath: ImageConstant
                                                        .imgSystemIcon,
                                                    height: 24.adaptSize,
                                                    width: 24.adaptSize)),
                                            prefixConstraints:
                                                BoxConstraints(maxHeight: 48.v),
                                            validator: (value) {
                                              if (value == null ||
                                                  (!isValidEmail(value,
                                                      isRequired: true))) {
                                                return "err_msg_please_enter_valid_email"
                                                    .tr;
                                              }
                                              return null;
                                            });
                                      }),
                                  SizedBox(height: 8.v),
                                  Selector<LoginProvider,
                                          TextEditingController?>(
                                      selector: (context, provider) =>
                                          provider.passwordController,
                                      builder:
                                          (context, passwordController, child) {
                                        return CustomTextFormField(
                                            controller: passwordController,
                                            hintText: "lbl_password".tr,
                                            textInputAction:
                                                TextInputAction.done,
                                            textInputType:
                                                TextInputType.visiblePassword,
                                            prefix: Container(
                                                margin: EdgeInsets.fromLTRB(
                                                    16.h, 12.v, 10.h, 12.v),
                                                child: CustomImageView(
                                                    imagePath: ImageConstant
                                                        .imgLocation,
                                                    height: 24.adaptSize,
                                                    width: 24.adaptSize)),
                                            prefixConstraints:
                                                BoxConstraints(maxHeight: 48.v),
                                            validator: (value) {
                                              if (value == null ||
                                                  (!isValidPassword(value,
                                                      isRequired: true))) {
                                                return "err_msg_please_enter_valid_password"
                                                    .tr;
                                              }
                                              return null;
                                            },
                                            obscureText: true);
                                      }),
                                  SizedBox(height: 27.v),
                                  CustomElevatedButton(
                                      text: "lbl_sign_in".tr,
                                      buttonStyle:
                                          CustomButtonStyles.fillPrimary,
                                      buttonTextStyle:
                                          CustomTextStyles.titleSmallTeal300,
                                      onPressed: () {
                                        onTapSignIn(context);
                                      }),
                                  SizedBox(height: 24.v),
                                  Text("msg_forgot_password".tr,
                                      style: CustomTextStyles
                                          .labelLargePrimaryBold),
                                  Spacer(),
                                  GestureDetector(
                                      onTap: () {
                                        onTapTxtDonthaveanaccount(context);
                                      },
                                      child: RichText(
                                          text: TextSpan(children: [
                                            TextSpan(
                                                text:
                                                    "msg_don_t_have_an_account2"
                                                        .tr,
                                                style: CustomTextStyles
                                                    .bodySmallffffffff),
                                            TextSpan(text: " "),
                                            TextSpan(
                                                text: "lbl_register".tr,
                                                style: CustomTextStyles
                                                    .labelLargeffffffff)
                                          ]),
                                          textAlign: TextAlign.left))
                                ]))))))));
  }

  /// Section Widget
  Widget _buildPageTitle(BuildContext context) {
    return Column(children: [
      CustomImageView(
          imagePath: ImageConstant.imgHiDocLogo42x115, height: 42.v),
      SizedBox(height: 26.v),
      Text("msg_welcome_to_hidoc".tr,
          style: CustomTextStyles.titleMediumOnPrimaryContainer),
      SizedBox(height: 12.v),
      Text("msg_sign_in_to_continue".tr,
          style: CustomTextStyles.labelLargeGray50)
    ]);
  }

  /// Navigates to the signupScreen when the action is triggered.
  onTapSignIn(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.signupScreen,
    );
  }

  /// Navigates to the signupScreen when the action is triggered.
  onTapTxtDonthaveanaccount(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.signupScreen,
    );
  }
}
