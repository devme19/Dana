import 'package:dana/core/config/config.dart';
import 'package:dana/data/model/cv_model.dart';
import 'package:dana/data/model/project_model.dart';
import 'package:dana/presentation/controller/home_controller.dart';
import 'package:dana/presentation/model/project_item.dart';
import 'package:dana/presentation/widgets/project_item_widget.dart';
import 'package:dana/presentation/widgets/title_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persian_datepicker/persian_datepicker.dart';

class ProjectsWidget extends StatelessWidget {
  TextEditingController titleTxtController = TextEditingController();
  TextEditingController cityTxtController = TextEditingController();
  TextEditingController colleagueTxtController = TextEditingController();
  TextEditingController startDateTxtController = TextEditingController();
  TextEditingController endDateTxtController = TextEditingController();
  TextEditingController descriptionTxtController = TextEditingController();
  FocusNode colleagueFocus = FocusNode();
  FocusNode cityFocus = FocusNode();
  PersianDatePickerWidget persianStartDatePicker;
  PersianDatePickerWidget persianEndDatePicker;
  final ValueChanged<ProjectModel> removeProject;
  final ValueChanged<ProjectModel> editProject;
  List<ProjectModel> projects=[];
  final bool isUser;
  ProjectsWidget({
    this.removeProject,
    this.editProject,
    this.projects,
    this.isUser
});
//     // fromDateTxtController.text = 'تاریخ پایان';
//     persianStartDatePicker = PersianDatePicker(
//       controller: startDateTxtController,
// //      datetime: '1397/06/09',
//     ).init();
//     // toDateTxtController.text = 'تاریخ شروع';
//     persianEndDatePicker = PersianDatePicker(
//       controller: endDateTxtController,
// //      datetime: '1397/06/09',
//     ).init();
//   }

  bottomSheet(ProjectModel project) async {
    persianEndDatePicker = PersianDatePicker(
      controller: endDateTxtController,
      //      datetime: '1397/06/09',
    ).init();
    persianStartDatePicker = PersianDatePicker(
      controller: startDateTxtController,
      //      datetime: '1397/06/09',
    ).init();
    if (project != null) {
      if (project.title != null)
        titleTxtController.text = project.title;
      if (project.author.city != null)
        cityTxtController.text = project.author.city.name;
      if (project.description != null)
        descriptionTxtController.text = project.description;
      if (project.start_date_at != null && project.start_date_at != '') {
        startDateTxtController.text = project.start_date_at;
        persianStartDatePicker = PersianDatePicker(
          controller: startDateTxtController,
          //      datetime: '1397/06/09',
        ).init();
      }
      if (project.end_date_at != null && project.end_date_at != '') {
        endDateTxtController.text = project.end_date_at;
        persianEndDatePicker = PersianDatePicker(
          controller: endDateTxtController,
          //      datetime: '1397/06/09',
        ).init();
      }
    }
    else
    {
      titleTxtController.clear();
      cityTxtController.clear();
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
              height: (0.5)*Get.height,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(borderRadius)
              ),

              child: Column(
                children: [
                  TitleBarWidget(title: 'پروژه ها',),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Directionality(
                              textDirection: TextDirection.rtl,
                              child: TextFormField(
                                controller: titleTxtController,
                                onEditingComplete: () => FocusScope.of(Get.context).requestFocus(cityFocus),
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
                            Directionality(
                              textDirection: TextDirection.rtl,
                              child: TextFormField(
                                focusNode: cityFocus,
                                controller: cityTxtController,
                                // onEditingComplete: () => FocusScope.of(Get.context).requestFocus(jobFocus),
                                decoration: InputDecoration(
                                    labelText: 'شهر',
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
                            Directionality(
                              textDirection: TextDirection.rtl,
                              child: TextFormField(
                                maxLines: 5,
                                controller: descriptionTxtController,
                                onEditingComplete: () => Get.back(),
                                decoration: InputDecoration(
                                    labelText: 'شرح پروژه',
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
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top:8.0,right: 8.0),
                                  child: ElevatedButton(onPressed: (){
                                    // ProjectItem item = ProjectItem(
                                    //     title: titleTxtController.text,
                                    //     city: cityTxtController.text,
                                    //     colleagues: colleagueTxtController.text,
                                    //     startDate: startDateTxtController.text,
                                    //     endDate: endDateTxtController.text,
                                    //     description: descriptionTxtController.text
                                    // );
                                    // controller.addProject(item);
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
                      ),
                    ),
                  ),
                ],
              ),
            )
        );
      },
    );
  }
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
                padding: const EdgeInsets.only(left: 16,right: 16),
                child: Text('پروژه ها',style: TextStyle(fontWeight: FontWeight.bold),),
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
                    child: Row(children: [
                      Text('افزودن',style: TextStyle(color: Colors.green),),
                      Icon(Icons.add,color: Colors.green,)
                    ],),
                  ),
                ),
              ),

            ],
          ),
          projects.length != 0?
          Column(
            children: [
              Divider(color: Colors.grey,),
              Padding(
                  padding: const EdgeInsets.only(left:24.0,right: 24.0,bottom: 8.0,top: 8.0),
                  child:  Column(children:
                  createProjectsView(projects)
                  )
              ),
            ],
          ):Container()
        ],),
      );
  }
  List<Widget> createProjectsView(List<ProjectModel> projects){
    List<Widget> list = [];
    for(ProjectModel item in projects)
      list.add(ProjectItemWidget(project: item,editProject: editProjectItem,removeProject:removeProjectItem ,));
    return list;

  }
  removeProjectItem(ProjectModel project){
    removeProject(project);
  }
  editProjectItem(ProjectModel project){
    bottomSheet(project);
  }
}