import 'package:dana/domain/entity/education_list_response_entity.dart';

class EducationListResponseModel extends EducationListResponseEntity{


    EducationListResponseModel({
      Data data,
      int code,
      String locale,
      String message,
      bool success,}):
    super(
            success: success,
          code: code,
          locale: locale,
          message: message,
          data: data
        );

    factory EducationListResponseModel.fromJson(Map<String, dynamic> json) {
        return EducationListResponseModel(
            data: json['data'] != null ? Data.fromJson(json['data']) : null,
            code: json['code'], 
            locale: json['locale'], 
            message: json['message'], 
            success: json['success'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['code'] = this.code;
        data['locale'] = this.locale;
        data['message'] = this.message;
        data['success'] = this.success;
        if (this.data != null) {
            data['data'] = this.data.toJson();
        }
        return data;
    }
}

class Data {
    List<Value> values;

    Data({this.values});

    factory Data.fromJson(Map<String, dynamic> json) {
        return Data(
            values: json['values'] != null ? (json['values'] as List).map((i) => Value.fromJson(i)).toList() : null, 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        if (this.values != null) {
            data['values'] = this.values.map((v) => v.toJson()).toList();
        }
        return data;
    }
}

class Value {
    String activities_societies;
    String created_at;
    String degree;
    String end_date_at;
    String field_of_study;
    Grade grade;
    String id;
    String school;
    String start_date_at;
    String updated_at;
    Object user_educationcol;

    Value({this.activities_societies, this.created_at, this.degree, this.end_date_at, this.field_of_study, this.grade, this.id, this.school, this.start_date_at, this.updated_at, this.user_educationcol});

    factory Value.fromJson(Map<String, dynamic> json) {
        return Value(
            activities_societies: json['activities_societies'],
            created_at: json['created_at'], 
            degree: json['degree'],
            end_date_at: json['end_date_at'], 
            field_of_study: json['field_of_study'], 
            grade: json['grade'] != null ? Grade.fromJson(json['grade']) : null, 
            id: json['id'], 
            school: json['school'], 
            start_date_at: json['start_date_at'], 
            updated_at: json['updated_at'], 
            user_educationcol: json['user_educationcol'] ,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['created_at'] = this.created_at;
        data['end_date_at'] = this.end_date_at;
        data['field_of_study'] = this.field_of_study;
        data['id'] = this.id;
        data['school'] = this.school;
        data['start_date_at'] = this.start_date_at;
        data['updated_at'] = this.updated_at;
        data['activities_societies'] = this.activities_societies;
        data['degree'] = this.degree;
        data['grade'] = this.grade;
        data['user_educationcol'] = this.user_educationcol;
        return data;
    }
}

class Grade {
    String id;
    String title;

    Grade({this.id, this.title});

    factory Grade.fromJson(Map<String, dynamic> json) {
        return Grade(
            id: json['id'], 
            title: json['title'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['id'] = this.id;
        data['title'] = this.title;
        return data;
    }
}