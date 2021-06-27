import 'package:dana/data/model/author_model.dart';
import 'package:dana/data/model/free_knowledge_model.dart';
import 'package:dana/domain/entity/like_entity.dart';
import 'package:dana/presentation/controller/explicit_knowledge_controller.dart';
import 'package:dana/presentation/helper.dart';
import 'package:dana/presentation/navigation/dana.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FreeKnowledgeItemWidget extends StatefulWidget {
  Item item;
  FreeKnowledgeItemWidget({this.item});
  @override
  _FreeKnowledgeItemWidgetState createState() => _FreeKnowledgeItemWidgetState();
}

class _FreeKnowledgeItemWidgetState extends State<FreeKnowledgeItemWidget> {
  bool isExpanded=false;
  List<AuthorModel> likes=[];
  @override
  void initState() {
    super.initState();
    likes.addAll(widget.item.likes);
  }
  @override
  Widget build(BuildContext context) {
    return Card(
      child:
      AnimatedContainer(
        height: isExpanded?500:350,
        duration: Duration(milliseconds: 200),
        padding: EdgeInsets.all(8.0),
        child: Column(children: [
          Expanded(
            flex: 2,
            child:
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child:
                  Container(
                      decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                              fit: BoxFit.scaleDown,
                              image: new NetworkImage(widget.item.author.photo)
                          )
                      )),
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: ClipRRect(
                  //       borderRadius: BorderRadius.circular(8.0),
                  //       child: Image.asset('asset/image/me.jpg')
                  //   ),
                  // ),
                ),
                SizedBox(width: 15,),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Text(widget.item.author.name +' '+widget.item.author.family,style: TextStyle(fontWeight: FontWeight.bold),),
                        ],
                      ),
                      SizedBox(height: 16,),
                      Row(
                        children: [
                          Text(widget.item.author.organizational_chart.title),
                        ],
                      ),

                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                          width: 100,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.blue.withOpacity(0.1),
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          child: Center(child: Text(widget.item.category.title,style: TextStyle(color: Colors.blue),))),
                      SizedBox(width: 15,),
                      Text(date(widget.item.created_at)),
                    ],
                  ),
                )
              ],
            ),
          ),
          Divider(),
          Expanded(child:
          Row(
            children: [
              Expanded(
                flex: 2,
                child: InkWell(
                  child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.1),
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      child: Center(child: Text(widget.item.title,style: TextStyle(color: Colors.blue),))),
                  onTap: (){
                    Get.toNamed(DanaRoutes.freeKnowledgeDetailPage,arguments: widget.item.id);
                  },
                ),
              ),
            ],
          ),
          ),
          Expanded(
              flex: 4,
              child: Row(children: [
                Expanded(child:
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(widget.item.description,maxLines: 4,overflow: TextOverflow.ellipsis,style: TextStyle(height: 1.5),),
                ))
              ],)),
          Divider(),
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    likes.length!=0?
                    ExpandIcon(
                      isExpanded: isExpanded,
                      // color: Colors.red,
                      // expandedColor: Colors.grey,
                      onPressed: (bool isExpand)=>setState(() {
                        isExpanded = !isExpand;
                      }),
                    ):Container(),
                    SizedBox(width: 20,),
                    Stack(children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IconButton(icon: Image.asset('asset/image/like2.png'), onPressed: (){
                        }),
                      ),
                      Container(
                          width: 27,
                          height: 27,
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.3),
                            shape: BoxShape.circle,
                          ),
                          child: Center(child: Text(widget.item.likes_count.toString(),style: TextStyle(color: Colors.black),))),
                    ], ),
                  ],
                ),
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
                      child: Center(child: Text(widget.item.reviews_count,style: TextStyle(color: Colors.black),))),
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
                      child: Center(child: Text(widget.item.visits,style: TextStyle(color: Colors.black),))),
                ], ),
              ],
            ),
          ),
          AnimatedContainer(
            height: isExpanded?120:0,
            duration: Duration(milliseconds: 200),
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    height: 95,
                    margin: EdgeInsets.only(top: 8.0),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: likes.length,
                      itemBuilder: (context,index){
                        return  InkWell(
                          onTap: (){
                            // Get.toNamed(DanaRoutes.cvUserPage,arguments: [widget.knowledge.teams[index].personal_code]);
                          },
                          child: Container(
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
                                              image: new NetworkImage(likes[index].photo,)
                                          )
                                      )),
                                ),
                                
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top:8.0),
                                    child: Text(likes[index].name+' '+likes[index].family),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ],),
      ),
    );
  }
}