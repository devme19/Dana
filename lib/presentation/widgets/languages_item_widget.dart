import 'package:dana/core/config/config.dart';
import 'package:dana/data/model/cv_model.dart';
import 'package:dana/presentation/model/language_item.dart';
import 'package:flutter/material.dart';

class LanguagesItemWidget extends StatelessWidget {
  final Language item;
  final ValueChanged<Language> removeLanguage;
  LanguagesItemWidget({this.item,this.removeLanguage});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),  // radius of 10
          border: Border.all( color: Colors.grey.shade300)
      ),
      child: Column(
        children: [
          Row(
            children: [
              InkWell(
                onTap: (){
                  removeLanguage(item);
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Icon(Icons.delete,color: Colors.redAccent,),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(left:16.0,right: 16.0,bottom: 16.0),
            child: Row(
              children: [
                Expanded(child: Text(item.title))
              ],
            ),
          ),
        ],
      ),
    );
  }
}