import 'package:dana/domain/entity/suggestion_entity.dart';

import 'user_model.dart';

class SuggestionModel extends SuggestionEntity{


    SuggestionModel({
        Data data,
        int code,
        String locale,
        String message,
        bool success,
}):super(data: data,code: code,locale: locale,message: message,success: success);

    factory SuggestionModel.fromJson(Map<String, dynamic> json) {
        return SuggestionModel(
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
        data['data'] = this.data;
        return data;
    }
}

class Data {
    String page;
    int pageSize;
    String sortBy;
    int total;
    List<User> users;

    Data({this.page, this.pageSize, this.sortBy, this.total, this.users});

    factory Data.fromJson(Map<String, dynamic> json) {
        return Data(
            page: json['page'], 
            pageSize: json['pageSize'], 
            sortBy: json['sortBy'], 
            total: json['total'], 
            users: json['users'] != null ? (json['users'] as List).map((i) => User.fromJson(i)).toList() : null, 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['page'] = this.page;
        data['pageSize'] = this.pageSize;
        data['sortBy'] = this.sortBy;
        data['total'] = this.total;
        if (this.users != null) {
            data['users'] = this.users.map((v) => v.toJson()).toList();
        }
        return data;
    }
}



