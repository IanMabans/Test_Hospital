import 'topics_item_model.dart';
import '../../../core/app_export.dart';
import 'trendings_item_model.dart';
import 'relatedarticles_item_model.dart';

class ArticleModel {
  List<TopicsItemModel> topicsItemList =
      List.generate(3, (index) => TopicsItemModel());

  List<TrendingsItemModel> trendingsItemList = [
    TrendingsItemModel(
        covidNineteen: ImageConstant.imgRectangle54,
        covidNineteen1: "Covid-19",
        description:
            "Comparing the \nAstraZeneca and \nSinovac COVID-19 \nVaccines",
        date: "Jun 12, 2021",
        time: "6 min read"),
    TrendingsItemModel(
        covidNineteen: ImageConstant.imgRectangle5487x138,
        covidNineteen1: "Covid-19",
        description: "The Horror Of The \nSecond Wave Of \nCOVID-19 \npandemic",
        date: "Jun 10, 2021",
        time: "5 min read")
  ];

  List<RelatedarticlesItemModel> relatedarticlesItemList = [
    RelatedarticlesItemModel(
        image: ImageConstant.imgThumbnail,
        theHealthiest:
            "The 25 Healthiest Fruits You Can Eat, According to a Nutritionist",
        date: "Jun 10, 2021 ",
        time: "5min read"),
    RelatedarticlesItemModel(
        image: ImageConstant.imgRectangle541,
        theHealthiest: "Traditional Herbal Medicine Treatments for COVID-19",
        date: "Jun 9, 2021 ",
        time: "8 min read")
  ];
}
