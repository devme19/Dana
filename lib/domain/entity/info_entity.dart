import 'package:dana/data/model/cv_model.dart';

class CvEntity{
  Data data;
  int code;
  String locale;
  String message;
  bool success;
  CvEntity({
    this.data,
    this.code,
    this.locale,
    this.message,
    this.success
});
}