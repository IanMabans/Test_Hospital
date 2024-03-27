import '../../../core/app_export.dart';
import 'drlist_item_model.dart';

class DrListModel {
  List<DrlistItemModel> drlistItemList = [
    DrlistItemModel(
        drMarcusHorizon: ImageConstant.imgProfilePic,
        title: "Dr. Marcus Horizon",
        chardiologist: "Chardiologist",
        ratting: "4.7",
        distance: "800m away"),
    DrlistItemModel(
        drMarcusHorizon: ImageConstant.imgProfilePic111x111,
        title: "Dr. Maria Elena",
        chardiologist: "Chardiologist",
        ratting: "4.7",
        distance: "800m away"),
    DrlistItemModel(
        drMarcusHorizon: ImageConstant.imgProfilePic1,
        title: "Dr. Stefi Jessi",
        chardiologist: "Chardiologist",
        ratting: "4.7",
        distance: "800m away"),
    DrlistItemModel(
        drMarcusHorizon: ImageConstant.imgProfilePic2,
        title: "Dr. Gerty Cori",
        chardiologist: "Chardiologist",
        ratting: "4.7",
        distance: "800m away")
  ];
}
