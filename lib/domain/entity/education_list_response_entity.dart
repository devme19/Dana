import 'package:dana/data/model/education_list_response_model.dart';

class EducationListResponseEntity{
  Data data;
  int code;
  String locale;
  String message;
  bool success;

  EducationListResponseEntity({
    this.data,
    this.code,
    this.locale,
    this.message,
    this.success
});
}