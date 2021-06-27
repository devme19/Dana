import 'package:dana/domain/usecase/user/get_knowledge_detail_usecase.dart';
import 'package:dana/domain/usecase/user/like_usecase.dart';
import 'package:dana/presentation/controller/knowledge_detail_controller.dart';
import 'package:get/get.dart';

class KnowledgeDetailBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<KnowledgeDetailController>(() => KnowledgeDetailController());
    Get.lazyPut<GetKnowledgeDetailUseCase>(() => GetKnowledgeDetailUseCase(
      repository: Get.find()
    ));
    Get.lazyPut<LikeUseCase>(() => LikeUseCase(
        repository: Get.find()
    ));
  }

}