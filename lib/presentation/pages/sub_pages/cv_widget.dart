import 'package:dana/core/config/config.dart';
import 'package:dana/data/model/cv_model.dart';
import 'package:dana/data/model/project_model.dart';
import 'package:dana/presentation/controller/cv_controller.dart';
import 'package:dana/presentation/controller/friend_suggestion_controller.dart';
import 'package:dana/presentation/model/state_status.dart';
import 'package:dana/presentation/widgets/connection_error_widget.dart';
import 'package:dana/presentation/widgets/friend_suggestion_widget.dart';
import 'package:dana/presentation/widgets/header_widget.dart';
import 'package:dana/presentation/widgets/projects_widget.dart';
import 'package:dana/presentation/widgets/skills_widget.dart';
import 'package:dana/presentation/widgets/user_level_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../../widgets/about_me_widget.dart';
import '../../widgets/complete_profile_widget.dart';
import '../../widgets/education_courses_widget.dart';
import '../../widgets/educational_information_widget.dart';
import '../../widgets/job_information_widget.dart';
import '../../widgets/language_widget.dart';

class CvWidget extends GetView<CvController> {
  String parameters='';
  CvWidget({this.parameters}){
    controller.getCv(parameters);
  }
  retry(bool value){
    controller.getCv(parameters);
  }
  editAboutMe(String value){
    controller.editAboutMe(value);
  }
  removeExperience(Experience experience){
    controller.removeExperience(experience);
  }
  editExperience(Experience experience){

  }
  removeEducation(Education education){
    controller.removeEducation(education);
  }
  editEducation(Education education){
  }
  removeCourse(Course course){
    controller.removeCourse(course);
  }
  removeLanguage(Language language){
    controller.removeLanguage(language);
  }
  removeSkill(Skill skill){
    controller.removeSkill(skill);
  }
  removeProject(ProjectModel project){
    controller.removeProject(project);
  }
  editCourse(Course course){
  }
  @override
  Widget build(BuildContext context) {
    return
      Obx(()=>
         controller.getCvState.value == StateStatus.LOADING?
         SpinKitDualRing(color: Colors.orange):
         controller.getCvState.value == StateStatus.ERROR?
          ConnectionErrorWidget(parentAction: retry,):
         Container(
           color: Get.theme.primaryColor,
           child: SingleChildScrollView(
              child: Column(
                children: [
                  HeaderWidget(
                    name: controller.cvEntity.value.data.name,
                    family: controller.cvEntity.value.data.family,
                    organizationChartTitle: controller.cvEntity.value.data.organizational_chart.title ,

                    coverImage: controller.cvEntity.value.data.cover_image,
                    photo: controller.cvEntity.value.data.photo,
                  ),
                  SizedBox(height: space,),
                  UserLevelWidget(),
                  SizedBox(height: space,),
                  CompleteProfileWidget(
                    image: controller.cvEntity.value.data.progress.image,
                    aboutMe: controller.cvEntity.value.data.progress.about_me,
                    courses: controller.cvEntity.value.data.progress.courses,
                    experiences: controller.cvEntity.value.data.progress.experiences,
                    skills: controller.cvEntity.value.data.progress.skills,
                  ),
                  SizedBox(height: space,),
                  AboutMeWidget(aboutMe: controller.aboutMe.value,parentAction: editAboutMe,isUser: false,),
                  SizedBox(height: space,),
                  JobInformationWidget(experiences: controller.experienceLength>0?controller.experiences:[],removeExperience: removeExperience,isUser: false),
                  SizedBox(height: space,),
                  EducationalInformationWidget(educations: controller.educationsLength>0?controller.educations:[],removeEducation: removeEducation,editEducation: editEducation,isUser: false),
                  SizedBox(height: space,),
                  EducationCoursesWidget(courses:controller.coursesLength>0? controller.courses:[],removeCourse: removeCourse,editCourse: editCourse,isUser: false),
                  SizedBox(height: space,),
                  SkillsWidget(skills: controller.skillsLength>0?controller.skills:[],removeSkill: removeSkill,isUser: false),
                  SizedBox(height: space,),
                  LanguageWidget(languages: controller.languagesLength>0?controller.languages:[],removeLanguage: removeLanguage,isUser: false),
                  SizedBox(height: space,),
                  ProjectsWidget(projects: controller.projectsLength>0?controller.projects:[],removeProject: removeProject,isUser: false),
                  SizedBox(height: space,),
                  FriendSuggestionWidget(),
                  SizedBox(height: space,),
                  // Container(
                  //   height: 400,
                  //   child: CustomScrollView(
                  //     slivers: [
                  //       SliverGrid(
                  //         gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  //           maxCrossAxisExtent: 220,
                  //           mainAxisExtent: 220,
                  //           mainAxisSpacing: 0.0,
                  //           crossAxisSpacing: 0.0,
                  //           childAspectRatio: 1.0,
                  //         ),
                  //         delegate: SliverChildBuilderDelegate(
                  //               (BuildContext context, int index) {
                  //             return
                  //               FriendSuggestionsItemWidget();
                  //           },
                  //           childCount: 6,
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // )
                ],
              ),
            ),
         ));
  }
}
