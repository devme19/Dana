import 'package:dana/core/config/config.dart';
import 'package:dana/data/model/knowledge_detail_model.dart';
import 'package:dana/presentation/controller/knowledge_detail_controller.dart';
import 'package:dana/presentation/model/state_status.dart';
import 'package:dana/presentation/widgets/connection_error_widget.dart';
import 'package:dana/presentation/widgets/detail_header_widget.dart';
import 'package:dana/presentation/widgets/status_widget.dart';
import 'package:dana/presentation/widgets/user_comment_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../../helper.dart';
class KnowledgeDetailPage extends GetView<KnowledgeDetailController> {
  String kCode;
  KnowledgeDetailPage(){
    kCode = Get.arguments[0];
    controller.getKnowledgeDetail('?kcode='+kCode);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: Text('جزئیات درس آموخته'),) ,
      body:
      Obx(()=> controller.getKnowledgeDetailState.value == StateStatus.LOADING?
      SpinKitDualRing(color: Colors.orange):
      controller.getKnowledgeDetailState.value == StateStatus.ERROR?
      ConnectionErrorWidget(parentAction: retry,):
      controller.getKnowledgeDetailState.value == StateStatus.SUCCESS?
          Container(
            padding: EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    DetailHeaderWidget(
                      title: controller.knowledgeDetailEntity.data.author.organizational_chart.title,
                      status:  controller.knowledgeDetailEntity.data.status,
                      name: controller.knowledgeDetailEntity.data.author.name,
                      family: controller.knowledgeDetailEntity.data.author.family,
                      dte: controller.knowledgeDetailEntity.data.created_at,
                      photo: controller.knowledgeDetailEntity.data.author.photo,
                    ),
                    Divider(
                    ),
                    Container(
                      child:
                      Row(
                        children: [
                          Expanded(child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(controller.knowledgeDetailEntity.data.title,style: TextStyle(fontWeight: FontWeight.bold),),
                          )),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                          color: Color(0xffF3F4F7),
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      child:
                      Column(
                        children: [
                          Row(
                            children: [
                              Text('درخت دانش',style: TextStyle(color: Colors.grey),),
                            ],
                          ),
                          SizedBox(height: 15,),
                          Row(
                            
                            children: knowledgeTree(controller.knowledgeDetailEntity.data.knowledge_tree),)

                        ],
                      ),
                    ),
                    Divider(),
                    Container(
                      // height: 200,
                      child:Image.network(controller.knowledgeDetailEntity.data.poster),
                    ),
                    Divider(),
                    Column(
                      children: [

                            Row(
                              children: [
                                IconButton(icon: controller.isLike.value?Image.asset('asset/image/like1.png'):Image.asset('asset/image/like2.png'), onPressed: (){
                                  controller.like(controller.knowledgeDetailEntity.data.kcode);
                                }),
                              ],
                            ),

                        AnimatedContainer(
                          height: controller.userLiked.length>0?95:0,
                          duration: Duration(milliseconds: 300),
                          margin: EdgeInsets.only(top: 8.0),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.userLiked.length,
                            itemBuilder: (context,index){
                              return  Container(
                                margin: EdgeInsets.only(left:16.0),
                                child: Column(
                                  children: [
                                    Expanded(
                                      flex:2,
                                      child: Container(
                                          width:65,
                                          height: 65,
                                          decoration: new BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: new DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: new NetworkImage(controller.userLiked[index].photo)
                                              )
                                          )),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(top:8.0),
                                        child: Text(controller.userLiked[index].name+' '+controller.userLiked[index].family),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    Divider(),
                    Container(
                      child: DefaultTabController(
                        length: 2,
                        initialIndex: 0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Container(
                              child: TabBar(
                                tabs: [
                                  Tab(text: 'دیدگاه کاربران',),
                                  Tab(text: 'به کارگیری دانش',),
                                ],
                                indicatorColor: Colors.amber,
                              ),
                            ),
                            Container(
                              height: 300,
                              child: TabBarView(
                                children: [
                                  commentWidget(),
                                  Icon(Icons.directions_transit),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
          ):Container(),)
    );
  }
  retry(bool retry){
    controller.getKnowledgeDetail('?kcode='+kCode);
  }
  List<Widget> knowledgeTree(List<KnowledgeTree> tree){
    List<Widget> row = [];
    for(int i =0; i<tree.length;i++) {
      row.add(Expanded(
        flex: 5,
          child: Text(tree[i].title)));
      if(i<tree.length-1)
        row.add(Expanded(child: Text('/')));

    }
    return row;
  }
  Widget commentWidget(){
    TextEditingController commentTxtController = TextEditingController();
    return Container(
      margin: EdgeInsets.all(16.0),
      child: Column(children: [
        TextFormField(
          maxLines: 5,
          controller: commentTxtController,
          onEditingComplete: () => Get.back(),
          decoration: InputDecoration(
              labelText: 'دیدگاه خود را بنویسید ...',
              filled: true,
              fillColor: Colors.white,
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                      Radius.circular(borderRadius)),
                  borderSide: BorderSide(color: Colors.grey)

              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                      Radius.circular(borderRadius)),
                  borderSide: BorderSide(
                      color: Colors.grey.shade800)
              )
          ),
        ),
        SizedBox(height: 25,),
        ElevatedButton(
            style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                  // side: BorderSide(color: Colors.grey.shade200)
                ),),
                backgroundColor: MaterialStateProperty.all(Color(0xffE1AD41)),
                padding: MaterialStateProperty.all(EdgeInsets.only(left:64,right: 64,top: 8.0,bottom: 8.0)),
                textStyle: MaterialStateProperty.all(TextStyle(fontSize: 18))
            ),
            onPressed:
                () {
            },
            child:
            Text('ثبت دیدگاه'.tr,style: TextStyle(color: Colors.white),)
        )
      ],),
    );
  }
}
