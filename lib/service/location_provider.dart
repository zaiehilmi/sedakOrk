import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sedakork/model/location_data.dart';

class LocationProvider with ChangeNotifier {
  Position? posisiSemasa;
  String? _poskod;
  String? lokasi;

  DataLokasi get dataLokasi => DataLokasi(
        latitude: posisiSemasa?.latitude,
        longitude: posisiSemasa?.longitude,
      );

  semakLokasi() async {
    lokasi = null;
    notifyListeners();

    await getLokasi();
    notifyListeners();
  }

  getLokasi() async {
    LocationPermission permission = await Geolocator.requestPermission();
    
    Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.best,
      // forceAndroidLocationManager: true,
    ).then((Position position) {
      posisiSemasa = position;
      _getAddressFromLatLng();

      notifyListeners();
    }).catchError((e) {
      print(e);
    });
  }

  _getAddressFromLatLng() async {
    try {
      List placemarks = await placemarkFromCoordinates(
          posisiSemasa!.latitude, posisiSemasa!.longitude);

      Placemark place = placemarks[0];
      lokasi = place.locality;
      notifyListeners();

      _poskod = place.postalCode;
      // print(lokasi);
    } catch (e) {
      print(e);
    }
  }
}
