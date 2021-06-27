import 'package:dana/data/model/login_response_model.dart';

class LoginResponseEntity{
  Data data;
  int code;
  String locale;
  String message;
  bool success;
  LoginResponseEntity({
    this.data,
    this.code,
    this.locale,
    this.message,
    this.success
});
}