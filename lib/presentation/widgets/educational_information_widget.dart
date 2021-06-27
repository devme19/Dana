import 'package:dana/core/config/config.dart';
import 'package:dana/data/model/cv_model.dart';
import 'package:dana/presentation/controller/home_controller.dart';
import 'package:dana/presentation/model/edu_inf_item.dart';
import 'package:dana/presentation/widgets/educational_information_item_widget.dart';
import 'package:dana/presentation/widgets/title_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persian_datepicker/persian_datepicker.dart';

class EducationalInformationWidget extends StatelessWidget{
  TextEditingController schoolTxtController = TextEditingController();
  TextEditingController gradeTxtController = TextEditingController();
  TextEditingController fieldOfStudyTxtController = TextEditingController();
  TextEditingController startDateTxtController = TextEditingController();
  TextEditingController endDateTxtController = TextEditingController();
  FocusNode gradeFocus = FocusNode();
  FocusNode majorFocus = FocusNode();
  PersianDatePickerWidget persianStartDatePicker;
  PersianDatePickerWidget persianEndDatePicker;
  final ValueChanged<Education> removeEducation;
  final ValueChanged<Education> editEducation;
  List<Education> educations=[];
  final bool isUser;
  EducationalInformationWidget({this.educations,this.removeEducation,this.editEducation,this.isUser});
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

  @override
  Widget build(BuildContext context) {
    return
      Container(
        color: Colors.white,
      child:
      Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('اطلاعات تحصیلی',style: TextStyle(fontWeight: FontWeight.bold),),
            ),
            isUser?Padding(padding: EdgeInsets.only(top: 32,bottom: 32)):Padding(
              padding: const EdgeInsets.only(left: 16,right: 16),
              child: InkWell(
                onTap: (){
                  Get.focusScope.unfocus();
                  bottomSheet(null);
                },
                child: Padding(
                  padding: const EdgeInsets.only(top:16.0,bottom: 16),
                  child: Row(
                    children: [
                    Text('افزودن',style: TextStyle(color: Colors.green),),
                    Icon(Icons.add,color: Colors.green,)
                  ],),
                ),
              ),
            ),

          ],
        ),

        educations.length != 0?
        Column(
          children: [
            Divider(color: Colors.grey,),
            Padding(
                padding: const EdgeInsets.only(left:24.0,right: 24.0,bottom: 8.0,top: 8.0),
                child:  Column(children:
                createEduInfoView(educations)
                )
            ),
          ],
        ):Container()
      ],),
    );
  }
  List<Widget> createEduInfoView(List<Education> educations){
    List<Widget> list = [];
    for(Education item in educations)
      list.add(EducationalInformationItemWidget(item: item,editEdu: editEduItem,removeEdu: deleteEduItem,));
    return list;

  }
  deleteEduItem(Education item){
    removeEducation(item);
    // controller.deleteEducation(item);
  }
  editEduItem(Education item){
    // controller.deleteEducation(item);
    bottomSheet(item);
  }
  bottomSheet(Education education) async {
    persianEndDatePicker = PersianDatePicker(
      controller: endDateTxtController,
      //      datetime: '1397/06/09',
    ).init();
    persianStartDatePicker = PersianDatePicker(
      controller: startDateTxtController,
      //      datetime: '1397/06/09',
    ).init();
    if (education != null) {
      if (education.grade != null)
        gradeTxtController.text = education.grade.title;
      if (education.school != null)
        schoolTxtController.text = education.school;
      if (education.field_of_study != null)
        fieldOfStudyTxtController.text = education.field_of_study;
      // fromDateTxtController.text = 'تاریخ پایان';
      if (education.start_date_at != null && education.start_date_at != '') {
        startDateTxtController.text = education.start_date_at;
        persianStartDatePicker = PersianDatePicker(
          controller: startDateTxtController,
          //      datetime: '1397/06/09',
        ).init();
      }
      if (education.end_date_at != null && education.end_date_at != '') {
        endDateTxtController.text = education.end_date_at;
        persianEndDatePicker = PersianDatePicker(
          controller: endDateTxtController,
          //      datetime: '1397/06/09',
        ).init();
      }
    }
    else
      {
        gradeTxtController.clear();
        schoolTxtController.clear();
        fieldOfStudyTxtController.clear();
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
                TitleBarWidget(title: 'اطلاعات تحصیلی',),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: TextFormField(
                          controller: schoolTxtController,
                          onEditingComplete: () => FocusScope.of(Get.context).requestFocus(gradeFocus),
                          decoration: InputDecoration(
                              filled: true,
                              labelText: 'موسسه آموزشی',
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
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: TextFormField(
                          focusNode: gradeFocus,
                          controller: gradeTxtController,
                          onEditingComplete: () => FocusScope.of(Get.context).requestFocus(majorFocus),
                          decoration: InputDecoration(
                              labelText: 'مقطع تحصیلی',
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
                      ),
                      SizedBox(height: spaceBetween,),
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: TextFormField(
                          focusNode: majorFocus,
                          controller: fieldOfStudyTxtController,
                          decoration: InputDecoration(
                              labelText: 'رشته تحصیلی',
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top:8.0,right: 8.0),
                            child: ElevatedButton(onPressed: (){
                              // EduInfItem item = EduInfItem(
                              //     educationalInstitution: educationalInstitutionTxtController.text,
                              //     grade: gradeTxtController.text,
                              //     major: majorTxtController.text,
                              //     startDate: startDateTxtController.text,
                              //     endDate: endDateTxtController.text
                              // );
                              // controller.addEducation(item);
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
}
