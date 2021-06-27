import 'package:dana/data/model/knowledge_detail_model.dart';
import 'package:dana/data/model/knowledge_tree_model.dart';
import 'package:dana/presentation/controller/free_knowledge_detail_controller.dart';
import 'package:dana/presentation/model/state_status.dart';
import 'package:dana/presentation/widgets/connection_error_widget.dart';
import 'package:dana/presentation/widgets/detail_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
class FreeKnowledgeDetailPage extends GetView<FreeKnowledgeDetailController> {

  String id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('جزئیات دانش آشکار'),
      ),
      body: Obx(()=> controller.getFreeKnowledgeDetailStatus.value == StateStatus.LOADING?
      SpinKitDualRing(color: Colors.orange):
      controller.getFreeKnowledgeDetailStatus.value == StateStatus.ERROR?
      ConnectionErrorWidget(parentAction: retry,)
          :Container(
        child: SingleChildScrollView(
          child: Column(children: [

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DetailHeaderWidget(
                photo: controller.freeKnowledgeDetailEntity.value.data.author.photo,
                dte: controller.freeKnowledgeDetailEntity.value.data.created_at,
                name: controller.freeKnowledgeDetailEntity.value.data.author.name,
                family: controller.freeKnowledgeDetailEntity.value.data.author.family,
                status: null,
                title: controller.freeKnowledgeDetailEntity.value.data.author.organizational_chart.title,
              ),
            ),
            Divider(),

            Row(
              children: [

                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(controller.freeKnowledgeDetailEntity.value.data.title,style: TextStyle(fontWeight: FontWeight.bold),),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              margin: EdgeInsets.all(16.0),
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
                    children: knowledgeTree(controller.freeKnowledgeDetailEntity.value.data.knowledgeTree),)
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(controller.freeKnowledgeDetailEntity.value.data.description,style: TextStyle(height: 1.8),),
                  ),
                ),
              ],
            ),

          ],),
        ),
      )),
    );
  }
  List<Widget> knowledgeTree(List<KnowledgeTreeModel> tree){
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
  FreeKnowledgeDetailPage(){
    id = Get.arguments;
   controller.getFreeKnowledgeDetail(id);
  }
  retry(bool value){
    controller.getFreeKnowledgeDetail(id);
  }
}
