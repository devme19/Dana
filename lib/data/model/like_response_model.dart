import 'package:dana/data/model/author_model.dart';
import 'package:dana/domain/entity/like_response_entity.dart';

import 'user_model.dart';

class LikeResponseModel extends LikeResponseEntity{


    LikeResponseModel({
      Data data,
      int code,
      String locale,
      String message,
      bool success,
}):super(
      data: data,
      code: code,
      locale: locale,
      message: message,
      success: success
    );

    factory LikeResponseModel.fromJson(Map<String, dynamic> json) {
        return LikeResponseModel(
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
    String message;
    AuthorModel user;

    Data({this.message, this.user});

    factory Data.fromJson(Map<String, dynamic> json) {
        return Data(
            message: json['message'], 
            user: json['user'] != null ? AuthorModel.fromJson(json['user']) : null,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['message'] = this.message;
        if (this.user != null) {
            data['user'] = this.user.toJson();
        }
        return data;
    }
}