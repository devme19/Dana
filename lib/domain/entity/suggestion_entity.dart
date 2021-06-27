import 'package:dana/data/model/suggestion_model.dart';

class SuggestionEntity{
  Data data;
  int code;
  String locale;
  String message;
  bool success;
  SuggestionEntity({
    this.data,
    this.code,
    this.locale,
    this.message,
    this.success
  });
}