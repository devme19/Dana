import 'package:dana/domain/entity/expert_tree_entity.dart';

class ExpertTree extends ExpertTreeEntity{


  ExpertTree({
    String active,
    String icon,
    String id,
    String parent_id,
    String title,
}):super(
    active: active,
    title: title,
    id: id,
    icon: icon,
    parentId:parent_id
  );

  factory ExpertTree.fromJson(Map<String, dynamic> json) {
    return ExpertTree(
      active: json['active'],
      icon: json['icon'],
      id: json['id'],
      parent_id: json['parent_id'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['active'] = this.active;
    data['icon'] = this.icon;
    data['id'] = this.id;
    data['parent_id'] = this.parentId;
    data['title'] = this.title;
    return data;
  }
}