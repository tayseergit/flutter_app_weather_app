import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';

class GlobalController extends GetxController {
//  create varaibles

  RxMap<String, dynamic>? query = RxMap();
  RxMap<String, dynamic>? querydaily = RxMap();

  RxBool _isLoading = true.obs;
  RxDouble _lititude = 0.0.obs;

  RxDouble _longitude = 0.0.obs;

  RxBool checkLoading() => _isLoading;
  RxDouble getLit() => _lititude;
  RxDouble getLon() => _longitude;

  @override
  void onInit() {
    if (_isLoading.isTrue) {
      getLocation();
    }
    super.onInit();
  }

  void setQuery(Map<String, dynamic> map) {
    this.query = map as RxMap<String, dynamic>?;
    update();
    print("\nupdated\n");
  }

  void setQueryDaily(Map<String, dynamic> map) {
    this.querydaily = map as RxMap<String, dynamic>?;
    update();
  }

  Future<Position> getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error('Location deniedforever.');
    }

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print("permission is denied");
        return Future.error("permission is denied");
      }
    }

    return await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high)
        .then((value) {
// update our lattitude and longitude
      _lititude.value = value.latitude;
      _longitude.value = value.longitude;
      print("\n ok \n");
      print(value);
      _isLoading.value = false;
      return value;
    });
  }
}
