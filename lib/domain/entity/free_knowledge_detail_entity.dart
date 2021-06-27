import 'package:dana/data/model/free_knowledge_detail_model.dart';

class FreeKnowledgeDetailEntity{
  Data data;
  int code;
  String locale;
  String message;
  bool success;

  FreeKnowledgeDetailEntity(
      {this.data, this.code, this.locale, this.message, this.success});
}