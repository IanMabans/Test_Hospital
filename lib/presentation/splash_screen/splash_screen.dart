import 'package:utibu/widgets/custom_outlined_button.dart';
import 'package:utibu/widgets/custom_elevated_button.dart';
import 'models/splash_model.dart';
import 'package:flutter/material.dart';
import 'package:utibu/core/app_export.dart';
import 'provider/splash_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => SplashProvider(), child: SplashScreen());
  }
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 3000), () {
      NavigatorService.popAndPushNamed(
        AppRoutes.loginScreen,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: appTheme.cyan300,
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 17.h, vertical: 46.v),
                child: Column(children: [
                  Spacer(),
                  CustomImageView(
                      imagePath: ImageConstant.imgHiDocLogo, width: 338.h),
                  SizedBox(height: 87.v),
                  CustomOutlinedButton(
                      text: "lbl_login".tr,
                      margin: EdgeInsets.only(right: 6.h),
                      onPressed: () {
                        onTapLogin(context);
                      }),
                  SizedBox(height: 15.v),
                  CustomElevatedButton(
                      text: "lbl_sign_up".tr,
                      margin: EdgeInsets.only(right: 6.h),
                      buttonStyle: CustomButtonStyles.fillPrimary,
                      buttonTextStyle: CustomTextStyles.titleSmallTeal300,
                      onPressed: () {
                        onTapSignUp(context);
                      })
                ]))));
  }

  /// Navigates to the loginScreen when the action is triggered.
  onTapLogin(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.loginScreen,
    );
  }

  /// Navigates to the signupScreen when the action is triggered.
  onTapSignUp(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.signupScreen,
    );
  }
}
