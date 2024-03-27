import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/article_model.dart';
import '../models/topics_item_model.dart';
import '../models/trendings_item_model.dart';
import '../models/relatedarticles_item_model.dart';

/// A provider class for the ArticleScreen.
///
/// This provider manages the state of the ArticleScreen, including the
/// current articleModelObj

// ignore_for_file: must_be_immutable
class ArticleProvider extends ChangeNotifier {
  TextEditingController searchController = TextEditingController();

  ArticleModel articleModelObj = ArticleModel();

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  void onSelectedChipView1(
    int index,
    bool value,
  ) {
    articleModelObj.topicsItemList.forEach((element) {
      element.isSelected = false;
    });
    articleModelObj.topicsItemList[index].isSelected = value;
    notifyListeners();
  }
}
