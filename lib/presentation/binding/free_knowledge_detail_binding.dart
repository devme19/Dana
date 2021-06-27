import 'package:dana/domain/usecase/user/get_free_knowledge_detail_usecase.dart';
import 'package:dana/presentation/controller/free_knowledge_detail_controller.dart';
import 'package:get/get.dart';

class FreeKnowledgeDetailBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<GetFreeKnowledgeDetailUseCase>(() => GetFreeKnowledgeDetailUseCase(
      repository: Get.find()
    ));
    Get.lazyPut<FreeKnowledgeDetailController>(() => FreeKnowledgeDetailController());
  }

}