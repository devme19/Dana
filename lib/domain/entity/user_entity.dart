import 'package:dana/data/model/province_model.dart';
import 'package:dana/domain/entity/compas_entity.dart';
import 'package:dana/domain/entity/expert_tree_entity.dart';

import 'city_entity.dart';
import 'organization_chart_entity.dart';
class UserEntity{
  String aboutMe;
  String address;
  String city;
  CompassEntity compass;
  String coverImage;
  int documents;
  String email;
  List<ExpertTreeEntity> expertTree;
  String family;
  int freeKnowledge;
  String gender;
  String id;
  bool isExpert;
  int knowledges;
  String mobile;
  String name;
  OrganizationChartEntity organizationalChart;
  String personalCode;
  String phone;
  String photo;
  String position;
  String province;
  int self;
  String username;
  String visits;
  UserEntity({
    this.aboutMe,
    this.address,
    this.knowledges,
    this.city,
    this.email,
    this.compass,
    this.expertTree,
    this.isExpert,
    this.coverImage,
    this.documents,
    this.family,
    this.freeKnowledge,
    this.gender,
    this.id,
    this.mobile,
    this.phone,
    this.name,
    this.organizationalChart,
    this.self,
    this.personalCode,
    this.photo,
    this.position,
    this.province,
    this.username,
    this.visits,
  });
}