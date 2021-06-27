import 'package:dana/data/model/knowledge_model.dart';

class KnowledgeEntity{
  bool success;
  int code;
  String locale;
  String message;
  Data data;
  KnowledgeEntity({
    this.success,
    this.code,
    this.locale,
    this.message,
    this.data
});
}