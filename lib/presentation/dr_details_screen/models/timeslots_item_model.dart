import '../../../core/app_export.dart';

/// This class is used in the [timeslots_item_widget] screen.
class TimeslotsItemModel {
  TimeslotsItemModel({
    this.timeOne,
    this.isSelected,
  }) {
    timeOne = timeOne ?? "09:00 AM";
    isSelected = isSelected ?? false;
  }

  String? timeOne;

  bool? isSelected;
}
