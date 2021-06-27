import 'package:dana/data/model/province_model.dart';

import 'city_model.dart';
import 'compass_model.dart';
import 'organization_chart_model.dart';

class AuthorModel {
  String about_me;
  String address;
  String ambassador_knowledge;
  City city;
  String city_id;
  Compass compass;
  String compass_id;
  String confidentiality;
  String cover_image;
  int documents;
  String family;
  int free_knowledge;
  String gender;
  String id;
  int is_follow;
  int knowledges;
  String name;
  OrganizationalChart organizational_chart;
  String organizational_chart_id;
  String personal_code;
  String photo;
  String position;
  Province province;
  String province_id;
  String username;
  String visits;

  AuthorModel({
    this.about_me,
    this.address,
    this.ambassador_knowledge,
    this.city,
    this.city_id,
    this.compass,
    this.compass_id,
    this.confidentiality,
    this.cover_image,
    this.documents,
    this.family,
    this.free_knowledge,
    this.gender,
    this.id,
    this.is_follow,
    this.knowledges,
    this.name,
    this.organizational_chart,
    this.organizational_chart_id,
    this.personal_code,
    this.photo,
    this.position,
    this.province,
    this.province_id,
    this.username,
    this.visits});

  factory AuthorModel.fromJson(Map<String, dynamic> json) {
    return AuthorModel(
      about_me: json['about_me'],
      address: json['address'],
      ambassador_knowledge: json['ambassador_knowledge'],
      city: json['city'] != null ? City.fromJson(json['city']) : null,
      city_id: json['city_id'] ,
      compass: json['compass'] != null ? Compass.fromJson(json['compass']) : null,
      compass_id: json['compass_id'],
      confidentiality: json['confidentiality'],
      cover_image: json['cover_image'],
      documents: json['documents'],
      family: json['family'],
      free_knowledge: json['free_knowledge'],
      gender: json['gender'],
      id: json['id'],
      is_follow: json['is_follow'],
      knowledges: json['knowledges'],
      name: json['name'],
      organizational_chart: json['organizational_chart'] != null ? OrganizationalChart.fromJson(json['organizational_chart']) : null,
      organizational_chart_id: json['organizational_chart_id'],
      personal_code: json['personal_code'],
      photo: json['photo'],
      position: json['position'],
      province: json['province'] != null ? Province.fromJson(json['province']) : null,
      province_id: json['province_id'],
      username: json['username'],
      visits: json['visits'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['about_me'] = this.about_me;
    data['address'] = this.address;
    data['ambassador_knowledge'] = this.ambassador_knowledge;
    data['compass_id'] = this.compass_id;
    data['confidentiality'] = this.confidentiality;
    data['cover_image'] = this.cover_image;
    data['documents'] = this.documents;
    data['family'] = this.family;
    data['free_knowledge'] = this.free_knowledge;
    data['gender'] = this.gender;
    data['id'] = this.id;
    data['is_follow'] = this.is_follow;
    data['knowledges'] = this.knowledges;
    data['name'] = this.name;
    data['organizational_chart_id'] = this.organizational_chart_id;
    data['personal_code'] = this.personal_code;
    data['photo'] = this.photo;
    data['position'] = this.position;
    data['username'] = this.username;
    data['visits'] = this.visits;
    data['city_id'] = this.city_id;
    data['province_id'] = this.province_id;
    if (this.city != null) {
      data['city'] = this.city.toJson();
    }
    if (this.compass != null) {
      data['compass'] = this.compass.toJson();
    }
    if (this.organizational_chart != null) {
      data['organizational_chart'] = this.organizational_chart.toJson();
    }
    if (this.province != null) {
      data['province'] = this.province.toJson();
    }
    return data;
  }
}