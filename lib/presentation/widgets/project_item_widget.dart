import 'package:dana/core/config/config.dart';
import 'package:dana/data/model/cv_model.dart';
import 'package:dana/data/model/project_model.dart';
import 'package:dana/presentation/model/project_item.dart';
import 'package:flutter/material.dart';

class ProjectItemWidget extends StatelessWidget {
  final ProjectModel project;
  final ValueChanged<ProjectModel> removeProject;
  final ValueChanged<ProjectModel> editProject;
  ProjectItemWidget({this.project,this.removeProject,this.editProject});
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
                  removeProject(project);
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Icon(Icons.delete,color: Colors.redAccent,),
                ),
              ),
              InkWell(
                onTap: ()=>editProject(project),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Icon(Icons.edit,),
                  )),
              // Text(title,)
            ],
          ),
          Container(
            padding: EdgeInsets.only(left:16.0,right: 16.0,bottom: 16.0),
            child: Column(children: [
              Row(
                children: [
                  Expanded(child: Text(project.title)),
                ],
              ),
              SizedBox(height: spaceBetween,),
              project.start_date_at !='' ?
              Row(
                children: [
                  Text('از '),
                  Text(project.start_date_at,),
                  Text(' تا '),
                  Text(project.end_date_at =='' ?'کنون':project.end_date_at),
                ],
              ):Container(),
              SizedBox(height: spaceBetween,),
              Row(
                children: [
                  Expanded(child: Text(project.description)),
                ],
              ),
            ],),
          )
        ],),
      );
  }
}