import 'package:place_project/models/latlng_model.dart';

class AddressModel {
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final LatLongModel geo;

  AddressModel({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });
}