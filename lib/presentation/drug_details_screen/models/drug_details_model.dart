import '../../../core/app_export.dart';
class DrugDetailsModel {
  final String imagePath;
  final String drugName;
  final String drugQuantity;
  final String drugDescription;

  DrugDetailsModel({
    required this.imagePath,
    required this.drugName,
    required this.drugQuantity,
    required this.drugDescription,
  });
}
