import 'dart:math';

import 'package:dana/core/config/config.dart';
import 'package:dana/presentation/widgets/progress_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
class CompleteProfileWidget extends StatelessWidget {
  final int aboutMe;
  final int courses;
  final int experiences;
  final int image;
  final int skills;
  double percent;
  int sum;
  CompleteProfileWidget({
    this.aboutMe,
    this.courses,
    this.experiences,
    this.image,
    this.skills
}){
    sum = aboutMe+courses+experiences+image+skills;
   percent = sum/5;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Row(
            // mainAxisAlignment: MainAxisAlignment.end,
            children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('تکمیل پروفایل',style: TextStyle(fontWeight: FontWeight.bold),),
            )
          ],),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Divider(color: Colors.grey,),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                    flex:2,
                    child:
                    Column(
                      children: [
                        rowItem('درباره من', aboutMe),
                        rowItem('تصویر', image),
                        rowItem('مهارت ها', skills),
                        rowItem('دوره های آموزشی', courses),
                        rowItem('اطلاعات شغلی', experiences),
                      ],
                    )
                ),
                Expanded(
                    child:
                    Column(children: [
                      Icon(Icons.add_location_alt_sharp),
                      Text((percent*100).toInt().toString()+"%")
                    ],)
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: buildProgress(),),
          )
        ],
      ),
    );
  }
  List<Widget> buildProgress(){
    List<Widget> progress=[];
    switch(sum){
      case 0:
        progress.add(Expanded(child: ProgressWidget(startColor: Colors.grey,endColor: Colors.grey,)),);
        progress.add(SizedBox(width: 10,),);
        progress.add(Expanded(child: ProgressWidget(startColor: Colors.grey,endColor: Colors.grey,)),);
        progress.add(SizedBox(width: 10,),);
        progress.add(Expanded(child: ProgressWidget(startColor: Colors.grey,endColor: Colors.grey,)),);
        progress.add(SizedBox(width: 10,),);
        progress.add(Expanded(child: ProgressWidget(startColor: Colors.grey,endColor: Colors.grey,)),);
        progress.add(SizedBox(width: 10,),);
        progress.add(Expanded(child: ProgressWidget(startColor: Colors.grey,endColor: Colors.grey,)),);
        return progress;
      case 1:
        progress.add(Expanded(child: ProgressWidget(startColor: Colors.red,endColor: Colors.red,)),);
        progress.add(SizedBox(width: 10,),);
        progress.add(Expanded(child: ProgressWidget(startColor: Colors.grey,endColor: Colors.grey,)),);
        progress.add(SizedBox(width: 10,),);
        progress.add(Expanded(child: ProgressWidget(startColor: Colors.grey,endColor: Colors.grey,)),);
        progress.add(SizedBox(width: 10,),);
        progress.add(Expanded(child: ProgressWidget(startColor: Colors.grey,endColor: Colors.grey,)),);
        progress.add(SizedBox(width: 10,),);
        progress.add(Expanded(child: ProgressWidget(startColor: Colors.grey,endColor: Colors.grey,)),);
        return progress;
      case 2:
        progress.add(Expanded(child: ProgressWidget(startColor: Colors.red,endColor: Colors.red,)),);
        progress.add(SizedBox(width: 10,),);
        progress.add(Expanded(child: ProgressWidget(startColor: Colors.red,endColor: Colors.deepOrange,)),);
        progress.add(SizedBox(width: 10,),);
        progress.add(Expanded(child: ProgressWidget(startColor: Colors.grey,endColor: Colors.grey,)),);
        progress.add(SizedBox(width: 10,),);
        progress.add(Expanded(child: ProgressWidget(startColor: Colors.grey,endColor: Colors.grey,)),);
        progress.add(SizedBox(width: 10,),);
        progress.add(Expanded(child: ProgressWidget(startColor: Colors.grey,endColor: Colors.grey,)),);
        return progress;
      case 3:
        progress.add(Expanded(child: ProgressWidget(startColor: Colors.red,endColor: Colors.red,)),);
        progress.add(SizedBox(width: 10,),);
        progress.add(Expanded(child: ProgressWidget(startColor: Colors.red,endColor: Colors.deepOrange,)),);
        progress.add(SizedBox(width: 10,),);
        progress.add(Expanded(child: ProgressWidget(startColor: Colors.deepOrange,endColor: Colors.orange,)),);
        progress.add(SizedBox(width: 10,),);
        progress.add(Expanded(child: ProgressWidget(startColor: Colors.grey,endColor: Colors.grey,)),);
        progress.add(SizedBox(width: 10,),);
        progress.add(Expanded(child: ProgressWidget(startColor: Colors.grey,endColor: Colors.grey,)),);
        return progress;
      case 4:
        progress.add(Expanded(child: ProgressWidget(startColor: Colors.red,endColor: Colors.red,)),);
        progress.add(SizedBox(width: 10,),);
        progress.add(Expanded(child: ProgressWidget(startColor: Colors.red,endColor: Colors.deepOrange,)),);
        progress.add(SizedBox(width: 10,),);
        progress.add(Expanded(child: ProgressWidget(startColor: Colors.deepOrange,endColor: Colors.orange,)),);
        progress.add(SizedBox(width: 10,),);
        progress.add(Expanded(child: ProgressWidget(startColor: Colors.orange,endColor: Colors.green,)),);
        progress.add(SizedBox(width: 10,),);
        progress.add(Expanded(child: ProgressWidget(startColor: Colors.grey,endColor: Colors.grey,)),);
        return progress;
      case 5:
        progress.add(Expanded(child: ProgressWidget(startColor: Colors.red,endColor: Colors.red,)),);
        progress.add(SizedBox(width: 10,),);
        progress.add(Expanded(child: ProgressWidget(startColor: Colors.red,endColor: Colors.deepOrange,)),);
        progress.add(SizedBox(width: 10,),);
        progress.add(Expanded(child: ProgressWidget(startColor: Colors.deepOrange,endColor: Colors.orange,)),);
        progress.add(SizedBox(width: 10,),);
        progress.add(Expanded(child: ProgressWidget(startColor: Colors.orange,endColor: Colors.green,)),);
        progress.add(SizedBox(width: 10,),);
        progress.add(Expanded(child: ProgressWidget(startColor: Colors.green,endColor: Colors.green,)),);
        return progress;

    }
  }
  Widget rowItem(String title,int isCheck){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Icon(isCheck == 1?Icons.check_circle_outline:Icons.close,color: isCheck == 1?Colors.green:Colors.red,),
          SizedBox(width: spaceBetween,),
          Text(title,textAlign: TextAlign.end),

        ],
      ),
    );
  }

}
