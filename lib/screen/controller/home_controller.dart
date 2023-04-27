import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class HomeController extends GetxController
{
  Future<void> permission()
  async {
    var status = await Permission.location.status;
    if(status.isDenied)
    {
      await Permission.location.request();
    }
  }

  RxDouble lat = 0.0.obs;
  RxDouble lan = 0.0.obs;

  RxList<Placemark> placeList = <Placemark>[].obs;
}
