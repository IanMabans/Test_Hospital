import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/schedule_model.dart';
import '../models/schedule_item_model.dart';

/// A provider class for the SchedulePage.
///
/// This provider manages the state of the SchedulePage, including the
/// current scheduleModelObj

// ignore_for_file: must_be_immutable
class ScheduleProvider extends ChangeNotifier {
  ScheduleModel scheduleModelObj = ScheduleModel();

  @override
  void dispose() {
    super.dispose();
  }
}
