import 'widgets/schedule_item_widget.dart';
import 'models/schedule_item_model.dart';
import 'models/schedule_model.dart';
import 'package:flutter/material.dart';
import 'package:utibu/core/app_export.dart';
import 'provider/schedule_provider.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({Key? key}) : super(key: key);

  @override
  SchedulePageState createState() => SchedulePageState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ScheduleProvider(), child: SchedulePage());
  }
}

class SchedulePageState extends State<SchedulePage>
    with AutomaticKeepAliveClientMixin<SchedulePage> {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
                width: double.maxFinite,
                decoration: AppDecoration.white,
                child: Column(children: [
                  SizedBox(height: 30.v),
                  _buildSchedule(context)
                ]))));
  }

  /// Section Widget
  Widget _buildSchedule(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        child: Consumer<ScheduleProvider>(builder: (context, provider, child) {
          return ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (context, index) {
                return SizedBox(height: 20.v);
              },
              itemCount: provider.scheduleModelObj.scheduleItemList.length,
              itemBuilder: (context, index) {
                ScheduleItemModel model =
                    provider.scheduleModelObj.scheduleItemList[index];
                return ScheduleItemWidget(model, onTapCancelButton: () {
                  onTapCancelButton(context);
                }, onTapRescheduleButton: () {
                  onTapRescheduleButton(context);
                });
              });
        }));
  }

  /// Navigates to the signupScreen when the action is triggered.
  onTapCancelButton(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.signupScreen,
    );
  }

  /// Navigates to the signupScreen when the action is triggered.
  onTapRescheduleButton(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.signupScreen,
    );
  }
}
