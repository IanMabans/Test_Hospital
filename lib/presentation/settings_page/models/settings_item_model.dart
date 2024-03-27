import '../../../core/app_export.dart';

/// This class is used in the [settings_item_widget] screen.
class SettingsItemModel {
  SettingsItemModel({
    this.heartrate,
    this.heartRate1,
    this.heartRateCount,
    this.id,
  }) {
    heartrate = heartrate ?? ImageConstant.imgTelevision;
    heartRate1 = heartRate1 ?? "Heart rate";
    heartRateCount = heartRateCount ?? "215bpm";
    id = id ?? "";
  }

  String? heartrate;

  String? heartRate1;

  String? heartRateCount;

  String? id;
}
