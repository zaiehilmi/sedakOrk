import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sedakork/model/location_data.dart';

class LocationProvider with ChangeNotifier {
  static Position? posisiSemasa;
  static String? lokasi;

  static DataLokasi? _dataLokasi;
  static Placemark? _place;

  static DataLokasi? get dataLokasi => _dataLokasi;

  semakLokasi() async {
    lokasi = null;
    notifyListeners();

    await getLokasi();
    notifyListeners();
  }

  setDataLokasi(Position pos) {
    _getAddressFromLatLng(pos);

    _dataLokasi = DataLokasi(
      latitude: pos.latitude,
      longitude: pos.longitude,
      area: _place?.locality,
    );
    // notifyListeners();
  }

  getLokasi() async {
    // LocationPermission permission = await Geolocator.requestPermission();

    if (await Geolocator.isLocationServiceEnabled()) {
      var permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();

        if (permission == LocationPermission.denied) {
          //todo handle nanti
        }
      }

      Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.reduced,
      ).then((Position position) {
        posisiSemasa = position;
        setDataLokasi(position);
        _getAddressFromLatLng(position);

        notifyListeners();
      }).catchError((e) {
        print(e);
      });
    }
  }

  _getAddressFromLatLng(Position pos) async {
    try {
      List placemarks = await placemarkFromCoordinates(
        pos.latitude,
        pos.longitude,
      );

      _place = placemarks[0];

      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
