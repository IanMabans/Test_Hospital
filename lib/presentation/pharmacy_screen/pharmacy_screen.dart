import 'package:utibu/widgets/app_bar/custom_app_bar.dart';
import 'package:utibu/widgets/app_bar/appbar_leading_image.dart';
import 'package:utibu/widgets/app_bar/appbar_subtitle.dart';
import 'package:utibu/widgets/app_bar/appbar_trailing_image.dart';
import 'package:utibu/widgets/custom_search_view.dart';
import 'package:utibu/widgets/custom_elevated_button.dart';
import '../cart_screen/models/drugslist_item_model.dart';
import 'widgets/drugs_item_widget.dart';
import 'models/drugs_item_model.dart';
import 'models/pharmacy_model.dart';
import 'widgets/drugs1_item_widget.dart';
import 'models/drugs1_item_model.dart';
import 'package:flutter/material.dart';
import 'package:utibu/core/app_export.dart';
import 'provider/pharmacy_provider.dart';

class PharmacyScreen extends StatefulWidget {
  const PharmacyScreen({Key? key}) : super(key: key);

  @override
  PharmacyScreenState createState() => PharmacyScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => PharmacyProvider(), child: PharmacyScreen());
  }
}

class PharmacyScreenState extends State<PharmacyScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(vertical: 24.v),
                child: Column(children: [
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.h),
                      child: Selector<PharmacyProvider, TextEditingController?>(
                          selector: (context, provider) =>
                              provider.searchController,
                          builder: (context, searchController, child) {
                            return CustomSearchView(
                                controller: searchController,
                                hintText: "msg_search_drug_category".tr);
                          })),
                  SizedBox(height: 25.v),
                  _buildOfferBanner(context),
                  SizedBox(height: 52.v),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.h),
                      child: _buildProductOnSale(context,
                          productText: "lbl_popular_product".tr,
                          seeAllText: "lbl_see_all".tr)),
                  SizedBox(height: 23.v),
                  _buildDrugs(context),
                  SizedBox(height: 22.v),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.h),
                      child: _buildProductOnSale(context,
                          productText: "lbl_product_on_sale".tr,
                          seeAllText: "lbl_see_all".tr)),
                  SizedBox(height: 11.v),
                  _buildDrugs1(context)
                ]))));
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
        title: AppbarSubtitle(text: "lbl_pharmacy".tr),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgCart,
              margin: EdgeInsets.fromLTRB(14.h, 14.v, 14.h, 10.v),
              onTap: () {
                onTapCart(context);
              })
        ]);
  }

  /// Section Widget
  Widget _buildOfferBanner(BuildContext context) {
    return Container(
        width: 335.h,
        margin: EdgeInsets.symmetric(horizontal: 20.h),
        padding: EdgeInsets.symmetric(horizontal: 26.h, vertical: 12.v),
        decoration: AppDecoration.fillTeal
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder10),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 4.v),
              SizedBox(
                  width: 160.h,
                  child: Text("msg_order_quickly_w".tr,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyles.titleMedium18
                          .copyWith(height: 1.50))),
              SizedBox(height: 7.v),
              CustomElevatedButton(
                  height: 26.v,
                  width: 155.h,
                  text: "msg_upload_prescription".tr,
                  buttonStyle: CustomButtonStyles.fillCyan,
                  buttonTextStyle: CustomTextStyles.labelLargePrimarySemiBold)
            ]));
  }

  /// Section Widget
  /// Section Widget
  Widget _buildDrugs(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: SizedBox(
        height: 165.v,
        child: Consumer<PharmacyProvider>(
          builder: (context, provider, child) {
            return ListView.separated(
              padding: EdgeInsets.only(left: 21.h),
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) {
                return SizedBox(width: 18.h);
              },
              itemCount: provider.pharmacyModelObj.drugs1ItemList.length,
              itemBuilder: (context, index) {
                Drugs1ItemModel model = provider.pharmacyModelObj.drugs1ItemList[index]; // <-- Change made here
                return GestureDetector(
                  onTap: () {
                    NavigatorService.pushNamed(
                      AppRoutes.drugDetailsScreen,
                      arguments: model, // Pass the selected item model to DrugDetailsScreen
                    );
                  },
                  child: Drugs1ItemWidget(model), // Assuming you have a Drugs1ItemWidget
                );
              },
            );
          },
        ),
      ),
    );
  }


  Widget _buildDrugs1(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: SizedBox(
        height: 165.v,
        child: Consumer<PharmacyProvider>(
          builder: (context, provider, child) {
            return ListView.separated(
              padding: EdgeInsets.only(left: 21.h),
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) {
                return SizedBox(width: 18.h);
              },
              itemCount: provider.pharmacyModelObj.drugs1ItemList.length,
              itemBuilder: (context, index) {
                Drugs1ItemModel model = provider.pharmacyModelObj.drugs1ItemList[index]; // <-- Change made here
                return GestureDetector(
                  onTap: () {
                    NavigatorService.pushNamed(
                      AppRoutes.drugDetailsScreen,
                      arguments: model, // Pass the selected item model to DrugDetailsScreen
                    );
                  },
                  child: Drugs1ItemWidget(model), // Assuming you have a Drugs1ItemWidget
                );
              },
            );
          },
        ),
      ),
    );
  }




  /// Common widget
  Widget _buildProductOnSale(
    BuildContext context, {
    required String productText,
    required String seeAllText,
  }) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(productText,
          style: CustomTextStyles.titleMediumOnPrimaryContainer_1
              .copyWith(color: theme.colorScheme.onPrimaryContainer)),
      Padding(
          padding: EdgeInsets.only(bottom: 4.v),
          child: Text(seeAllText,
              style: CustomTextStyles.labelLargeCyan300
                  .copyWith(color: appTheme.cyan300)))
    ]);
  }

  /// Navigates to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }

  /// Navigates to the cartScreen when the action is triggered.
  onTapCart(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.cartScreen,
    );
  }
}
