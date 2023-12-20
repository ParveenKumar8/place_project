import 'package:place_project/models/address_model.dart';

class CompanyModel {
  final AddressModel? address;
  final String? department;
  final String? name;
  final String? title;

  CompanyModel({
    this.address,
    this.department,
    this.name,
    this.title,
  });

  factory CompanyModel.fromJson(Map<String, dynamic> json) => CompanyModel(
        address: json["address"] == null
            ? null
            : AddressModel.fromJson(json["address"]),
        department: json["department"],
        name: json["name"],
        title: json["title"],
      );
}
