import 'package:utibu/widgets/app_bar/custom_app_bar.dart';
import 'package:utibu/widgets/app_bar/appbar_leading_image.dart';
import 'package:utibu/widgets/app_bar/appbar_subtitle.dart';
import 'package:utibu/widgets/app_bar/appbar_trailing_image.dart';
import 'package:utibu/widgets/custom_search_view.dart';
import 'models/topics_item_model.dart';
import '../article_screen/widgets/topics_item_widget.dart';
import 'widgets/trendings_item_widget.dart';
import 'models/trendings_item_model.dart';
import 'models/article_model.dart';
import 'widgets/relatedarticles_item_widget.dart';
import 'models/relatedarticles_item_model.dart';
import 'package:flutter/material.dart';
import 'package:utibu/core/app_export.dart';
import 'provider/article_provider.dart';

class ArticleScreen extends StatefulWidget {
  const ArticleScreen({Key? key}) : super(key: key);

  @override
  ArticleScreenState createState() => ArticleScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ArticleProvider(), child: ArticleScreen());
  }
}

class ArticleScreenState extends State<ArticleScreen> {
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
                padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 24.v),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Selector<ArticleProvider, TextEditingController?>(
                          selector: (context, provider) =>
                              provider.searchController,
                          builder: (context, searchController, child) {
                            return CustomSearchView(
                                controller: searchController,
                                hintText: "msg_search_article".tr);
                          }),
                      SizedBox(height: 23.v),
                      Text("msg_popular_articles".tr,
                          style:
                              CustomTextStyles.titleMediumOnPrimaryContainer_1),
                      SizedBox(height: 10.v),
                      _buildTopics(context),
                      SizedBox(height: 23.v),
                      _buildTrendingArticles(context),
                      SizedBox(height: 11.v),
                      _buildTrendings(context),
                      SizedBox(height: 16.v),
                      _buildRelatedArticles(context),
                      SizedBox(height: 12.v),
                      _buildRelatedArticles1(context)
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
        title: AppbarSubtitle(text: "lbl_articles".tr),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgNotification,
              margin: EdgeInsets.fromLTRB(14.h, 14.v, 14.h, 10.v))
        ]);
  }

  /// Section Widget
  Widget _buildTopics(BuildContext context) {
    return Consumer<ArticleProvider>(builder: (context, provider, child) {
      return Wrap(
          runSpacing: 5.v,
          spacing: 5.h,
          children: List<Widget>.generate(
              provider.articleModelObj.topicsItemList.length, (index) {
            TopicsItemModel model =
                provider.articleModelObj.topicsItemList[index];
            return TopicsItemWidget(model, onSelectedChipView1: (value) {
              provider.onSelectedChipView1(index, value);
            });
          }));
    });
  }

  /// Section Widget
  Widget _buildTrendingArticles(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("msg_trending_articles".tr,
              style: CustomTextStyles.titleMediumOnPrimaryContainer_1),
          Padding(
              padding: EdgeInsets.only(bottom: 5.v),
              child: Text("lbl_see_all".tr,
                  style: CustomTextStyles.labelLargeCyan300))
        ]);
  }

  /// Section Widget
  Widget _buildTrendings(BuildContext context) {
    return SizedBox(
        height: 223.v,
        child: Consumer<ArticleProvider>(builder: (context, provider, child) {
          return ListView.separated(
              padding: EdgeInsets.only(right: 12.h),
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) {
                return SizedBox(width: 17.h);
              },
              itemCount: provider.articleModelObj.trendingsItemList.length,
              itemBuilder: (context, index) {
                TrendingsItemModel model =
                    provider.articleModelObj.trendingsItemList[index];
                return TrendingsItemWidget(model);
              });
        }));
  }

  /// Section Widget
  Widget _buildRelatedArticles(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text("msg_related_articles".tr,
          style: CustomTextStyles.titleMediumOnPrimaryContainer_1),
      Padding(
          padding: EdgeInsets.only(bottom: 3.v),
          child:
              Text("lbl_see_all".tr, style: CustomTextStyles.labelLargeCyan300))
    ]);
  }

  /// Section Widget
  Widget _buildRelatedArticles1(BuildContext context) {
    return Consumer<ArticleProvider>(builder: (context, provider, child) {
      return ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (context, index) {
            return SizedBox(height: 10.v);
          },
          itemCount: provider.articleModelObj.relatedarticlesItemList.length,
          itemBuilder: (context, index) {
            RelatedarticlesItemModel model =
                provider.articleModelObj.relatedarticlesItemList[index];
            return RelatedarticlesItemWidget(model);
          });
    });
  }

  /// Navigates to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }
}
