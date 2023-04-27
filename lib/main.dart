import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_map/screen/view/home_screen.dart';
import 'package:google_map/screen/view/map_screen.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context) => homescreen(),
        'map':(context) => mapscreen(),
      },
    ),
  );
}
