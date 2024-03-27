import '../../../core/app_export.dart';
import 'thirtylist_item_model.dart';
import 'doctorlist_item_model.dart';

class DashboardModel {
  List<ThirtylistItemModel> thirtylistItemList = [
    ThirtylistItemModel(ticket: ImageConstant.imgTicket),
    ThirtylistItemModel(ticket: ImageConstant.imgCalculator),
    ThirtylistItemModel(ticket: ImageConstant.imgAmbulance),
    ThirtylistItemModel(ticket: ImageConstant.imgCalendar)
  ];

  List<DoctorlistItemModel> doctorlistItemList = [
    DoctorlistItemModel(
        drMarcusHorizo: ImageConstant.imgEllipse27image,
        drMarcusHorizo1: "Dr. Marcus Horizo",
        chardiologist: "Chardiologist",
        ratting: "4,7",
        distance: "800m away"),
    DoctorlistItemModel(
        drMarcusHorizo: ImageConstant.imgEllipse27image68x68,
        drMarcusHorizo1: "Dr. Maria Elena",
        chardiologist: "Psychologist",
        ratting: "4,9",
        distance: "1,5km away"),
    DoctorlistItemModel(
        drMarcusHorizo: ImageConstant.imgEllipse27image1,
        drMarcusHorizo1: "Dr. Stevi Jessi",
        chardiologist: "Orthopedist",
        ratting: "4,8",
        distance: "2km away")
  ];
}
