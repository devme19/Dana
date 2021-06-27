
import 'package:dana/data/model/education_list_response_model.dart';
import 'package:dana/data/model/cv_model.dart';
import 'package:dana/data/model/follow_model.dart';
import 'package:dana/data/model/free_knowledge_detail_model.dart';
import 'package:dana/data/model/free_knowledge_model.dart';
import 'package:dana/data/model/knowledge_detail_model.dart';
import 'package:dana/data/model/knowledge_model.dart';
import 'package:dana/data/model/like_response_model.dart';
import 'package:dana/data/model/login_response_model.dart';
import 'package:dana/data/model/suggestion_model.dart';
import 'package:dana/domain/entity/free_knowledge_detail_entity.dart';

class Generics {
  static T fromJson<T,K>(dynamic json) {
    print(T);
    print(K);
    if (json is Iterable) {
      return _fromJsonList<K>(json) as T;
    }
    else
    if (T == LoginResponseModel) {
      return LoginResponseModel.fromJson(json) as T;
    }
    else
    if (T == EducationListResponseModel) {
      return EducationListResponseModel.fromJson(json) as T;
    }
    else
    if (T == CvModel) {
      return CvModel.fromJson(json) as T;
    }
    else
    if (T == FollowModel) {
      return FollowModel.fromJson(json) as T;
    }
    else
    if (T == SuggestionModel) {
      return SuggestionModel.fromJson(json) as T;
    }
    else
    if (T == KnowledgeModel) {
      return KnowledgeModel.fromJson(json) as T;
    }
    else
    if (T == KnowledgeDetailModel) {
      return KnowledgeDetailModel.fromJson(json) as T;
    }
    else
    if (T == LikeResponseModel) {
      return LikeResponseModel.fromJson(json) as T;
    }
    else
    if (T == FreeKnowledgeModel) {
      return FreeKnowledgeModel.fromJson(json) as T;
    }
    else
    if (T == FreeKnowledgeDetailModel) {
      return FreeKnowledgeDetailModel.fromJson(json) as T;
    }
    else
      {
        throw Exception("Unknown class");
      }

  }
  static List<K> _fromJsonList<K>(List jsonList) {
    if (jsonList == null) {
      return null;
    }

    List<K> output = List();

    for (Map<String, dynamic> json in jsonList) {
      output.add(fromJson(json));
    }
    return output;
  }
}