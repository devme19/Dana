import 'dart:convert';

import 'package:dana/core/usecase/usecase.dart';
import 'package:dana/data/model/author_model.dart';
import 'package:dana/data/model/like_model.dart';
import 'package:dana/domain/entity/knowledge_detail_entity.dart';
import 'package:dana/domain/entity/like_response_entity.dart';
import 'package:dana/domain/usecase/user/get_knowledge_usecase.dart';
import 'package:dana/domain/usecase/user/get_knowledge_detail_usecase.dart';
import 'package:dana/domain/usecase/user/like_usecase.dart';
import 'package:dana/presentation/controller/knowledge_controller.dart';
import 'package:dana/presentation/model/state_status.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class KnowledgeDetailController extends GetxController{
  var getKnowledgeDetailState = StateStatus.INITIAL.obs;
  LikeResponseEntity likeResponseEntity = LikeResponseEntity();
  KnowledgeDetailEntity knowledgeDetailEntity = KnowledgeDetailEntity();
  RxList userLiked=[].obs;
  RxBool isLike = false.obs;
  String kCode;
  like(String kC){
    kCode = kC;
    isLike.value = !isLike.value;
    postLike(LikeModel(kcode: kCode,type: isLike.value?1:0).toJson());

  }
  postLike(Map body){
    LikeUseCase likeUseCase = Get.find();
    likeUseCase.call(Params(body: body)).then((response) {
      if(response.isRight){
        likeResponseEntity = response.fold((_) => likeResponseEntity,(likeResponseEntity) => likeResponseEntity);
        if(isLike.value)
          userLiked.add(likeResponseEntity.data.user);
        else {
          GetStorage box = GetStorage();
          String userID = box.read('userId');
          for (int i = 0; i < userLiked.length; i++) {
            if (userLiked[i].id == userID) {
              userLiked.removeAt(i);
              break;
            }
          }
        }
      }
    });
  }
  getKnowledgeDetail(String parameters){
    getKnowledgeDetailState.value = StateStatus.LOADING;
    GetKnowledgeDetailUseCase getKnowledgeUseCase = Get.find();
    getKnowledgeUseCase.call(Params(value: parameters)).then((response) {
      if(response.isRight){
        userLiked.clear();
        getKnowledgeDetailState.value = StateStatus.SUCCESS;
        knowledgeDetailEntity = response.fold((_) => knowledgeDetailEntity,(knowledgeDetailEntity) => knowledgeDetailEntity);
        userLiked.addAll(knowledgeDetailEntity.data.likes);
        if(knowledgeDetailEntity.data.userliked == 1)
          isLike.value = true;
      }else if(response.isLeft){
        getKnowledgeDetailState.value = StateStatus.ERROR;
      }
    });
  }

}