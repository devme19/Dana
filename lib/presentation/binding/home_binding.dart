import 'package:dana/domain/usecase/user/follow_usecase.dart';
import 'package:dana/domain/usecase/user/get_cv_usecase.dart';
import 'package:dana/domain/usecase/user/get_followers_usecase.dart';
import 'package:dana/domain/usecase/user/get_following_usecase.dart';
import 'package:dana/domain/usecase/user/get_knowledge_usecase.dart';
import 'package:dana/domain/usecase/user/get_suggestions_usecase.dart';
import 'package:dana/domain/usecase/user/logout_usecase.dart';
import 'package:dana/presentation/controller/cv_controller.dart';
import 'package:dana/presentation/controller/explicit_knowledge_controller.dart';
import 'package:dana/presentation/controller/friend_suggestion_controller.dart';
import 'package:dana/presentation/controller/home_controller.dart';
import 'package:dana/presentation/controller/knowledge_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<CvController>(() => CvController());
    Get.lazyPut<GetCvUseCase>(() => GetCvUseCase(
      repository: Get.find()
    ));
    Get.lazyPut<GetFollowingUseCase>(() => GetFollowingUseCase(
        repository: Get.find()
    ));
    Get.lazyPut<GetFollowersUseCase>(() => GetFollowersUseCase(
        repository: Get.find()
    ));
    Get.lazyPut<GetSuggestionsUseCase>(() => GetSuggestionsUseCase(
        repository: Get.find()
    ));
    Get.lazyPut<LogOutUseCase>(() => LogOutUseCase(
        repository: Get.find()
    ));
    Get.lazyPut<FollowUseCase>(() => FollowUseCase(
        repository: Get.find()
    ));
    Get.lazyPut<FriendSuggestionController>(() => FriendSuggestionController());
    Get.lazyPut<ExplicitKnowledgeController>(() => ExplicitKnowledgeController());


  }

}