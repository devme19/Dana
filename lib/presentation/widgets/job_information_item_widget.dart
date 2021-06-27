import 'package:dana/core/config/config.dart';
import 'package:dana/data/model/cv_model.dart';
import 'package:dana/presentation/model/job_inf_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
class JobInformationItemWidget extends StatelessWidget {
  final Experience experience;
  final ValueChanged<Experience> removeJob;
  final ValueChanged<Experience> editJob;
  JobInformationItemWidget({this.experience,this.removeJob,this.editJob});
  @override
  Widget build(BuildContext context) {
    return
      Container(
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
                removeJob(experience);
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Icon(Icons.delete,color: Colors.redAccent,),
              ),
            ),
            InkWell(
              onTap: (){
                editJob(experience);
              },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Icon(Icons.edit),
                )),
            // Text(title,)
          ],
        ),
        Container(
          padding: EdgeInsets.only(left:16.0,right: 16.0,bottom: 16.0),
          child: Column(children: [
            Row(
              children: [
                Expanded(child: Text(experience.title,)),
              ],
            ),
            SizedBox(height: spaceBetween,),
            Row(
              children: [
                Expanded(child: Text(experience.company_name,)),
              ],
            ),
            SizedBox(height: spaceBetween,),
            Row(
              children: [
                Text(' از'),
                Text(experience.start_date_at),
                Text(' تا '),
                Text((experience.end_date_at =='' || experience.end_date_at == null)?'کنون':experience.end_date_at),

              ],
            )
          ],),
        )
      ],),
    );
  }
}
