
import 'package:dana/core/error/failures.dart';
import 'package:dana/domain/entity/education_list_response_entity.dart';
import 'package:dana/domain/entity/follow_entity.dart';
import 'package:dana/domain/entity/free_knowledge_detail_entity.dart';
import 'package:dana/domain/entity/free_knowledge_entity.dart';
import 'package:dana/domain/entity/info_entity.dart';
import 'package:dana/domain/entity/knowledge_detail_entity.dart';
import 'package:dana/domain/entity/knowledge_entity.dart';
import 'package:dana/domain/entity/like_response_entity.dart';
import 'package:dana/domain/entity/login_response_entity.dart';
import 'package:dana/domain/entity/suggestion_entity.dart';
import 'package:either_option/either_option.dart';

abstract class DanaRepository {
  ////////////// user /////////////
  Future<Either<Failure,LoginResponseEntity>> login(Map body);
  Future<Either<Failure,bool>> logOut();
  Future<Either<Failure,EducationListResponseEntity>> getEducations();
  Future<Either<Failure,CvEntity>> getCv(String parameters);
  Future<Either<Failure,CvEntity>> isLogin();
  Future<Either<Failure,FollowEntity>> getFollowers(String parameters);
  Future<Either<Failure,FollowEntity>> getFollowing(String parameters);
  Future<Either<Failure,SuggestionEntity>> getSuggestions(String parameters);
  ////////////////////////////////////////
  Future<Either<Failure,KnowledgeEntity>> getKnowledge(String parameters);
  Future<Either<Failure,KnowledgeDetailEntity>> getKnowledgeDetail(String parameters);
  Future<Either<Failure,LikeResponseEntity>> like(Map body);
  Future<Either<Failure,bool>> follow(Map body);
  Future<Either<Failure,bool>> likeFreeKnowledge(Map body);
  Future<Either<Failure,FreeKnowledgeEntity>> getFreeKnowledge(String parameters);
  Future<Either<Failure,FreeKnowledgeDetailEntity>> getFreeKnowledgeDetail(String id);

}