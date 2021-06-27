import 'package:dana/core/config/config.dart';
import 'package:dana/data/model/cv_model.dart';
import 'package:dana/presentation/model/edu_courses_item.dart';
import 'package:dana/presentation/model/edu_inf_item.dart';
import 'package:flutter/material.dart';
class EducationCoursesItemWidget extends StatelessWidget {
  final Course course;
  final ValueChanged<Course> removeCourse;
  final ValueChanged<Course> editCourse;
  EducationCoursesItemWidget({this.course,this.removeCourse,this.editCourse});
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
              onTap: ()=>removeCourse(course),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Icon(Icons.delete,color: Colors.redAccent,),
              ),
            ),
            InkWell(
              onTap: ()=>editCourse(course),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Icon(Icons.edit),
              ),
            ),
            // Text(title,)
          ],
        ),
        Container(
          padding: EdgeInsets.only(left:16.0,right: 16.0,bottom: 16.0),
          child: Column(children: [
            Row(
              children: [
                Expanded(child: Text(course.title)),
              ],
            ),
            SizedBox(height: spaceBetween,),
            course.start_date_at !='' ?
            Row(
              children: [
                Text('از '),
                Text(course.start_date_at,),
                Text(' تا '),
                Text(course.end_date_at =='' ?'کنون':course.end_date_at),
              ],
            ):Container()
          ],),
        )
      ],),
    );
  }
}
