import 'dart:convert';

import 'package:dana/presentation/controller/cv_controller.dart';
import 'package:dana/presentation/controller/friend_suggestion_controller.dart';
import 'package:dana/presentation/model/avatar_item.dart';
import 'package:dana/presentation/model/state_status.dart';
import 'package:dana/presentation/navigation/dana.dart';
import 'package:dana/presentation/widgets/connection_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class FollowersUsersWidget extends GetView<CvController> {
  ScrollController _scrollController = ScrollController();
  FriendSuggestionController friendSuggestionController = Get.put(FriendSuggestionController());
  int pageIndex=1;
  String parameters='';
  ValueChanged<String> parentAction;
  ValueChanged<String> homeAction;
  _scrollListener() {
    print('scroll offset:'+_scrollController.offset.toString());
    print('maxScrollExtent:'+_scrollController.position.maxScrollExtent.toString());
    if (_scrollController.offset >= _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      if(controller.followers.length !=0)
        pageIndex = int.parse(controller.followersEntity.data.page)+1;
      controller.getFollowers('?page='+pageIndex.toString());
    }
  }
  FollowersUsersWidget({this.parameters,this.parentAction,this.homeAction}){
    controller.followers.clear();
    controller.getFollowers('?page=1$parameters');
    _scrollController.addListener(_scrollListener);
    buildList(Get.context);
    // _showMultiSelect(Get.context);
  }
  void buildList(BuildContext context) async {
    await showModalBottomSheet(
      isScrollControlled: true, // required for min/max child size
      context: context,
      builder: (ctx) {
        return Obx(()=>
            ConstrainedBox(
                constraints: new BoxConstraints(
                  maxHeight: 0.75*Get.height,
                ),
                child:
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    controller.followers.length!=0?
                    Expanded(
                      child: ListView.separated(

                          controller: _scrollController,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context,int index){
                            return
                              InkWell(
                                onTap: (){
                                  Get.back();
                                  if(parentAction == null)
                                    Get.toNamed(DanaRoutes.cvUserPage,arguments: [controller.followers[index].personal_code],preventDuplicates:false).then((value) {
                                      homeAction('');
                                    });
                                  else
                                    parentAction('?personal_code=${controller.followers[index].personal_code}');
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child:
                                  Row(children: [
                                    Expanded(
                                      flex: 2,
                                      child: Row(
                                        children: [
                                          Container(
                                              width: 80,
                                              height: 80,
                                              decoration: new BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  image: new DecorationImage(
                                                      fit: BoxFit.fill,
                                                      image: new NetworkImage(controller.followers[index].photo)
                                                  )
                                              )),
                                          SizedBox(width: 15,),
                                          Text(controller. followers[index].name
                                              + " " + controller. followers[index].family
                                          ),
                                        ],
                                      ),
                                    ),
                                    InkWell(
                                      child: Container(
                                        padding: EdgeInsets.only(top:8.0,bottom: 8.0,right: 16.0,left: 16.0),
                                        decoration: new BoxDecoration(
                                          //new Color.fromRGBO(255, 0, 0, 0.0),
                                            border: Border.all(color: Colors.amber),
                                            borderRadius: new BorderRadius.all(
                                                const  Radius.circular(5.0))
                                        ),
                                        child: Text(controller.followers[index].is_follow==1?'آنفالو':'فالو',style: TextStyle(color: Color(0xffE1AD41)),),
                                      ),
                                      onTap: (){
                                        Map<String, dynamic> jsonMap = {
                                          'user_id':  controller.followers[index].id,
                                          'type': controller.followers[index].is_follow==1?0:1,
                                        };
                                        String body = json.encode(jsonMap);
                                        friendSuggestionController.follow(body, controller.followers[index].id,false,null);
                                      },
                                    )
                                  ],),
                                ),
                              );
                          },
                          separatorBuilder:  (BuildContext context, int index) => Divider(),
                          itemCount: controller.followers.length),
                    ):Container(),
                    controller.getFollowersState.value == StateStatus.LOADING?
                    Container(height: 10,child: LinearProgressIndicator(
                      backgroundColor: Colors.transparent,
                      valueColor: new AlwaysStoppedAnimation<Color>(Color(0xffE1AD41)),
                    )):
                    controller.getFollowersState.value == StateStatus.ERROR?
                    Container(
                        height: 100,
                        child: ConnectionErrorWidget(parentAction: retry,)):Container()
                  ],
                )
            )
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return
      Container(height: 10,);
  }
  retry(bool value){
    controller.getFollowers('?page='+pageIndex.toString()+parameters);
  }
}
