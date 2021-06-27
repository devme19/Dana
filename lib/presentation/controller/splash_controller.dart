import 'package:dana/core/config/config.dart';
import 'package:dana/core/error/failures.dart';
import 'package:dana/core/usecase/usecase.dart';
import 'package:dana/domain/usecase/user/is_login_usecase.dart';
import 'package:dana/presentation/model/state_status.dart';
import 'package:dana/presentation/navigation/dana.dart';
import 'package:get/get.dart';

class SplashController extends GetxController{
  var isLoginState = StateStatus.INITIAL.obs;

  @override
  void onInit() {
    super.onInit();

    Future.delayed(Duration(milliseconds: 500), () {
      isLogin();
      // Get.offAndToNamed(DanaRoutes.homePage);
    });

  }

  isLogin(){
    isLoginState.value = StateStatus.LOADING;
    IsLoginUseCase isLoginUseCase  = Get.find();
    isLoginUseCase.call(NoParams()).then((response) {
      if(response.isRight){
        isLoginState.value = StateStatus.SUCCESS;
        Get.offAndToNamed(DanaRoutes.homePage);
      }else if(response.isLeft)
        {
          ServerFailure failure;
          failure = response.fold((failure) => failure,null);
          if(failure.errorCode == notAuthenticated)
            Get.offAndToNamed(DanaRoutes.loginPage);
          else
            isLoginState.value = StateStatus.ERROR;
        }

    });

  }
}