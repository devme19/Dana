import 'package:dana/data/model/follow_model.dart';

class FollowEntity {
  Data data;
  int code;
  String locale;
  String message;
  bool success;
  FollowEntity({
    this.data,
    this.code,
    this.locale,
    this.message,
    this.success
});
}