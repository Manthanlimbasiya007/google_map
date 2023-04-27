import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_map/screen/controller/home_controller.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class mapscreen extends StatefulWidget {
  const mapscreen({Key? key}) : super(key: key);

  @override
  State<mapscreen> createState() => _mapscreenState();
}

class _mapscreenState extends State<mapscreen> {
  HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          title: Text("My Location"),
        ),
        body: Stack(
          children: [
            GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(
                  homeController.lat.value, homeController.lan.value
                ),
              ),
              markers: {
                Marker(
                  draggable: true,
                  markerId: MarkerId("Manthan"),
                  position: LatLng(
                    homeController.lat.value,homeController.lan.value
                  ),
                ),
              },
            ),
          ],
        ),
      ),
    );
  }
}
