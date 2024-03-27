import '../../../core/app_export.dart';
import 'drugs_item_model.dart';
import 'drugs1_item_model.dart';

class PharmacyModel {
  List<DrugsItemModel> drugsItemList = [
    DrugsItemModel(
        panadol: ImageConstant.imgDrugThumbnail,
        panadol1: "Panadol",
        quantiity: "20pcs",
        price: "15.99",
        facebook: ImageConstant.imgFacebookPrimary),
    DrugsItemModel(
        panadol: ImageConstant.imgDrugThumbnail50x50,
        panadol1: "Bodrex Herbal",
        quantiity: "100ml",
        price: "7.99",
        facebook: ImageConstant.imgFacebookPrimary),
    DrugsItemModel(
        panadol: ImageConstant.imgDrugThumbnail1,
        panadol1: "Konidin",
        quantiity: "3pcs",
        price: "5.99")
  ];

  List<Drugs1ItemModel> drugs1ItemList = [
    Drugs1ItemModel(
        oBHCombi: ImageConstant.imgDrugThumbnail1,
        panadol: "OBH Combi",
        measurement: "75ml",
        price: "9.99",
        facebook: ImageConstant.imgFacebookPrimary),
    Drugs1ItemModel(
        oBHCombi: ImageConstant.imgDrugThumbnail2,
        panadol: "Betadine",
        measurement: "50ml",
        price: "6.99",
        facebook: ImageConstant.imgFacebookPrimary),
    Drugs1ItemModel(
        oBHCombi: ImageConstant.imgDrugThumbnail3,
        panadol: "Bodrexin",
        measurement: "50ml",
        price: "7.99")
  ];
}
