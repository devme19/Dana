import 'dart:convert';

import 'package:dana/core/config/config.dart';
import 'package:dana/data/model/user_model.dart';
import 'package:dana/domain/entity/user_entity.dart';
import 'package:dana/presentation/controller/friend_suggestion_controller.dart';
import 'package:dana/presentation/model/state_status.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'connection_error_widget.dart';

class FriendSuggestionWidget extends GetView<FriendSuggestionController> {
  ScrollController _scrollController = ScrollController();
  int pageIndex=1;
  FriendSuggestionWidget(){
    controller.suggestionUsers.clear();
    controller.usrId.value = '';
    controller.getSuggestions('?page=1');
    _scrollController.addListener(_scrollListener);
  }
  _scrollListener() {
    if (_scrollController.offset >= _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      if(controller.suggestionUsers.length !=0)
        pageIndex = controller.pageIndex+1;
      controller.getSuggestions('?page='+pageIndex.toString());
    }
  }
  retry(bool value){
    controller.getSuggestions('?page=1');
  }
  @override
  Widget build(BuildContext context) {
    return
      Obx(()=>

      Container(
        height: 300,
        child: Column(
          children: [
            Container(
              height: 60,
              color:Colors.white,
              padding:EdgeInsets.all(16),
              child: Row(
                children: [
                  Text('پیشنهاد دوستان',style: TextStyle(fontWeight: FontWeight.bold),),
                ],
              ),
            ),
            controller.suggestionLength.value>0 || controller.followState.value == StateStatus.LOADING?
            Expanded(
              child: Column(
                children: [
                  Container(
                    height:237,
                    child: ListView.builder(
                        controller: _scrollController,
                        itemCount: controller.suggestionUsers.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context,index){
                          return friendSuggestionItem(controller.suggestionUsers[index],);

                        }),
                  ),
                  controller.getSuggestionsState.value == StateStatus.LOADING?
                  Container(height: 3,child: LinearProgressIndicator(
                    backgroundColor: Colors.transparent,
                    valueColor: new AlwaysStoppedAnimation<Color>(Color(0xffE1AD41)),
                  ),):Container()
                ],
              ),
            ):
            controller.getSuggestionsState.value == StateStatus.LOADING?
            Container(height: 5,child: LinearProgressIndicator(
              backgroundColor: Colors.transparent,
              valueColor: new AlwaysStoppedAnimation<Color>(Color(0xffE1AD41)),
            ),):controller.getSuggestionsState.value == StateStatus.ERROR?
            Container(
                height: 100,
                child: ConnectionErrorWidget(parentAction: retry,)):Container(),
        ]),
      )
      );
  }
  Widget friendSuggestionItem(User user){
    return  Container(
      width: 170,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(5),  // radius of 10
        // green as background color
      ),
      margin: EdgeInsets.only(left: space),
      child: Column(
        children: [
          Container(
            height: 140,
            child: InkWell(
              onTap: (){

              },
              child: Container(
                margin: EdgeInsets.all(8.0),
                decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                        fit: BoxFit.scaleDown,
                        image: new NetworkImage(user.photo)
                    )
                ),
              ),
            ),
          ),
          Container(
              height: 25,
              child: Text(user.name+' '+ user.family)),
          Container(
              height: 25,
              child: Text(user.organizational_chart.title)),
          Container(
            height: 40,
            child: controller.usrId.value == user.id?
            controller.followState.value == StateStatus.ERROR?
            IconButton(icon: Icon(Icons.add), onPressed: (){
              Map<String, dynamic> jsonMap = {
                'user_id': user.id,
                'type': 1,
              };
              String body = json.encode(jsonMap);
              controller.follow(body,user.id,true,follow);
            }):controller.followState.value == StateStatus.LOADING?
            Container(
              width: 40,
                height: 40,
                padding: EdgeInsets.all(8.0),
                child: CircularProgressIndicator(
                  strokeWidth: 1.2,
                  valueColor: new AlwaysStoppedAnimation<Color>(Color(0xffE1AD41)),
                )):
            controller.followState.value == StateStatus.SUCCESS?
            Icon(Icons.check,color: Colors.green,):
            Container():
            IconButton(icon: Icon(Icons.add), onPressed: (){
              Map<String, dynamic> jsonMap = {
                'user_id': user.id,
                'type': 1,
              };
              String body = json.encode(jsonMap);
              controller.follow(body,user.id,true,follow);
            }),
          ),
        ],),
    );
  }
  follow(String id)async{

    for(User user in controller.suggestionUsers)
      if(user.id == id)
        await Future.delayed(const Duration(seconds: 1), (){
          controller.suggestionUsers.remove(user);
          controller.suggestionLength.value = controller.suggestionUsers.length;
        });

  }
}
