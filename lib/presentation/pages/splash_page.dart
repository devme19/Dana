import 'package:dana/presentation/controller/splash_controller.dart';
import 'package:dana/presentation/model/state_status.dart';
import 'package:dana/presentation/widgets/connection_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
class SplashPage extends GetView<SplashController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(()=>controller.isLoginState.value == StateStatus.LOADING?
      SpinKitDualRing(color: Colors.orange):
          controller.isLoginState.value == StateStatus.ERROR?
              ConnectionErrorWidget(parentAction: onError,):
              Container()
      )
    );
  }
  onError(bool error){
    controller.isLogin();
  }
}
