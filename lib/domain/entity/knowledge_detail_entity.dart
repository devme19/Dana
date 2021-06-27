import 'package:dana/data/model/knowledge_detail_model.dart';

class KnowledgeDetailEntity{
  Data data;
  int code;
  String locale;
  String message;
  bool success;
  KnowledgeDetailEntity({
    this.data,
    this.code,
    this.locale,
    this.message,
    this.success
});
}