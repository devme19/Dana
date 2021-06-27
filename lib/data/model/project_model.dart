import 'author_model.dart';

class ProjectModel {
  AuthorModel author;
  String created_at;
  String description;
  String end_date_at;
  String id;
  String location;
  String photo;
  String position;
  String start_date_at;
  // List<Object> team;
  String title;
  String updated_at;
  String send_by;
  String active;
  PivotModel pivot;
  
  

  ProjectModel({this.pivot,this.active,this.send_by,this.author, this.created_at, this.description, this.end_date_at, this.id, this.location, this.photo, this.position, this.start_date_at, this.title, this.updated_at});

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
      author: json['author'] != null ? AuthorModel.fromJson(json['author']) : null,
      pivot: json['pivot'] != null ? PivotModel.fromJson(json['pivot']) : null,
      created_at: json['created_at'],
      description: json['description'],
      end_date_at: json['end_date_at'],
      id: json['id'],
      location: json['location'],
      photo: json['photo'],
      send_by: json['send_by'],
      active: json['active'],
      position: json['position'],
      start_date_at: json['start_date_at'],
      // team: json['team'] != null ? (json['team'] as List).map((i) => Object.fromJson(i)).toList() : null,
      title: json['title'],
      updated_at: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['created_at'] = this.created_at;
    data['description'] = this.description;
    data['end_date_at'] = this.end_date_at;
    data['id'] = this.id;
    data['location'] = this.location;
    data['photo'] = this.photo;
    data['position'] = this.position;
    data['start_date_at'] = this.start_date_at;
    data['title'] = this.title;
    data['updated_at'] = this.updated_at;
    if (this.author != null) {
      data['author'] = this.author.toJson();
    }
    // if (this.team != null) {
    //     data['team'] = this.team.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}
class PivotModel {
  String knowledge_id;
  String project_id;

    PivotModel({this.knowledge_id,this.project_id});

    factory PivotModel.fromJson(Map<String, dynamic> json) {
        return PivotModel(
          knowledge_id: json['knowledge_id'],
          project_id: json['project_id'],
        );
    }

    Map<String, dynamic> toJson() {
      final Map<String, dynamic> data = new Map<String, dynamic>();
      data['knowledge_id'] = this.knowledge_id;
      data['project_id'] = this.project_id;
      return data;
    }
}
