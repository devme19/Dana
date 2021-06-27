import 'package:dana/core/usecase/usecase.dart';
import 'package:dana/data/model/free_knowledge_model.dart';
import 'package:dana/data/model/like_model.dart';
import 'package:dana/domain/entity/free_knowledge_entity.dart';
import 'package:dana/domain/entity/like_entity.dart';
import 'package:dana/domain/usecase/user/get_free_knowledge_usecase.dart';
import 'package:dana/domain/usecase/user/like_free_knowledge_usecase.dart';
import 'package:dana/presentation/model/state_status.dart';
import 'package:get/get.dart';

class FreeKnowledgeController extends GetxController{

  var getFreeKnowledgeState = StateStatus.INITIAL.obs;
  FreeKnowledgeEntity freeKnowledgeEntity = FreeKnowledgeEntity();
  List<Item> items=[];
  RxBool likeValue = false.obs;
  getFreeKnowledge(String parameters){
    getFreeKnowledgeState.value = StateStatus.LOADING;
    GetFreeKnowledgeUseCase getFreeKnowledgeUseCase = Get.find();
    getFreeKnowledgeUseCase.call(Params(value: parameters)).then((response) {
      if(response.isRight){
        getFreeKnowledgeState.value = StateStatus.SUCCESS;
        freeKnowledgeEntity = response.fold((_) => freeKnowledgeEntity,(freeKnowledgeEntity) => freeKnowledgeEntity);
        items.addAll(freeKnowledgeEntity.data.items);
      }else if(response.isLeft){
        getFreeKnowledgeState.value = StateStatus.ERROR;
      }
    });
  }

  like(String id){
    likeValue.value = !likeValue.value;
    Map<String, dynamic> jsonMap;
    jsonMap = {
      'id': id,
      'type': likeValue.value?1:0,
    };
    postLike(jsonMap);
  }
  postLike(Map body){
    LikeFreeKnowledgeUseCase likeFreeKnowledgeUseCase = Get.find();
    likeFreeKnowledgeUseCase.call(Params(body: body)).then((response) {
      if(response.isRight){
        // if(isLike.value)
        //   userLiked.add(likeResponseEntity.data.user);
        // else {
        //   GetStorage box = GetStorage();
        //   String userID = box.read('userId');
        //   for (int i = 0; i < userLiked.length; i++) {
        //     if (userLiked[i].id == userID) {
        //       userLiked.removeAt(i);
        //       break;
        //     }
        //   }
        }
    });
  }
}