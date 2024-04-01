import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/drug_details_model.dart';

/// A provider class for the DrugDetailsScreen.
///
/// This provider manages the state of the DrugDetailsScreen, including the
/// current drugDetailsModelObj

// ignore_for_file: must_be_immutable
class DrugDetailsProvider extends ChangeNotifier {
  DrugDetailsModel drugDetailsModelObj = DrugDetailsModel(
      imagePath: '', drugName: '', drugQuantity: '', drugDescription: '');

  @override
  void dispose() {
    super.dispose();
  }
}
