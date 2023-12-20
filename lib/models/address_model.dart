import 'package:place_project/models/latlng_model.dart';

class AddressModel {
  final String? address;
  final String? city;
  final LatLngModel? coordinates;
  final String? postalCode;
  final String? state;

  AddressModel({
    this.address,
    this.city,
    this.coordinates,
    this.postalCode,
    this.state,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
        address: json["address"],
        city: json["city"],
        coordinates: json["coordinates"] == null
            ? null
            : LatLngModel.fromJson(json["coordinates"]),
        postalCode: json["postalCode"],
        state: json["state"],
      );
}
