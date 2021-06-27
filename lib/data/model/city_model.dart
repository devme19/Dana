import 'package:dana/domain/entity/city_entity.dart';

class City extends CityEntity{
  City({
    int id,
    String name,
    String province_id,
  }):super(id: id,name: name,provinceId: province_id);

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
    data['province_id'] = this.provinceId;
    return data;
  }
}