import 'package:circular_check_box/circular_check_box.dart';
import 'package:dana/core/config/config.dart';
import 'package:dana/data/model/cv_model.dart';
import 'package:dana/presentation/controller/home_controller.dart';
import 'package:dana/presentation/model/job_inf_item.dart';
import 'package:dana/presentation/widgets/check_box_widget.dart';
import 'package:dana/presentation/widgets/drop_down_widget.dart';
import 'package:dana/presentation/widgets/job_information_item_widget.dart';
import 'package:dana/presentation/widgets/title_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persian_datepicker/persian_datepicker.dart';
class JobInformationWidget extends StatelessWidget {
  final List<Experience> experiences;
  final ValueChanged<Experience> removeExperience;
  final ValueChanged<Experience> editExperience;
  String cooperate;
  bool cooperateType;
  bool currentlyWorking =false;
  TextEditingController titleTxtController = TextEditingController();
  TextEditingController companyNameTxtController = TextEditingController();
  TextEditingController cityTxtController = TextEditingController();
  TextEditingController jobTxtController = TextEditingController();
  TextEditingController startDateTxtController = TextEditingController();
  TextEditingController endDateTxtController = TextEditingController();
  TextEditingController descriptionTxtController = TextEditingController();
  FocusNode cooperateFocus = FocusNode();
  FocusNode companyFocus = FocusNode();
  FocusNode cityFocus = FocusNode();
  FocusNode jobFocus = FocusNode();
  PersianDatePickerWidget persianStartDatePicker;
  PersianDatePickerWidget persianEndDatePicker;
  CheckWidget checkWidget;
  final bool isUser;
  JobInformationWidget({
    this.experiences,
    this.removeExperience,
    this.editExperience,
    this.isUser
}){
    checkWidget = CheckWidget(checkValue1: false,checkValue2: false,resultAction: checkValue,);
  }
  setCurrentlyWorking(bool value){
    currentlyWorking = value;
  }
  setHowTooCooperate(String value){
    cooperate = value;
  }
  removeJob(Experience experience){
    removeExperience(experience);
  }
  editJob(Experience experience){
    // editExperience(experience);
    bottomSheet(experience);
  }
  checkValue(bool value){
    cooperateType = value;
  }
  List<Widget> buildJobsList(List<Experience> experiences){
    List<Widget> jobs = [];
    for(Experience item in experiences)
      jobs.add(JobInformationItemWidget(experience:item,editJob: editJob,removeJob: removeJob,));
    return jobs;
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
              child: Text('اطلاعات شغلی',style: TextStyle(fontWeight: FontWeight.bold),),
            ),
            isUser?Padding(padding: EdgeInsets.only(top: 32,bottom: 32)): Padding(
              padding: const EdgeInsets.only(left: 16,right: 16),
              child: InkWell(
                onTap: (){
                  Get.focusScope.unfocus();
                  bottomSheet(null);
                  // bSheet(null);
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

        experiences.length != 0?
        Column(
          children: [
            Divider(color: Colors.grey,),
            Padding(
                padding: const EdgeInsets.only(left:24.0,right: 24.0,bottom: 8.0,top: 8.0),
                child:
                Column(children:
                buildJobsList(experiences)
                )
            ),
          ],
        ):Container()
      ],),
    );
  }
  bottomSheet(Experience experience) async {
    persianEndDatePicker = PersianDatePicker(
      controller: endDateTxtController,
      //      datetime: '1397/06/09',
    ).init();
    persianStartDatePicker = PersianDatePicker(
      controller: startDateTxtController,
      //      datetime: '1397/06/09',
    ).init();
    if (experience != null) {
      if (experience.title != null)
        titleTxtController.text = experience.title;
      if (experience.company_name != null)
        companyNameTxtController.text = experience.company_name;
      // fromDateTxtController.text = 'تاریخ پایان';
      if (experience.start_date_at != null && experience.start_date_at != '') {
        startDateTxtController.text = experience.start_date_at;
        persianStartDatePicker = PersianDatePicker(
          controller: startDateTxtController,
          //      datetime: '1397/06/09',
        ).init();
      }
      if (experience.end_date_at != null && experience.end_date_at != '') {
        endDateTxtController.text = experience.end_date_at;
        persianEndDatePicker = PersianDatePicker(
          controller: endDateTxtController,
          //      datetime: '1397/06/09',
        ).init();
      }
      if (experience.location != null)
        cityTxtController.text = experience.location;
      if (experience.headline != null)
        jobTxtController.text = experience.headline;
      if (experience.employment_type != null)
        if (experience.employment_type.title == 'تمام وقت')
          checkWidget = CheckWidget(
            checkValue1: true, checkValue2: false, resultAction: checkValue,);
        else if (experience.employment_type.title == 'پاره وقت')
          checkWidget = CheckWidget(
            checkValue1: false, checkValue2: true, resultAction: checkValue,);
      if(experience.currently_working == "1")
        setCurrentlyWorking(true);
      else
        setCurrentlyWorking(false);
    }
    else
      {
        startDateTxtController.clear();
        endDateTxtController.clear();
        titleTxtController.clear();
        companyNameTxtController.clear();
        cityTxtController.clear();
        jobTxtController.clear();
        checkWidget = CheckWidget(
          checkValue1: false, checkValue2: false, resultAction: checkValue,);
        currentlyWorking = false;
      }
    await showModalBottomSheet(
      isScrollControlled: true, // required for min/max child size
      context: Get.context,
      builder: (ctx) {
        return Form(
          child: Container(
            height: 0.75 * Get.height,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(borderRadius)
            ),

            child: Column(
              children: [
                TitleBarWidget(title: 'اطلاعات شغلی',),
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
                              textInputAction: TextInputAction.next,
                              maxLines: null,
                              onEditingComplete: () =>
                                  FocusScope.of(Get.context).requestFocus(
                                      companyFocus),
                              decoration: InputDecoration(
                                  filled: true,
                                  labelText: 'عنوان',
                                  fillColor: Colors.white,
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(borderRadius)),
                                      borderSide: BorderSide(color: Colors.grey)

                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(borderRadius)),
                                      borderSide: BorderSide(
                                          color: Colors.grey.shade800)
                                  )
                              ),
                            ),
                          ),

                          // DropDow nDemo(parentAction: setHowTooCooperate, value: experience==null?null:experience.employment_type.title,),
                          SizedBox(height: spaceBetween,),
                          Directionality(
                            textDirection: TextDirection.rtl,
                            child: TextFormField(
                              textInputAction: TextInputAction.next,
                              focusNode: companyFocus,
                              maxLines: null,
                              controller: companyNameTxtController,
                              onEditingComplete: () =>
                                  FocusScope.of(Get.context).requestFocus(
                                      cityFocus),
                              decoration: InputDecoration(
                                  labelText: 'نام شرکت / سازمان',
                                  filled: true,
                                  fillColor: Colors.white,
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(borderRadius)),
                                      borderSide: BorderSide(color: Colors.grey)

                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(borderRadius)),
                                      borderSide: BorderSide(
                                          color: Colors.grey.shade800)
                                  )
                              ),
                            ),
                          ),
                          SizedBox(height: spaceBetween,),
                          Directionality(
                            textDirection: TextDirection.rtl,
                            child: TextFormField(
                              textInputAction: TextInputAction.next,
                              focusNode: cityFocus,
                              controller: cityTxtController,
                              onEditingComplete: () =>
                                  FocusScope.of(Get.context).requestFocus(
                                      jobFocus),
                              decoration: InputDecoration(
                                  labelText: 'شهر',
                                  filled: true,
                                  fillColor: Colors.white,
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(borderRadius)),
                                      borderSide: BorderSide(color: Colors.grey)

                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(borderRadius)),
                                      borderSide: BorderSide(
                                          color: Colors.grey.shade800)
                                  )
                              ),
                            ),
                          ),
                          SizedBox(height: spaceBetween,),
                          Directionality(
                            textDirection: TextDirection.rtl,
                            child: TextFormField(
                              textInputAction: TextInputAction.next,
                              focusNode: jobFocus,
                              controller: jobTxtController,
                              decoration: InputDecoration(
                                  labelText: 'سمت',
                                  filled: true,
                                  fillColor: Colors.white,
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(borderRadius)),
                                      borderSide: BorderSide(color: Colors.grey)

                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(borderRadius)),
                                      borderSide: BorderSide(
                                          color: Colors.grey.shade800)
                                  )
                              ),
                            ),
                          ),
                          SizedBox(height: spaceBetween,),
                          checkWidget,
                          SizedBox(height: spaceBetween,),
                          Row(
                            children: [
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
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(borderRadius)),
                                            borderSide: BorderSide(
                                                color: Colors.grey)

                                        ),
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(borderRadius)),
                                            borderSide: BorderSide(
                                                color: Colors.grey.shade800)
                                        )
                                    ),
                                    enableInteractiveSelection: false,
                                    // *** this is important to prevent user interactive selection ***
                                    onTap: () {
                                      // FocusScope.of(Get.context).requestFocus(FocusNode());
                                      FocusManager.instance.primaryFocus.unfocus();
                                      Get.bottomSheet(
                                          Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: Container(
                                                      color: Colors.white,
                                                      child: Padding(
                                                        padding: const EdgeInsets
                                                            .all(8.0),
                                                        child: ElevatedButton(
                                                          onPressed: () {
                                                            Get.back();
                                                            FocusScope.of(
                                                                Get.context)
                                                                .requestFocus(
                                                                new FocusNode());
                                                          },
                                                          child: Text('تایید'),
                                                          style: ButtonStyle(

                                                            backgroundColor: MaterialStateProperty
                                                                .all<Color>(
                                                                Colors
                                                                    .blueAccent),
                                                          ),),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Expanded(
                                                  child: persianStartDatePicker)
                                            ],
                                          ));
                                      FocusScope.of(Get.context).requestFocus(
                                          new FocusNode()); // to prevent opening default keyboard
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
                              SizedBox(width: 16.0,),
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
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(borderRadius)),
                                            borderSide: BorderSide(
                                                color: Colors.grey)

                                        ),
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(borderRadius)),
                                            borderSide: BorderSide(
                                                color: Colors.grey.shade800)
                                        )
                                    ),
                                    enableInteractiveSelection: false,
                                    // *** this is important to prevent user interactive selection ***
                                    onTap: () {
                                      FocusManager.instance.primaryFocus.unfocus();
                                      Get.bottomSheet(
                                          Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: Container(
                                                      color: Colors.white,
                                                      child: Padding(
                                                        padding: const EdgeInsets
                                                            .all(8.0),
                                                        child: ElevatedButton(
                                                          onPressed: () {
                                                            Get.back();
                                                          },
                                                          child: Text('تایید'),
                                                          style: ButtonStyle(
                                                            backgroundColor: MaterialStateProperty
                                                                .all<Color>(
                                                                Colors
                                                                    .blueAccent),
                                                          ),),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Expanded(
                                                  child: persianEndDatePicker)
                                            ],
                                          ));
                                    },
                                    controller: endDateTxtController,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: spaceBetween,),

                          Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                                borderRadius: BorderRadius.all(
                                    Radius.circular(5))
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CheckBoxWidget(result: setCurrentlyWorking,title: 'هم اکنون مشغول به کار هستم',checkValue: currentlyWorking ?true:false,)
                                // Text('هم اکنون مشغول به کار هستم'),
                                // Checkbox(
                                //   value: controller.working.value,
                                //   onChanged: (check)=>controller.isWorking(check),
                                // ),
                              ],
                            ),
                          ),
                          SizedBox(height: spaceBetween,),
                          Directionality(
                            textDirection: TextDirection.rtl,
                            child:
                            TextFormField(
                              maxLines: 5,
                              controller: descriptionTxtController,
                              onEditingComplete: () => Get.back(),
                              decoration: InputDecoration(
                                  labelText: 'توضیح بیشتر',
                                  filled: true,
                                  fillColor: Colors.white,
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(borderRadius)),
                                      borderSide: BorderSide(color: Colors.grey)

                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(borderRadius)),
                                      borderSide: BorderSide(
                                          color: Colors.grey.shade800)
                                  )
                              ),
                            ),
                          ),
                          SizedBox(height: spaceBetween,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 8.0, right: 8.0),
                                child: ElevatedButton(onPressed: () {
                                  JobInfoItem item = JobInfoItem(
                                      title: titleTxtController.text,
                                      city: cityTxtController.text,
                                      // howToCooperate: howToCooperateTxtController.text,
                                      companyName: companyNameTxtController
                                          .text,
                                      job: jobTxtController.text,
                                      startDate: startDateTxtController.text,
                                      endDate: endDateTxtController.text,
                                      description: descriptionTxtController.text
                                  );
                                  // controller.addJob(item);
                                  Get.back();
                                }, child: Text('تایید'), style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<
                                      Color>(Colors.blueAccent),
                                ),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: ElevatedButton(onPressed: () {
                                  Get.back();
                                }, child: Text('لغو'), style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<
                                      Color>(Colors.grey),
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
          ),
        );
      },
    );
  }
}
class CheckWidget extends StatefulWidget {
  ValueChanged<bool> resultAction;
  bool checkValue1,checkValue2;
  CheckWidget({this.resultAction,this.checkValue1,this.checkValue2});
  @override
  _CheckWidgetState createState() => _CheckWidgetState();
}

class _CheckWidgetState extends State<CheckWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.all(Radius.circular(5))
      ),
      child: Row(
        children: [
          Expanded(flex:1,child: Text('نحوه همکاری')),
          Expanded(
              flex:1,
              child:
              Row(children: [
                Text('تمام وقت'),
                Checkbox(
                  value: widget.checkValue1,
                  onChanged: (bool value) {
                    setState(() {
                      widget.checkValue1 = value;
                      if(value) {
                          widget.checkValue2 = false;
                          widget.resultAction(true);
                        }
                      });
                  },
                ),
              ],)),
          Expanded(
              flex:1,
              child: Row(children: [
                Text('پاره وقت'),
                Checkbox(
                  value: widget.checkValue2,
                  onChanged: (bool value) {

                    setState(() {
                      widget.checkValue2 = value;
                      if(value) {
                        widget.checkValue1 = false;
                        widget.resultAction(false);
                      }
                    });
                  },
                ),
              ],))
        ],
      ),
    );
  }
}

