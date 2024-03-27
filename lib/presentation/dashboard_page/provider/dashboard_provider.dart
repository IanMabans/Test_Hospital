import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/dashboard_model.dart';
import '../models/thirtylist_item_model.dart';
import '../models/doctorlist_item_model.dart';

/// A provider class for the DashboardPage.
///
/// This provider manages the state of the DashboardPage, including the
/// current dashboardModelObj

// ignore_for_file: must_be_immutable
class DashboardProvider extends ChangeNotifier {
  TextEditingController searchController = TextEditingController();

  DashboardModel dashboardModelObj = DashboardModel();

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }
}
