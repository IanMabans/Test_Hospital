import 'package:utibu/widgets/app_bar/custom_app_bar.dart';
import 'package:utibu/widgets/app_bar/appbar_leading_image.dart';
import 'package:utibu/widgets/app_bar/appbar_subtitle.dart';
import 'package:utibu/widgets/app_bar/appbar_trailing_image.dart';
import 'package:readmore/readmore.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'models/timeslots_item_model.dart';
import '../dr_details_screen/widgets/timeslots_item_widget.dart';
import 'package:utibu/widgets/custom_icon_button.dart';
import 'package:utibu/widgets/custom_elevated_button.dart';
import 'models/dr_details_model.dart';
import 'package:flutter/material.dart';
import 'package:utibu/core/app_export.dart';
import 'provider/dr_details_provider.dart';

class DrDetailsScreen extends StatefulWidget {
  const DrDetailsScreen({Key? key}) : super(key: key);

  @override
  DrDetailsScreenState createState() => DrDetailsScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => DrDetailsProvider(), child: DrDetailsScreen());
  }
}

class DrDetailsScreenState extends State<DrDetailsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(vertical: 24.v),
                child: Column(children: [
                  _buildDoctorDetails(context),
                  SizedBox(height: 28.v),
                  _buildAbout(context),
                  SizedBox(height: 37.v),
                  _buildDates(context),
                  SizedBox(height: 38.v),
                  Divider(indent: 20.h, endIndent: 20.h),
                  SizedBox(height: 38.v),
                  _buildTimeslots(context),
                  SizedBox(height: 5.v)
                ])),
            bottomNavigationBar: _buildBookAppointment(context)));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 45.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 21.h, top: 10.v, bottom: 10.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        centerTitle: true,
        title: AppbarSubtitle(text: "lbl_doctor_details".tr),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgNotification,
              margin: EdgeInsets.fromLTRB(14.h, 14.v, 14.h, 10.v))
        ]);
  }

  /// Section Widget
  Widget _buildDoctorDetails(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 20.h),
        padding: EdgeInsets.symmetric(horizontal: 7.h, vertical: 6.v),
        decoration: AppDecoration.outlineGray
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder10),
        child: Row(mainAxisSize: MainAxisSize.max, children: [
          CustomImageView(
              imagePath: ImageConstant.imgProfilePic,
              height: 111.adaptSize,
              width: 111.adaptSize,
              radius: BorderRadius.circular(12.h)),
          Padding(
              padding: EdgeInsets.only(left: 18.h, top: 7.v, bottom: 4.v),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("msg_dr_marcus_horizon".tr,
                        style: CustomTextStyles.titleMedium18),
                    SizedBox(height: 7.v),
                    Text("lbl_chardiologist".tr,
                        style: theme.textTheme.labelLarge),
                    SizedBox(height: 13.v),
                    Padding(
                        padding: EdgeInsets.only(left: 3.h),
                        child: Row(children: [
                          CustomImageView(
                              imagePath: ImageConstant.imgSignal,
                              height: 13.adaptSize,
                              width: 13.adaptSize,
                              margin: EdgeInsets.only(bottom: 1.v)),
                          Padding(
                              padding: EdgeInsets.only(left: 4.h),
                              child: Text("lbl_4_72".tr,
                                  style: CustomTextStyles.labelLargeCyan300))
                        ])),
                    SizedBox(height: 10.v),
                    Row(children: [
                      CustomImageView(
                          imagePath: ImageConstant.imgLinkedin,
                          height: 13.adaptSize,
                          width: 13.adaptSize,
                          margin: EdgeInsets.only(bottom: 2.v)),
                      Padding(
                          padding: EdgeInsets.only(left: 3.h),
                          child: Text("lbl_800m_away".tr,
                              style: theme.textTheme.labelLarge))
                    ])
                  ]))
        ]));
  }

  /// Section Widget
  Widget _buildAbout(BuildContext context) {
    return Align(
        alignment: Alignment.centerRight,
        child: Padding(
            padding: EdgeInsets.only(left: 20.h),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("lbl_about".tr, style: theme.textTheme.titleMedium),
              SizedBox(height: 7.v),
              SizedBox(
                  width: 313.h,
                  child: ReadMoreText("msg_lorem_ipsum_dolor".tr,
                      trimLines: 3,
                      colorClickableText: appTheme.cyan300,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: "lbl_read_more".tr,
                      moreStyle:
                          theme.textTheme.labelLarge!.copyWith(height: 1.50),
                      lessStyle:
                          theme.textTheme.labelLarge!.copyWith(height: 1.50)))
            ])));
  }

  /// Section Widget
  Widget _buildDates(BuildContext context) {
    return Align(
        alignment: Alignment.centerRight,
        child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(left: 20.h),
            child: IntrinsicWidth(child: Consumer<DrDetailsProvider>(
                builder: (context, provider, child) {
              return SizedBox(
                  height: 64.v,
                  width: 355.h,
                  child: EasyDateTimeLine(
                      initialDate:
                          provider.selectedDatesFromCalendar1 ?? DateTime.now(),
                      locale: 'en_US',
                      headerProps: EasyHeaderProps(
                          selectedDateFormat: SelectedDateFormat.fullDateDMY,
                          monthPickerType: MonthPickerType.switcher,
                          showHeader: false),
                      dayProps: EasyDayProps(width: 46.h, height: 64.v),
                      onDateChange: (selectedDate) {
                        provider.selectedDatesFromCalendar1 = selectedDate;
                      },
                      itemBuilder: (context, dayNumber, dayName, monthName,
                          fullDate, isSelected) {
                        return isSelected
                            ? Container(
                                width: 46.h,
                                padding: EdgeInsets.all(11.h),
                                decoration: BoxDecoration(
                                    color: appTheme.cyan300,
                                    borderRadius: BorderRadius.circular(10.h)),
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                          padding: EdgeInsets.only(top: 2.v),
                                          child: Text(dayName.toString(),
                                              style: CustomTextStyles
                                                  .bodySmallPrimary
                                                  .copyWith(
                                                      color: theme.colorScheme
                                                          .primary))),
                                      Padding(
                                          padding: EdgeInsets.only(top: 3.v),
                                          child: Text(dayNumber.toString(),
                                              style: CustomTextStyles
                                                  .titleMediumPrimary
                                                  .copyWith(
                                                      color: theme.colorScheme
                                                          .primary)))
                                    ]))
                            : Container(
                                width: 46.h,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10.h, vertical: 13.v),
                                decoration: BoxDecoration(
                                    color: theme.colorScheme.primary,
                                    borderRadius: BorderRadius.circular(10.h),
                                    border: Border.all(
                                        color: appTheme.teal50, width: 1.h)),
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                          padding: EdgeInsets.only(left: 3.h),
                                          child: Text(dayName.toString(),
                                              style: CustomTextStyles
                                                  .bodySmall10
                                                  .copyWith(
                                                      color:
                                                          appTheme.gray500))),
                                      Padding(
                                          padding: EdgeInsets.only(top: 2.v),
                                          child: Text(dayNumber.toString(),
                                              style: CustomTextStyles
                                                  .titleMedium18
                                                  .copyWith(
                                                      color: theme.colorScheme
                                                          .onPrimary)))
                                    ]));
                      }));
            }))));
  }

  /// Section Widget
  Widget _buildTimeslots(BuildContext context) {
    return Consumer<DrDetailsProvider>(builder: (context, provider, child) {
      return Wrap(
          runSpacing: 13.v,
          spacing: 13.h,
          children: List<Widget>.generate(
              provider.drDetailsModelObj.timeslotsItemList.length, (index) {
            TimeslotsItemModel model =
                provider.drDetailsModelObj.timeslotsItemList[index];
            return TimeslotsItemWidget(model, onSelectedChipView1: (value) {
              provider.onSelectedChipView1(index, value);
            });
          }));
    });
  }

  /// Section Widget
  Widget _buildBookAppointment(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 20.h, right: 20.h, bottom: 28.v),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          CustomIconButton(
              height: 50.adaptSize,
              width: 50.adaptSize,
              padding: EdgeInsets.all(13.h),
              decoration: IconButtonStyleHelper.fillGray,
              onTap: () {
                onTapBtnUser(context);
              },
              child: CustomImageView(imagePath: ImageConstant.imgUserCyan300)),
          Expanded(
              child: CustomElevatedButton(
                  text: "msg_book_appointment".tr,
                  margin: EdgeInsets.only(left: 19.h),
                  onPressed: () {
                    onTapBookAppointment(context);
                  }))
        ]));
  }

  /// Navigates to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }

  /// Navigates to the chatScreen when the action is triggered.
  onTapBtnUser(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.chatScreen,
    );
  }

  /// Navigates to the bookAnAppointmentScreen when the action is triggered.
  onTapBookAppointment(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.bookAnAppointmentScreen,
    );
  }
}
