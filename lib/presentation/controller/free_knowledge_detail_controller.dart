import 'package:dana/core/usecase/usecase.dart';
import 'package:dana/domain/entity/free_knowledge_detail_entity.dart';
import 'package:dana/domain/usecase/user/get_free_knowledge_detail_usecase.dart';
import 'package:dana/presentation/model/state_status.dart';
import 'package:get/get.dart';

class FreeKnowledgeDetailController extends GetxController{
  var getFreeKnowledgeDetailStatus = StateStatus.INITIAL.obs;
  Rx<FreeKnowledgeDetailEntity> freeKnowledgeDetailEntity = FreeKnowledgeDetailEntity().obs;
  getFreeKnowledgeDetail(String id){
    getFreeKnowledgeDetailStatus.value = StateStatus.LOADING;
    GetFreeKnowledgeDetailUseCase getFreeKnowledgeDetailUseCase = Get.find();
    getFreeKnowledgeDetailUseCase.call(Params(id: id)).then((response) {
      if(response.isRight){
        getFreeKnowledgeDetailStatus.value = StateStatus.SUCCESS;
        freeKnowledgeDetailEntity.value = response.fold((_) => freeKnowledgeDetailEntity.value,(freeKnowledgeDetailEntity) => freeKnowledgeDetailEntity);
      }
      else if(response.isLeft){
        getFreeKnowledgeDetailStatus.value = StateStatus.ERROR;
      }
    });
  }
}