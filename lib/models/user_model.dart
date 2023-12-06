import 'package:place_project/models/address_model.dart';
import 'package:place_project/models/company_model.dart';

class UserModel {
  final int id;
  final String? name;
  final String? username;
  final String? email;
  //final AddressModel? address;
  final String? phone;
  final String? website;
  //final CompanyModel? company;

  UserModel(
    this.id,
    this.name,
    this.username,
    this.email,
    //this.address,
    this.phone,
    this.website,
    //this.company,
  );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        json['id'],
        json['name'],
        json['username'],
        json['email'],
        json['phone'],
        json['website'],
      );
}
