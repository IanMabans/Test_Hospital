import 'models/app_navigation_model.dart';
import 'package:flutter/material.dart';
import 'package:utibu/core/app_export.dart';
import 'provider/app_navigation_provider.dart';

class AppNavigationScreen extends StatefulWidget {
  const AppNavigationScreen({Key? key})
      : super(
          key: key,
        );

  @override
  AppNavigationScreenState createState() => AppNavigationScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppNavigationProvider(),
      child: AppNavigationScreen(),
    );
  }
}

class AppNavigationScreenState extends State<AppNavigationScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0XFFFFFFFF),
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              _buildAppNavigation(context),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0XFFFFFFFF),
                    ),
                    child: Column(
                      children: [
                        _buildScreenTitle(
                          context,
                          screenTitle: "Splash Screen".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.splashScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Login".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.loginScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Signup".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.signupScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Dashboard - Container".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.dashboardContainerScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Dr List".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.drListScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Dr Details".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.drDetailsScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Book an appointment".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.bookAnAppointmentScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Chat".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.chatScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Pharmacy".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.pharmacyScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Drug Details".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.drugDetailsScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Article".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.articleScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Cart".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.cartScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "ambulance".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.ambulanceScreen),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildAppNavigation(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0XFFFFFFFF),
      ),
      child: Column(
        children: [
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Text(
                "App Navigation".tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF000000),
                  fontSize: 20.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 20.h),
              child: Text(
                "Check your app's UI from the below demo screens of your app."
                    .tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF888888),
                  fontSize: 16.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 5.v),
          Divider(
            height: 1.v,
            thickness: 1.v,
            color: Color(0XFF000000),
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildScreenTitle(
    BuildContext context, {
    required String screenTitle,
    Function? onTapScreenTitle,
  }) {
    return GestureDetector(
      onTap: () {
        onTapScreenTitle?.call();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0XFFFFFFFF),
        ),
        child: Column(
          children: [
            SizedBox(height: 10.v),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Text(
                  screenTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0XFF000000),
                    fontSize: 20.fSize,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.v),
            SizedBox(height: 5.v),
            Divider(
              height: 1.v,
              thickness: 1.v,
              color: Color(0XFF888888),
            ),
          ],
        ),
      ),
    );
  }

  /// Common click event
  void onTapScreenTitle(String routeName) {
    NavigatorService.pushNamed(routeName);
  }
}
