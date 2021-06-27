import 'package:dana/data/model/free_knowledge_model.dart';

class FreeKnowledgeEntity{
  Data data;
  int code;
  String locale;
  String message;
  bool success;
  FreeKnowledgeEntity({
    this.data,
    this.code,
    this.locale,
    this.message,
    this.success
});
}