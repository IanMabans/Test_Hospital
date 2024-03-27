import '../../../core/app_export.dart';

/// This class is used in the [topics_item_widget] screen.
class TopicsItemModel {
  TopicsItemModel({
    this.covidNineteen,
    this.isSelected,
  }) {
    covidNineteen = covidNineteen ?? "Covid-19";
    isSelected = isSelected ?? false;
  }

  String? covidNineteen;

  bool? isSelected;
}
