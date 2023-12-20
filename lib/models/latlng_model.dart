class LatLngModel {
  final double? lat;
  final double? lng;

  LatLngModel({
    this.lat,
    this.lng,
  });

  factory LatLngModel.fromJson(Map<String, dynamic> json) => LatLngModel(
        lat: json["lat"]?.toDouble(),
        lng: json["lng"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
      };
}
