import 'package:dana/domain/entity/compas_entity.dart';

class Compass extends CompassEntity{


  Compass({
    String id,
    String parent_id,
    String title,
}):super(id: id,title: title,parentId: parent_id);

  factory Compass.fromJson(Map<String, dynamic> json) {
    return Compass(
      id: json['id'],
      parent_id: json['parent_id'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['parent_id'] = this.parentId;
    data['title'] = this.title;
    return data;
  }
}