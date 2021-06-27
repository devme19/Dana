import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExplicitKnowledgeController extends GetxController{
  RxBool like = false.obs;
  likePress(){
    like.value = !like.value;
  }
}
