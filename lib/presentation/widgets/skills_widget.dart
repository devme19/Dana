import 'package:dana/core/config/config.dart';
import 'package:dana/data/model/cv_model.dart';
import 'package:dana/presentation/controller/home_controller.dart';
import 'package:dana/presentation/model/skill_item.dart';
import 'package:dana/presentation/widgets/skill_item_widget.dart';
import 'package:dana/presentation/widgets/title_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class SkillsWidget extends StatelessWidget {
  TextEditingController titleTxtController = TextEditingController();
  final ValueChanged<Skill> removeSkill;
  List<Skill> skills=[];
  final bool isUser;
  SkillsWidget({this.skills,this.removeSkill,this.isUser});
  bottomSheet(Skill skill) async {
    if (skill != null) {
      if (skill.title != null)
        titleTxtController.text = skill.title;
      }
    else
    {
      titleTxtController.clear();
    }
    await showModalBottomSheet(
      isScrollControlled: true, // required for min/max child size
      context: Get.context,
      builder: (ctx) {
        return Form(
            child:
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(borderRadius)
              ),

              child: SingleChildScrollView(
                child: Column(children: [
                  TitleBarWidget(title: 'مهارت ها',),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: TextFormField(
                            controller: titleTxtController,
                            decoration: InputDecoration(
                                filled: true,
                                labelText: 'عنوان',
                                fillColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
                                    borderSide: BorderSide(color: Colors.grey)

                                ),
                                border:OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
                                    borderSide: BorderSide(color: Colors.grey.shade800)
                                )
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top:8.0,right: 8.0),
                              child: ElevatedButton(onPressed: (){
                                SkillItem item = SkillItem(
                                  title: titleTxtController.text,
                                );
                                Get.back();
                              }, child: Text('تایید'),style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(Colors.blueAccent),
                              ),),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top:8.0),
                              child: ElevatedButton(onPressed: (){
                                Get.back();
                              }, child: Text('لغو'),style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
                              ),),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],),
              ),
            )
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child:
      Column(children: [
        Padding(
          padding: const EdgeInsets.only(left: 16,right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Text('مهارت ها',style: TextStyle(fontWeight: FontWeight.bold),),
              isUser?Padding(padding: EdgeInsets.only(top: 32,bottom: 32)):InkWell(
                onTap: (){
                  bottomSheet(null);
                },
                child: Padding(
                  padding: const EdgeInsets.only(top:16.0,bottom: 16),
                  child: Row(children: [
                    Text('افزودن',style: TextStyle(color: Colors.green),),
                    Icon(Icons.add,color: Colors.green,)
                  ],),
                ),
              ),
            ],
          ),
        ),
        skills.length != 0?Column(
          children: [
            Divider(color: Colors.grey,),
            Padding(
                padding: const EdgeInsets.only(left:24.0,right: 24.0,bottom: 8.0,top: 8.0),
                child:  Column(children:
                createSkillsView(skills)
                )
            ),
          ],
        ):Container()
      ],),
    );
  }
  List<Widget> createSkillsView(List<Skill> skills){
    List<Widget> list = [];
    for(Skill item in skills)
      list.add(SkillItemWidget(skill: item,removeSkill: removeSkillItem,));
    return list;

  }
  removeSkillItem(Skill item){
    removeSkill(item);
  }
}
