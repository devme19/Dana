import 'package:dana/data/model/like_response_model.dart';
class LikeResponseEntity{
  Data data;
  int code;
  String locale;
  String message;
  bool success;
  LikeResponseEntity({
    this.data,
    this.code,
    this.locale,
    this.message,
    this.success
});
}