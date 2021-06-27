import 'package:dana/domain/entity/organization_chart_entity.dart';

class OrganizationalChart extends OrganizationChartEntity{


  OrganizationalChart({
    String active,
    String id,
    String parent_id,
    String title,
}):super(
    id: id,
    parentId: parent_id,
    title: title,
    active: active
  );

  factory OrganizationalChart.fromJson(Map<String, dynamic> json) {
    return OrganizationalChart(
      active: json['active'],
      id: json['id'],
      parent_id: json['parent_id'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['active'] = this.active;
    data['id'] = this.id;
    data['parent_id'] = this.parentId;
    data['title'] = this.title;
    return data;
  }
}