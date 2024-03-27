import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/settings_model.dart';
import '../models/settings_item_model.dart';

/// A provider class for the SettingsPage.
///
/// This provider manages the state of the SettingsPage, including the
/// current settingsModelObj
class SettingsProvider extends ChangeNotifier {
  SettingsModel settingsModelObj = SettingsModel();

  @override
  void dispose() {
    super.dispose();
  }
}
