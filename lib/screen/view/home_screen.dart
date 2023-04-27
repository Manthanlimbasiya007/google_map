import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_map/screen/controller/home_controller.dart';

class homescreen extends StatefulWidget {
  const homescreen({Key? key}) : super(key: key);

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          title: Text("My Map"),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () async {
                    Position position = await Geolocator.getCurrentPosition(
                        desiredAccuracy: LocationAccuracy.high);
                    homeController.lan.value = position.longitude;
                    homeController.lat.value = position.latitude;
                  },
                  child: Text("Locate"),
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.black),
                ),
                SizedBox(
                  height: 20,
                ),
                Obx(
                  () => Text(
                    "Lat = ${homeController.lat}",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Obx(
                  () => Text(
                    "Lan = ${homeController.lan}",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    List<Placemark> placemarkList =
                        await placemarkFromCoordinates(
                            homeController.lat.value, homeController.lan.value);
                    placemarkList.isEmpty
                        ? "null"
                        : homeController.placeList.value = placemarkList;
                  },
                  child: Text("Address"),
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.black),
                ),
                SizedBox(
                  height: 10,
                ),
                Obx(
                  () => Text("${homeController.placeList}"),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.toNamed('map');
                  },
                  child: Text("Map"),
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.black),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
