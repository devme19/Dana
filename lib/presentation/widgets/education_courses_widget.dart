import 'package:dana/core/config/config.dart';
import 'package:dana/data/model/cv_model.dart';
import 'package:dana/presentation/controller/home_controller.dart';
import 'package:dana/presentation/model/edu_courses_item.dart';
import 'package:dana/presentation/widgets/education_courses_item_widget.dart';
import 'package:dana/presentation/widgets/title_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persian_datepicker/persian_datepicker.dart';
class EducationCoursesWidget extends StatelessWidget {
  TextEditingController titleTxtController = TextEditingController();
  TextEditingController descriptionTxtController = TextEditingController();
  TextEditingController startDateTxtController = TextEditingController();
  TextEditingController endDateTxtController = TextEditingController();
  PersianDatePickerWidget persianStartDatePicker;
  PersianDatePickerWidget persianEndDatePicker;
  final ValueChanged<Course> removeCourse;
  final ValueChanged<Course> editCourse;
  final bool isUser;
  List<Course> courses=[];
  EducationCoursesWidget({this.courses,this.removeCourse,this.editCourse,this.isUser});
    // fromDateTxtController.text = 'تاریخ پایان';
//     persianStartDatePicker = PersianDatePicker(
//       controller: startDateTxtController,
// //      datetime: '1397/06/09',
//     ).init();
//     // toDateTxtController.text = 'تاریخ شروع';
//     persianEndDatePicker = PersianDatePicker(
//       controller: endDateTxtController,
// //      datetime: '1397/06/09',
//     ).init();
  bottomSheet(Course course) async {
    persianEndDatePicker = PersianDatePicker(
      controller: endDateTxtController,
      //      datetime: '1397/06/09',
    ).init();
    persianStartDatePicker = PersianDatePicker(
      controller: startDateTxtController,
      //      datetime: '1397/06/09',
    ).init();
    if (course != null) {
      if (course.title != null)
        titleTxtController.text = course.title;
      if (course.description != null)
        descriptionTxtController.text = course.description;
      if (course.start_date_at != null && course.start_date_at != '') {
        startDateTxtController.text = course.start_date_at;
        persianStartDatePicker = PersianDatePicker(
          controller: startDateTxtController,
          //      datetime: '1397/06/09',
        ).init();
      }
      if (course.end_date_at != null && course.end_date_at != '') {
        endDateTxtController.text = course.end_date_at;
        persianEndDatePicker = PersianDatePicker(
          controller: endDateTxtController,
          //      datetime: '1397/06/09',
        ).init();
      }
    }
    else
    {
      titleTxtController.clear();
      descriptionTxtController.clear();
      startDateTxtController.clear();
      endDateTxtController.clear();
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
                child:
                Column(children: [
                  TitleBarWidget(title: 'اطلاغات شغلی',),
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

                        SizedBox(height: spaceBetween,),
                        Row(
                          children: [
                            Expanded(
                              child: Directionality(
                                textDirection: TextDirection.rtl,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.calendar_today),
                                      labelText: 'تاریخ پایان',
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
                                  enableInteractiveSelection: false, // *** this is important to prevent user interactive selection ***
                                  onTap: () {
                                    FocusManager.instance.primaryFocus.unfocus();
                                    Get.bottomSheet(
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    color:Colors.white,
                                                    child: Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: ElevatedButton(onPressed: (){
                                                        Get.back();
                                                      }, child: Text('تایید'),style: ButtonStyle(
                                                        backgroundColor: MaterialStateProperty.all<Color>(Colors.blueAccent),
                                                      ),),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Expanded(child: persianEndDatePicker)
                                          ],
                                        ));
                                  },
                                  controller: endDateTxtController,
                                ),
                              ),
                            ),
                            SizedBox(width: 16.0,),
                            Expanded(
                              child: Directionality(
                                textDirection: TextDirection.rtl,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.calendar_today),
                                      labelText: 'تاریخ شروع',
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
                                  enableInteractiveSelection: false, // *** this is important to prevent user interactive selection ***
                                  onTap: () {
                                    FocusManager.instance.primaryFocus.unfocus();
                                    Get.bottomSheet(
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    color:Colors.white,
                                                    child: Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: ElevatedButton(onPressed: (){
                                                        Get.back();
                                                      }, child: Text('تایید'),style: ButtonStyle(
                                                        backgroundColor: MaterialStateProperty.all<Color>(Colors.blueAccent),
                                                      ),),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Expanded(child: persianStartDatePicker)
                                          ],
                                        ));
                                    FocusScope.of(Get.context).requestFocus(new FocusNode()); // to prevent opening default keyboard
                                    // showModalBottomSheet(
                                    //     context: context,
                                    //     builder: (BuildContext context) {
                                    //       return persianFromDatePicker;
                                    //     });
                                  },
                                  controller: startDateTxtController,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: spaceBetween,),
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: TextFormField(
                            maxLines: 5,
                            controller: titleTxtController,
                            decoration: InputDecoration(
                                filled: true,
                                labelText: 'توضیحات',
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
                        SizedBox(height: spaceBetween,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top:8.0,right: 8.0),
                              child: ElevatedButton(onPressed: (){
                                // EduCoursesItem item = EduCoursesItem(
                                //     title: titleTxtController.text,
                                //     startDate: startDateTxtController.text,
                                //     endDate: endDateTxtController.text,
                                //     description: descriptionTxtController.text
                                // );
                                // controller.addEduCourses(item);
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Padding(
              padding: const EdgeInsets.only(left: 16,right: 16),
              child: Text('دوره های آموزشی',style: TextStyle(fontWeight: FontWeight.bold),),
            ),
            isUser?Padding(padding: EdgeInsets.only(top: 32,bottom: 32)): Padding(
              padding: const EdgeInsets.only(left: 16,right: 16),
              child: InkWell(
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
            ),
          ],
        ),
        courses.length != 0?
        Column(
          children: [
            Divider(color: Colors.grey,),
            Padding(
                padding: const EdgeInsets.only(left:24.0,right: 24.0,bottom: 8.0,top: 8.0),
                child:  Column(children:
                createEduCoursesView(courses)
                )
            ),
          ],
        ):Container()
      ],),
    );
  }
  List<Widget> createEduCoursesView(List<Course> courses){
    List<Widget> list = [];
    for(Course item in courses)
      list.add(EducationCoursesItemWidget(course: item,editCourse: editCourseItem,removeCourse: removeCourseItem,));
    return list;

  }
  removeCourseItem(Course item){
    removeCourse(item);
  }
  editCourseItem(Course course){
    bottomSheet(course);
  }
}
