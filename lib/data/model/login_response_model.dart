import 'package:dana/domain/entity/login_response_entity.dart';

class LoginResponseModel extends LoginResponseEntity {
    LoginResponseModel({
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

    factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
        return LoginResponseModel(
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
    String access_token;
    String expires_at;
    String token_type;

    Data({this.access_token, this.expires_at, this.token_type});

    factory Data.fromJson(Map<String, dynamic> json) {
        return Data(
            access_token: json['access_token'],
            expires_at: json['expires_at'],
            token_type: json['token_type'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['access_token'] = this.access_token;
        data['expires_at'] = this.expires_at;
        data['token_type'] = this.token_type;
        return data;
    }
}