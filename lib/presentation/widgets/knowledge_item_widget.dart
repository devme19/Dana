import 'package:dana/data/model/knowledge_model.dart';
import 'package:dana/data/model/like_model.dart';
import 'package:dana/presentation/controller/knowledge_controller.dart';
import 'package:dana/presentation/controller/knowledge_detail_controller.dart';
import 'package:dana/presentation/navigation/dana.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../helper.dart';
class KnowledgeItemWidget extends StatefulWidget {

  Knowledge knowledge;
  String type;
  Color typeColor;
  bool isLike;
  int likeCount;
  ValueChanged<LikeModel> postLike;
  KnowledgeItemWidget({this.knowledge,this.postLike}){
    knowledgeType(knowledge.type);
    if(knowledge.userliked == 0)
      isLike = false;
    else
    if(knowledge.userliked == 1)
      isLike = true;
    likeCount = int.parse(knowledge.likesCount);
  }
  knowledgeType(String t){
    if(t == 'VOICE') {
      type = 'صدا';
      typeColor = Colors.purple;
    } else
    if(t == 'TEXT') {
      type = 'متن';
      typeColor = Colors.blue;
    } else
    if(t == 'VIDEO') {
      type = 'ویدئو';
      typeColor = Colors.green;
    }
  }
  @override
  _KnowledgeItemWidgetState createState() => _KnowledgeItemWidgetState();
}

class _KnowledgeItemWidgetState extends State<KnowledgeItemWidget> {
  KnowledgeDetailController knowledgeDetailController = Get.put(KnowledgeDetailController());
  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: ()=>Get.toNamed(DanaRoutes.knowledgeDetailPage,arguments: [widget.knowledge.kcode]).then((value) {
          setState(() {
            widget.isLike = knowledgeDetailController.isLike.value;
            widget.likeCount = knowledgeDetailController.userLiked.length;
          });
        } ),
        child: Container(
          height: widget.knowledge.teams.length==0?350:470,
          padding: EdgeInsets.all(8.0),
          child: Column(children: [
            Container(
              height: 80,
              child: Row(
                children: [
                  Container(
                      width: 80,
                      height: 80,
                      decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                              fit: BoxFit.cover,
                              image: new NetworkImage(
                                  widget.knowledge.author.photo)
                          )
                      )),
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(widget.knowledge.author.name +' '+ widget.knowledge.author.family,style: TextStyle(fontWeight: FontWeight.bold),),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(widget.knowledge.author.organizational_chart.title),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(date(widget.knowledge.createdAt)),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(
            ),
            Container(
              height: 50,
              padding: EdgeInsets.only(right: 16.0),
              child: Row(
                children: [
                  Expanded(child: Text(widget.knowledge.title,style: TextStyle(fontWeight: FontWeight.bold),)),
                ],
              ),
            ),
            Container(
              height: 100,
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(children: [
                      Expanded(child: Text('نمره درس آموخته')),
                      Expanded(
                        flex: 3,
                        child: CircularPercentIndicator(
                          radius: 60.0,
                          lineWidth: 5.0,
                          percent: double.parse(widget.knowledge.evaluation==null?'0':widget.knowledge.evaluation)/5,
                          center: new Text(widget.knowledge.evaluation==null?'0':widget.knowledge.evaluation),
                          progressColor: Colors.green,
                        ),
                      )
                    ],),
                  ),
                  Column(
                    children: [
                      Expanded(
                        child: Container(
                          width: 1,
                          color: Colors.grey.shade200,
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Column(children: [
                      Expanded(flex:1,child: Text('نوع درس آموخته')),
                      Expanded(
                        child: Container(
                            width: 100,
                            height: 20,
                            decoration: BoxDecoration(
                                color: widget.typeColor.withOpacity(0.1),
                                borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                            child: Center(child: Text(widget.type,style: TextStyle(color: widget.typeColor),))),
                      )
                    ],),
                  )
                ],
              ),
            ),
            widget.knowledge.teams.length!=0?
            Container(
              height: 120,
              child: Column(
                children: [
                  Text('همکاران'),

                  Container(
                    height: 95,
                    margin: EdgeInsets.only(top: 8.0),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.knowledge.teams.length,
                      itemBuilder: (context,index){
                        return  InkWell(
                          onTap: (){
                            Get.toNamed(DanaRoutes.cvUserPage,arguments: [widget.knowledge.teams[index].personal_code]);
                          },
                          child: Container(
                            margin: EdgeInsets.only(left:16.0),
                            child: Column(
                              children: [
                                Container(
                                    width:65,
                                    height: 65,
                                    decoration: new BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: new DecorationImage(
                                            fit: BoxFit.cover,
                                            image: new NetworkImage(widget.knowledge.teams[index].photo,)
                                        )
                                    )),
                                Padding(
                                  padding: const EdgeInsets.only(top:8.0),
                                  child: Text(widget.knowledge.teams[index].name+' '+widget.knowledge.teams[index].family),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ):Container(),
            Divider(),
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Stack(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(icon: widget.isLike?Image.asset('asset/image/like1.png'):Image.asset('asset/image/like2.png'), onPressed: (){
                       setState(() {
                         widget.isLike = !widget.isLike;
                         widget.postLike(LikeModel(kcode: widget.knowledge.kcode,type: widget.isLike?1:0));
                         if(widget.isLike)
                           widget.likeCount++;
                         else
                           widget.likeCount--;
                       });
                      }),
                    ),
                    Container(
                        width: 27,
                        height: 27,
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.3),
                          shape: BoxShape.circle,
                        ),
                        child: Center(child: Text(widget.likeCount.toString(),style: TextStyle(color: Colors.black),))),
                  ], ),
                  Stack(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(icon: Image.asset('asset/image/chat.png'), onPressed: (){}),
                    ),
                    Container(
                        width: 27,
                        height: 27,
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.3),
                          shape: BoxShape.circle,
                        ),
                        child: Center(child: Text(widget.knowledge.reviewsCount,style: TextStyle(color: Colors.black),))),
                  ], ),
                  Stack(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(icon: Image.asset('asset/image/light-bulb.png'), onPressed: (){}),
                    ),
                    Container(
                        width: 27,
                        height: 27,
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.3),
                          shape: BoxShape.circle,
                        ),
                        child: Center(child: Text(widget.knowledge.experiencesCount,style: TextStyle(color: Colors.black),))),
                  ], ),
                  Stack(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(icon: Image.asset('asset/image/visibility.png'), onPressed: (){}),
                    ),
                    Container(
                        width: 27,
                        height: 27,
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.3),
                          shape: BoxShape.circle,
                        ),
                        child: Center(child: Text(widget.knowledge.visits.toString(),style: TextStyle(color: Colors.black),))),
                  ], ),
                ],
              ),
            )
          ],),
        ),
      ),
    );
  }


}

