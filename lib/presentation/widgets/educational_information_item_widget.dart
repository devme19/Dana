import 'package:dana/core/config/config.dart';
import 'package:dana/data/model/cv_model.dart';
import 'package:dana/presentation/model/edu_inf_item.dart';
import 'package:flutter/material.dart';
class EducationalInformationItemWidget extends StatelessWidget {
  final Education item;
  final ValueChanged<Education> removeEdu;
  final ValueChanged<Education> editEdu;
  EducationalInformationItemWidget({this.item,this.removeEdu,this.editEdu});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),  // radius of 10
          border: Border.all( color: Colors.grey.shade300)
      ),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: (){
                removeEdu(item);
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Icon(Icons.delete,color: Colors.redAccent,),
              ),
            ),
            InkWell(
              onTap:()=> editEdu(item),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Icon(Icons.edit,color: Colors.amber,),
                )),
            // Text(title,)
          ],
        ),
        Container(
          padding: EdgeInsets.only(left:16.0,right: 16.0,bottom: 16.0),
          child: Column(children: [
            Row(
              children: [
                Expanded(child: Text(item.field_of_study+' '+item.grade.title)),
              ],
            ),
            SizedBox(height: spaceBetween,),
            Row(
              children: [
                Expanded(child: Text(item.school)),
              ],
            ),
            SizedBox(height: spaceBetween,),
            item.start_date_at !='' ?
            Row(
              children: [
                Text(item.end_date_at =='' ?'کنون':item.end_date_at),
                Text(' تا '),
                Text(item.start_date_at,),
                Text(' از'),
              ],
            ):Container()
          ],),
        )
      ],),
    );
  }
}
