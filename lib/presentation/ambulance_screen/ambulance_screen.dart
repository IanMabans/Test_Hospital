import 'package:utibu/widgets/app_bar/custom_app_bar.dart';
import 'package:utibu/widgets/app_bar/appbar_leading_image.dart';
import 'package:utibu/widgets/app_bar/appbar_subtitle.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'models/ambulance_model.dart';
import 'package:flutter/material.dart';
import 'package:utibu/core/app_export.dart';
import 'provider/ambulance_provider.dart';

class AmbulanceScreen extends StatefulWidget {
  const AmbulanceScreen({Key? key}) : super(key: key);

  @override
  AmbulanceScreenState createState() => AmbulanceScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => AmbulanceProvider(), child: AmbulanceScreen());
  }
}

// ignore_for_file: must_be_immutable
class AmbulanceScreenState extends State<AmbulanceScreen> {
  Completer<GoogleMapController> googleMapController = Completer();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                height: 710.v,
                width: double.maxFinite,
                margin: EdgeInsets.only(top: 13.v, bottom: 1.v),
                child: GoogleMap(
                    mapType: MapType.normal,
                    initialCameraPosition: CameraPosition(
                        target: LatLng(37.43296265331129, -122.08832357078792),
                        zoom: 14.4746),
                    onMapCreated: (GoogleMapController controller) {
                      googleMapController.complete(controller);
                    },
                    zoomControlsEnabled: false,
                    zoomGesturesEnabled: false,
                    myLocationButtonEnabled: false,
                    myLocationEnabled: false))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 45.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 21.h, top: 10.v, bottom: 10.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        centerTitle: true,
        title: AppbarSubtitle(text: "lbl_ambulance".tr));
  }

  /// Navigates to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }
}
