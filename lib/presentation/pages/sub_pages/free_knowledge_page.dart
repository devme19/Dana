import 'package:dana/presentation/controller/free_knowledge_controller.dart';
import 'package:dana/presentation/model/state_status.dart';
import 'package:dana/presentation/widgets/connection_error_widget.dart';
import 'package:dana/presentation/widgets/free_knowledge_item_widget.dart';
import 'package:dana/presentation/widgets/header_widget.dart';
import 'package:dana/presentation/widgets/user_level_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class FreeKnowledgePage extends GetView<FreeKnowledgeController> {
  String parameters;
  ScrollController _scrollController = ScrollController();
  int pageIndex=1;

  _scrollListener() {
    if (_scrollController.offset >= _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      if(controller.freeKnowledgeEntity.data.items.length !=0)
        pageIndex = int.parse(controller.freeKnowledgeEntity.data.page)+1;
      parameters = '?page=$pageIndex&pagesize=10&sortby=created_at';
      controller.getFreeKnowledge(parameters);
    }
  }
  FreeKnowledgePage(){
    parameters = '?page=1&pagesize=10&sortby=created_at';
    controller.getFreeKnowledge(parameters);
    _scrollController.addListener(_scrollListener);
  }
  retry(bool retry){
    parameters = '?page=1&pagesize=10&sortby=created_at';
    controller.getFreeKnowledge(parameters);
  }
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar:AppBar(
          title: Text('دانش های آشکار'),
        ) ,
        body:
            Obx(()=>
            controller.getFreeKnowledgeState.value == StateStatus.ERROR?
            ConnectionErrorWidget(parentAction: retry,):
            controller.items.length>0?
            Column(children: [
              Expanded(child: buildList()),
              controller.getFreeKnowledgeState.value == StateStatus.LOADING?
              Container(height: 8,child: LinearProgressIndicator(
                backgroundColor: Colors.transparent,
                valueColor: new AlwaysStoppedAnimation<Color>(Color(0xffE1AD41)),
              ),):Container()
            ],):controller.getFreeKnowledgeState.value == StateStatus.LOADING?
            SpinKitDualRing(color: Colors.orange):Container(),
            )
      );
  }
  Widget buildList(){
    return ListView.builder(
        controller: _scrollController,
        shrinkWrap: true,
        itemBuilder: (context,index){
          return FreeKnowledgeItemWidget(item: controller.items[index],);
        },
        itemCount:controller.items.length);
  }
}
