import 'package:dana/core/usecase/usecase.dart';
import 'package:dana/data/model/knowledge_model.dart';
import 'package:dana/domain/entity/knowledge_entity.dart';
import 'package:dana/domain/usecase/user/get_knowledge_usecase.dart';
import 'package:dana/domain/usecase/user/like_usecase.dart';
import 'package:dana/presentation/model/state_status.dart';
import 'package:get/get.dart';

class KnowledgeController extends GetxController{

  var getKnowledgeState = StateStatus.INITIAL.obs;
  RxBool like = false.obs;
  Rx<KnowledgeEntity> knowledgeEntity = KnowledgeEntity().obs;
  List<Knowledge> knowledge = [];
  getKnowledge(String parameters){
    getKnowledgeState.value = StateStatus.LOADING;
    GetKnowledgeUseCase getKnowledgeUseCase = Get.find();
    getKnowledgeUseCase.call(Params(value: parameters)).then((response) {
      if(response.isRight){
        getKnowledgeState.value = StateStatus.SUCCESS;
        knowledgeEntity.value = response.fold((_) => knowledgeEntity.value,(knowledgeEntity) => knowledgeEntity);
        knowledge.addAll(knowledgeEntity.value.data.knowledges);

      }else if(response.isLeft){
        getKnowledgeState.value = StateStatus.ERROR;
      }
    });
  }
  likePress(){
    like.value = !like.value;
  }
  postLike(String kCode){
    LikeUseCase likeUseCase = Get.find();
    likeUseCase.call(Params(value: kCode)).then((response) {

    });
  }
}