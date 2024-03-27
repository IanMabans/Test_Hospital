import 'package:utibu/widgets/app_bar/custom_app_bar.dart';
import 'package:utibu/widgets/app_bar/appbar_leading_image.dart';
import 'package:utibu/widgets/app_bar/appbar_subtitle.dart';
import 'package:utibu/widgets/app_bar/appbar_trailing_image.dart';
import 'widgets/drlist_item_widget.dart';
import 'models/drlist_item_model.dart';
import 'models/dr_list_model.dart';
import 'package:flutter/material.dart';
import 'package:utibu/core/app_export.dart';
import 'provider/dr_list_provider.dart';

class DrListScreen extends StatefulWidget {
  const DrListScreen({Key? key}) : super(key: key);

  @override
  DrListScreenState createState() => DrListScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => DrListProvider(), child: DrListScreen());
  }
}

class DrListScreenState extends State<DrListScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Padding(
                padding: EdgeInsets.only(left: 20.h, top: 24.v, right: 20.h),
                child: Consumer<DrListProvider>(
                    builder: (context, provider, child) {
                  return ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      separatorBuilder: (context, index) {
                        return SizedBox(height: 16.v);
                      },
                      itemCount: provider.drListModelObj.drlistItemList.length,
                      itemBuilder: (context, index) {
                        DrlistItemModel model =
                            provider.drListModelObj.drlistItemList[index];
                        return DrlistItemWidget(model);
                      });
                }))));
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
        title: AppbarSubtitle(text: "lbl_top_doctor".tr),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgNotification,
              margin: EdgeInsets.fromLTRB(14.h, 14.v, 14.h, 10.v))
        ]);
  }

  /// Navigates to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }
}
