import 'package:dana/core/config/config.dart';
import 'package:dana/data/model/cv_model.dart';
import 'package:dana/presentation/controller/home_controller.dart';
import 'package:dana/presentation/model/language_item.dart';
import 'package:dana/presentation/widgets/languages_item_widget.dart';
import 'package:dana/presentation/widgets/title_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageWidget extends StatelessWidget {
  TextEditingController titleTxtController = TextEditingController();
  final ValueChanged<Language> removeLanguage;
  List<Language> languages=[];
  final bool isUser;
  LanguageWidget({this.languages,this.removeLanguage,this.isUser});
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
              Text('زبان های خارجه',style: TextStyle(fontWeight: FontWeight.bold),),
              isUser?Padding(padding: EdgeInsets.only(top: 32,bottom: 32)):InkWell(
                onTap: (){
                  Get.bottomSheet(
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(borderRadius)
                        ),

                        child: SingleChildScrollView(
                          child: Column(children: [
                            TitleBarWidget(title: 'زبان های خارجه',),
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
                                          Language item = Language(
                                            title: titleTxtController.text,
                                          );
                                          // controller.addLanguage(item);
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
                      ));
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

        languages.length != 0?Column(
          children: [
            Divider(color: Colors.grey,),
            Padding(
                padding: const EdgeInsets.only(left:24.0,right: 24.0,bottom: 8.0,top: 8.0),
                child:  Column(children:
                createLanguagesView(languages)
                )
            ),
          ],
        ):Container()
      ],),
    );
  }
  List<Widget> createLanguagesView(List<Language> languages){
    List<Widget> list = [];
    for(Language item in languages)
      list.add(LanguagesItemWidget(item: item,removeLanguage: removeLanguageItem,));
    return list;

  }
  removeLanguageItem(Language item){
    removeLanguage(item);
  }
}