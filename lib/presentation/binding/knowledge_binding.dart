import 'package:dana/domain/usecase/user/get_knowledge_usecase.dart';
import 'package:dana/domain/usecase/user/like_usecase.dart';
import 'package:dana/presentation/controller/knowledge_controller.dart';
import 'package:get/get.dart';

class KnowledgeBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<GetKnowledgeUseCase>(() => GetKnowledgeUseCase(
        repository: Get.find()
    ));
    Get.lazyPut<KnowledgeController>(() => KnowledgeController());
    Get.lazyPut<LikeUseCase>(() => LikeUseCase(
        repository: Get.find()
    ));
  }

}