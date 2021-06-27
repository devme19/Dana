import 'dart:convert';

import 'package:dana/data/model/like_model.dart';
import 'package:dana/presentation/controller/knowledge_controller.dart';
import 'package:dana/presentation/model/state_status.dart';
import 'package:dana/presentation/widgets/connection_error_widget.dart';
import 'package:dana/presentation/widgets/header_widget.dart';
import 'package:dana/presentation/widgets/knowledge_item_widget.dart';
import 'package:dana/presentation/widgets/user_level_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class KnowledgePage extends GetView<KnowledgeController> {
  String parameters;
  ScrollController _scrollController = ScrollController();
  int pageIndex=1;
  _scrollListener() {
    if (_scrollController.offset >= _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      if(controller.knowledgeEntity.value.data.knowledges.length !=0)
        pageIndex = int.parse(controller.knowledgeEntity.value.data.page)+1;
      parameters = '?page=$pageIndex&pagesize=10&sortby=created_at';
      controller.getKnowledge(parameters);
    }
  }
  KnowledgePage(){
    parameters = '?page=1&pagesize=10&sortby=created_at';
    controller.getKnowledge(parameters);
    _scrollController.addListener(_scrollListener);
  }
  retry(bool retry){
    parameters = '?page=1&pagesize=10&sortby=created_at';
    controller.getKnowledge(parameters);
  }
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(
          title: Text('درس آموخته ها'),
        ),
        body: Obx(()=>
        controller.getKnowledgeState.value == StateStatus.ERROR?
        ConnectionErrorWidget(parentAction: retry,):
        controller.knowledge.length>0?
            Column(children: [
              Expanded(child: buildView()),
              controller.getKnowledgeState.value == StateStatus.LOADING?
              Container(height: 8,child: LinearProgressIndicator(
              backgroundColor: Colors.transparent,
              valueColor: new AlwaysStoppedAnimation<Color>(Color(0xffE1AD41)),
            ),):Container()
            ],):controller.getKnowledgeState.value == StateStatus.LOADING?
          SpinKitDualRing(color: Colors.orange):Container(),
        )
      );
  }
  Widget buildView(){
    return Container(
      padding: EdgeInsets.all(8.0),
      child: ListView.builder(
        controller: _scrollController,
        shrinkWrap: true,
          itemBuilder: (context,index){
        return KnowledgeItemWidget(knowledge: controller.knowledge[index],postLike: postLike);
      },
          itemCount: controller.knowledge.length),
    );
  }
  postLike(LikeModel like){
    controller.postLike( json.encode(like.toJson()));
  }
}
