import '../../../core/app_export.dart';
import 'schedule_item_model.dart';

class ScheduleModel {
  List<ScheduleItemModel> scheduleItemList = [
    ScheduleItemModel(
        drMarcusHorizon: "Dr. Marcus Horizon",
        chardiologist: "Chardiologist",
        drMarcusHorizon1: ImageConstant.imgEllipse27image46x46,
        date: "26/06/2021",
        time: "10:30 AM",
        confirmed: "Confirmed"),
    ScheduleItemModel(
        drMarcusHorizon: "Dr. Alysa Hana",
        chardiologist: "Psikeater",
        drMarcusHorizon1: ImageConstant.imgEllipse27image2,
        date: "28/06/2021",
        time: "2:00 PM",
        confirmed: "Confirmed")
  ];
}
