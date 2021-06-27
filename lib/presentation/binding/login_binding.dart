import 'package:dana/domain/usecase/user/get_educations_usecase.dart';
import 'package:dana/domain/usecase/user/login_usecase.dart';
import 'package:dana/presentation/controller/auth_controller.dart';
import 'package:get/get.dart';

class LoginBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<LoginUseCase>(() => LoginUseCase(repository: Get.find()));
    Get.lazyPut<AuthController>(() => AuthController());
  }

}