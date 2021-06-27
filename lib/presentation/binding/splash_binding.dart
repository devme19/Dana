import 'package:dana/domain/usecase/user/is_login_usecase.dart';
import 'package:dana/presentation/controller/splash_controller.dart';
import 'package:get/get.dart';

class SplashBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController());
    Get.lazyPut<IsLoginUseCase>(() => IsLoginUseCase(
      repository: Get.find()
    ));
  }

}