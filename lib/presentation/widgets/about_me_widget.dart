import 'package:dana/core/config/config.dart';
import 'package:dana/presentation/controller/cv_controller.dart';
import 'package:dana/presentation/controller/home_controller.dart';
import 'package:dana/presentation/widgets/title_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class AboutMeWidget extends StatelessWidget{
  final String aboutMe;
  final bool isUser;
  ValueChanged<String> parentAction;
  AboutMeWidget({this.aboutMe,this.parentAction,this.isUser});
  TextEditingController aboutMeTxtController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(children: [

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Padding(
              padding: const EdgeInsets.only(left: 16,right: 16),
              child: Text('درباره من',style: TextStyle(fontWeight: FontWeight.bold),),
            ),
            isUser?Padding(padding: EdgeInsets.only(top: 32,bottom: 32)):InkWell(
              onTap: (){
                aboutMeTxtController.text = aboutMe;
                Get.bottomSheet(Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(borderRadius)
                  ),

                  child: SingleChildScrollView(
                    child: Column(children: [
                      TitleBarWidget(title: 'درباره من',),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            TextFormField(
                              maxLines: 10,
                              controller: aboutMeTxtController,
                              onEditingComplete: () => Get.back(),
                              decoration: InputDecoration(
                                  filled: true,
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ElevatedButton(onPressed: (){
                                    parentAction(aboutMeTxtController.text);
                                    // controller.setAboutMe(aboutMeTxtController.text);
                                    Get.back();
                                  }, child: Text('تایید'),style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all<Color>(Colors.blueAccent),
                                  ),),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
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
                ));
              },
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Icon(Icons.edit,color: Colors.amber,),
              ),
            ),
          ],
        ),
        aboutMe!=''&&aboutMe!=null?
        Column(
          children: [
            Divider(color: Colors.grey,),
            Padding(
              padding: const EdgeInsets.only(left:16.0,right: 16.0,bottom: 16.0,top: 8.0),
              child: Row(
                children: [
                  Expanded(child: Text(aboutMe,style: TextStyle(height: 2),)),
                ],
              ),
            ),
          ],
        ):Container()
      ],),
    );
  }
}
