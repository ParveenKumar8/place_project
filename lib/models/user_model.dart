import 'package:place_project/models/company_model.dart';
import 'package:place_project/utils/extensions.dart';

class UserModel {
  final int id;
  final String? username;
  final String? email;
  final String? firstname;
  final String? lastname;
  final String? gender;
  final String? image;
  final String? token;
  final CompanyModel? company;

  UserModel(
    this.id,
    this.username,
    this.email,
    this.firstname,
    this.lastname,
    this.gender,
    this.image,
    this.token,
    this.company,
  );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      json['id'],
      json['username'],
      json['email'],
      json['firstname'],
      json['lastname'],
      json['gender'],
      json['image'],
      json['token'] ?? "",
      json["company"] == null ? null : CompanyModel.fromJson(json["company"]),
    );
  }
}
