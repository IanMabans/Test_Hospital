import '../../../core/app_export.dart';
import 'drugslist_item_model.dart';

class CartModel {
  List<DrugslistItemModel> drugslistItemList = [
    DrugslistItemModel(
        oBHCombi: ImageConstant.imgDrugThumbnail72x72,
        oBHCombi1: "OBH Combi",
        measurement: "75ml",
        counter: "1",
        price: "9.99"),
    DrugslistItemModel(
        oBHCombi: ImageConstant.imgDrugThumbnail4,
        oBHCombi1: "Panadol",
        measurement: "20pcs",
        counter: "1",
        price: "9.99")
  ];
}
