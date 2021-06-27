import 'package:dana/domain/usecase/user/get_free_knowledge_usecase.dart';
import 'package:dana/presentation/controller/free_knowledge_controller.dart';
import 'package:get/get.dart';

class FreeKnowledgeBinding extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut<GetFreeKnowledgeUseCase>(() => GetFreeKnowledgeUseCase(
      repository: Get.find()
    ));
    Get.lazyPut<FreeKnowledgeController>(() => FreeKnowledgeController());
  }

}