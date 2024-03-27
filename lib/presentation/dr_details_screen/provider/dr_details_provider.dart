import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/dr_details_model.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import '../models/timeslots_item_model.dart';

/// A provider class for the DrDetailsScreen.
///
/// This provider manages the state of the DrDetailsScreen, including the
/// current drDetailsModelObj

// ignore_for_file: must_be_immutable
class DrDetailsProvider extends ChangeNotifier {
  DrDetailsModel drDetailsModelObj = DrDetailsModel();

  DateTime? selectedDatesFromCalendar1;

  @override
  void dispose() {
    super.dispose();
  }

  void onSelectedChipView1(
    int index,
    bool value,
  ) {
    drDetailsModelObj.timeslotsItemList.forEach((element) {
      element.isSelected = false;
    });
    drDetailsModelObj.timeslotsItemList[index].isSelected = value;
    notifyListeners();
  }
}
