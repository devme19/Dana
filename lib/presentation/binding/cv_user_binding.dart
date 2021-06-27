import 'package:dana/domain/usecase/user/get_cv_usecase.dart';
import 'package:dana/domain/usecase/user/get_followers_usecase.dart';
import 'package:dana/domain/usecase/user/get_following_usecase.dart';
import 'package:dana/presentation/controller/cv_controller.dart';
import 'package:dana/presentation/controller/cv_user_controller.dart';
import 'package:get/get.dart';

class CvUserBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<CvUserController>(() => CvUserController());
    Get.lazyPut<GetCvUseCase>(() => GetCvUseCase(
        repository: Get.find()
    ));
    Get.lazyPut<GetFollowingUseCase>(() => GetFollowingUseCase(
        repository: Get.find()
    ));
    Get.lazyPut<GetFollowersUseCase>(() => GetFollowersUseCase(
        repository: Get.find()
    ));
  }

}