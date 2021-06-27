import 'compass_model.dart';
import 'expert_tree_model.dart';
import 'organization_chart_model.dart';


class City {
    int id;
    String name;
    String province_id;

    City({this.id, this.name, this.province_id});

    factory City.fromJson(Map<String, dynamic> json) {
        return City(
            id: json['id'], 
            name: json['name'], 
            province_id: json['province_id'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['id'] = this.id;
        data['name'] = this.name;
        data['province_id'] = this.province_id;
        return data;
    }
}
class User {
  String about_me;
  String address;
  City city;
  Compass compass;
  String cover_image;
  int documents;
  String email;
  List<ExpertTree> expert_tree;
  String family;
  int free_knowledge;
  String gender;
  String id;
  bool is_expert;
  int knowledges;
  String mobile;
  String name;
  OrganizationalChart organizational_chart;
  String personal_code;
  String phone;
  String photo;
  String position;
  String province;
  int self;
  String username;
  String visits;

  User({this.about_me, this.address, this.city, this.compass, this.cover_image, this.documents, this.email, this.expert_tree, this.family, this.free_knowledge, this.gender, this.id, this.is_expert, this.knowledges, this.mobile, this.name, this.organizational_chart, this.personal_code, this.phone, this.photo, this.position, this.province, this.self, this.username, this.visits});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      about_me: json['about_me'],
      address: json['address'],
      // city: json['city'] != null ? City.fromJson(json['city']) : null,
      // compass: json['compass'] != null ? Compass.fromJson(json['compass']) : null,
      cover_image: json['cover_image'],
      documents: json['documents'],
      email: json['email'],
      expert_tree: json['expert_tree'] != null ? (json['expert_tree'] as List).map((i) => ExpertTree.fromJson(i)).toList() : null,
      family: json['family'],
      free_knowledge: json['free_knowledge'],
      gender: json['gender'],
      id: json['id'],
      is_expert: json['is_expert'],
      knowledges: json['knowledges'],
      mobile: json['mobile'],
      name: json['name'],
      organizational_chart: json['organizational_chart'] != null ? OrganizationalChart.fromJson(json['organizational_chart']) : null,
      personal_code: json['personal_code'],
      phone: json['phone'],
      photo: json['photo'],
      position: json['position'],
      // province: json['province'],
      self: json['self'],
      username: json['username'],
      visits: json['visits'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['about_me'] = this.about_me;
    data['address'] = this.address;
    data['city'] = this.city;
    data['cover_image'] = this.cover_image;
    data['documents'] = this.documents;
    data['email'] = this.email;
    data['family'] = this.family;
    data['free_knowledge'] = this.free_knowledge;
    data['gender'] = this.gender;
    data['id'] = this.id;
    data['is_expert'] = this.is_expert;
    data['knowledges'] = this.knowledges;
    data['mobile'] = this.mobile;
    data['name'] = this.name;
    data['personal_code'] = this.personal_code;
    data['phone'] = this.phone;
    data['photo'] = this.photo;
    data['position'] = this.position;
    data['province'] = this.province;
    data['self'] = this.self;
    data['username'] = this.username;
    data['visits'] = this.visits;
    if (this.compass != null) {
      data['compass'] = this.compass.toJson();
    }
    if (this.expert_tree != null) {
      data['expert_tree'] = this.expert_tree.map((v) => v.toJson()).toList();
    }
    if (this.organizational_chart != null) {
      data['organizational_chart'] = this.organizational_chart.toJson();
    }
    return data;
  }
}