import 'package:dana/presentation/controller/cv_user_controller.dart';
import 'package:dana/presentation/pages/sub_pages/cv_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'cv_user_widget.dart';
class CvUserPage extends StatelessWidget{
  String parameters='';
  CvUserPage(){
    parameters = '?personal_code=${Get.arguments[0]}';
  }
  @override
  Widget build(BuildContext context) {
    return CvUserWidget(parameters: parameters,);
  }
}
