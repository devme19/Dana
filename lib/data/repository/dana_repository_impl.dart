import 'package:dana/core/config/config.dart';
import 'package:dana/core/error/exceptions.dart';
import 'package:dana/core/error/failures.dart';
import 'package:dana/data/datasource/local/dana_local_datasource.dart';
import 'package:dana/data/datasource/remote/dana_remote_datasource.dart';
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
import 'package:dana/domain/repository/dana_repository.dart';
import 'package:either_option/src/either.dart';

class DanaRepositoryImpl implements DanaRepository{

  final DanaRemoteDataSource remoteDataSource;
  final DanaLocalDataSource localDataSource;
  DanaRepositoryImpl({this.remoteDataSource,this.localDataSource});

  /////////////////// User /////////////////


  @override
  Future<Either<Failure, LoginResponseEntity>> login(Map body) async{
    try{
      final response = await remoteDataSource.post <LoginResponseModel,Null>( body,'auth/login');
      localDataSource.saveToken(response.data.access_token);
      return Right(response);
    }on ServerException catch(e){
      return Left(ServerFailure(errorCode: e.errorCode,errorMessage: e.errorMessage));
    }
  }
  @override
  Future<Either<Failure, EducationListResponseEntity>> getEducations() async{
    try{
      final response = await remoteDataSource.get <EducationListResponseModel,Null>('user/education/list');
      return Right(response);
    }on ServerException catch(e){
      return Left(ServerFailure(errorCode: e.errorCode,errorMessage: e.errorMessage));
    }

  }

  @override
  Future<Either<Failure, CvEntity>> getCv(String parameters) async{
   try{
     final response = await remoteDataSource.get <CvModel,Null>('user/info$parameters');
     if(parameters=='')
       localDataSource.setUserId(response.data.id);
     return Right(response);
   }on ServerException catch(e){
     return Left(ServerFailure(errorCode: e.errorCode,errorMessage: e.errorMessage));
   }
  }
  @override
  Future<Either<Failure, CvEntity>> isLogin() async{
    try{
      if(localDataSource.getToken() == null)
        return Left(ServerFailure(errorCode: notAuthenticated));
      else {
        final response = await remoteDataSource.get <CvModel,Null>('user/info');
        return Right(response);
      }
      // final response = await remoteDataSource.get <InfoModel,Null>('user/info');
      // localDataSource.saveUserInfo(response);
      // return Right(response);
    }on ServerException catch(e){
      return Left(ServerFailure(errorCode: e.errorCode,errorMessage: e.errorMessage));
    }
  }

  @override
  Future<Either<Failure, FollowEntity>> getFollowers(String parameters) async{
    try{
      final response = await remoteDataSource.get <FollowModel,Null>('user/follow/followers'+parameters);
      return Right(response);
    }on ServerException catch(e){
      return Left(ServerFailure(errorCode: e.errorCode,errorMessage: e.errorMessage));
    }
  }

  @override
  Future<Either<Failure, FollowEntity>> getFollowing(String parameters) async{
    try{
    final response = await remoteDataSource.get <FollowModel,Null>('user/follow/following'+parameters);
    return Right(response);
    }on ServerException catch(e){
    return Left(ServerFailure(errorCode: e.errorCode,errorMessage: e.errorMessage));
    }
  }

  @override
  Future<Either<Failure, SuggestionEntity>> getSuggestions(String parameters) async{
    try{
      final response = await remoteDataSource.get <SuggestionModel,Null>('user/suggestions'+parameters);
      return Right(response);
    }on ServerException catch(e){
      return Left(ServerFailure(errorCode: e.errorCode,errorMessage: e.errorMessage));
    }
  }

  @override
  Future<Either<Failure, bool>> logOut() async{
    try{
      return Right(localDataSource.logOut());
    }on CacheException catch(e){
      return Left(CacheFailure());
    }
  }
////////////////////////////////////////////////
  @override
  Future<Either<Failure, KnowledgeEntity>> getKnowledge(String parameters) async{
    try{
      final response = await remoteDataSource.get <KnowledgeModel,Null>('user/knowledges'+parameters);
      return Right(response);
    }on ServerException catch(e){
      return Left(ServerFailure(errorCode: e.errorCode,errorMessage: e.errorMessage));
    }
  }

  @override
  Future<Either<Failure, LikeResponseEntity>> like(Map body) async{
    try{
      final response = await remoteDataSource.post <LikeResponseModel,Null>(body, 'knowledge/knowledge/like');
      return Right(response);
    }on ServerException catch(e){
      return Left(ServerFailure(errorCode: e.errorCode,errorMessage: e.errorMessage));
    }
  }

  @override
  Future<Either<Failure, bool>> follow(Map body) async{
    try{
      final response = await remoteDataSource.post <bool,Null>(body, 'user/follow/add');
      return Right(response);
    }on ServerException catch(e){
      return Left(ServerFailure(errorCode: e.errorCode,errorMessage: e.errorMessage));
    }
  }

  @override
  Future<Either<Failure, KnowledgeDetailEntity>> getKnowledgeDetail(String parameters)async {
    try{
      final response = await remoteDataSource.get <KnowledgeDetailModel,Null>('knowledge/knowledge/view'+parameters);
      return Right(response);
    }on ServerException catch(e){
      return Left(ServerFailure(errorCode: e.errorCode,errorMessage: e.errorMessage));
    }
  }

  @override
  Future<Either<Failure, FreeKnowledgeEntity>> getFreeKnowledge(String parameters) async{
    try{
      final response = await remoteDataSource.get <FreeKnowledgeModel,Null>('knowledge/free/list'+parameters);
      return Right(response);
    }on ServerException catch(e){
      return Left(ServerFailure(errorCode: e.errorCode,errorMessage: e.errorMessage));
    }
  }

  @override
  Future<Either<Failure, bool>> likeFreeKnowledge(Map<dynamic, dynamic> body) async{
    try{
      final response = await remoteDataSource.post <bool,Null>(body, 'knowledge/free/like');
      return Right(response);
    }on ServerException catch(e){
      return Left(ServerFailure(errorCode: e.errorCode,errorMessage: e.errorMessage));
    }
  }

  @override
  Future<Either<Failure, FreeKnowledgeDetailModel>> getFreeKnowledgeDetail(String id) async{
    try{
      final response = await remoteDataSource.get<FreeKnowledgeDetailModel,Null>('knowledge/free/view?id=$id');
      return Right(response);
    }on ServerException catch(e){
      return Left(ServerFailure(errorCode: e.errorCode,errorMessage: e.errorMessage));
    }
  }



}