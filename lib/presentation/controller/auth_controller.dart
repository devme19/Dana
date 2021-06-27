import 'package:dana/core/error/failures.dart';
import 'package:dana/core/usecase/usecase.dart';
import 'package:dana/domain/usecase/user/get_educations_usecase.dart';
import 'package:dana/domain/usecase/user/login_usecase.dart';
import 'package:dana/presentation/model/state_status.dart';
import 'package:dana/presentation/navigation/dana.dart';
import 'package:dana/presentation/widgets/alert_dialog.dart';
import 'package:get/get.dart';

class AuthController extends GetxController{
  var userLoginState = StateStatus.INITIAL.obs;
  var getEducationsState = StateStatus.INITIAL.obs;
  login(Map body){
    userLoginState.value = StateStatus.LOADING;
    LoginUseCase loginUseCase = Get.find();
    loginUseCase.call(Params(body: body)).then((response) {
      if(response.isRight){
        userLoginState.value = StateStatus.SUCCESS;
        Get.offAndToNamed(DanaRoutes.homePage);
      }else if(response.isLeft){
        ServerFailure failure = response.fold((failure) => failure,null);
        if(failure.errorCode == 422)
          MyAlertDialog.show(['ایمیل یا کلمه عبور اشتباه است'], true);
        userLoginState.value = StateStatus.ERROR;
      }
    });
  }
  // getEducations(){
  //   getEducationsState.value = StateStatus.LOADING;
  //   GetEducationUseCase getEducationUseCase = Get.find();
  //   getEducationUseCase.call(NoParams()).then((response) {
  //     if(response.isRight){
  //       getEducationsState.value = StateStatus.SUCCESS;
  //     }else if(response.isLeft){
  //       getEducationsState.value = StateStatus.ERROR;
  //     }
  //   });
  // }
}