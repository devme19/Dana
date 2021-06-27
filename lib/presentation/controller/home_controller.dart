import 'package:dana/core/usecase/usecase.dart';
import 'package:dana/domain/usecase/user/get_cv_usecase.dart';
import 'package:dana/domain/usecase/user/logout_usecase.dart';
import 'package:dana/presentation/model/edu_courses_item.dart';
import 'package:dana/presentation/model/edu_inf_item.dart';
import 'package:dana/presentation/model/job_inf_item.dart';
import 'package:dana/presentation/model/project_item.dart';
import 'package:dana/presentation/model/skill_item.dart';
import 'package:dana/presentation/model/state_status.dart';
import 'package:dana/presentation/model/language_item.dart';
import 'package:dana/presentation/navigation/dana.dart';
import 'package:dana/presentation/pages/sub_pages/activities_widget.dart';
import 'package:dana/presentation/pages/sub_pages/cv_widget.dart';
import 'package:dana/presentation/pages/sub_pages/free_knowledge_page.dart';
import 'package:dana/presentation/pages/sub_pages/interactive_groups_widget.dart';
import 'package:dana/presentation/widgets/content_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
  var getInfoState = StateStatus.INITIAL.obs;
  RxList eduInfoList = [].obs;
  RxList projectsList = [].obs;
  RxList jobInfoList = [].obs;
  RxList eduCoursesList = [].obs;
  RxList skillsList = [].obs;
  RxList languagesList = [].obs;
  RxBool working = false.obs;
  RxString aboutMe = ''.obs;
  RxInt selectedMenu = 0.obs;
  Rx<ContentWidget> body = ContentWidget(body: CvWidget(parameters: '',),).obs;
  logOut(){
    LogOutUseCase logOutUseCase = Get.find();
    logOutUseCase.call(NoParams()).then((response){
      if(response.isRight)
        Get.offAndToNamed(DanaRoutes.loginPage);
    });
  }
  selectMenu(int index){
    switch(index){
      case 0:
       body.value = ContentWidget(body: CvWidget(parameters: '',),);
       break;
      case 1:
        // body.value = ContentWidget(body: KnowledgeWidget(),);
        Get.toNamed(DanaRoutes.knowledgePage);
        break;
      case 2:
        Get.toNamed(DanaRoutes.freeKnowledgePage);
        break;
      case 3:
        body.value = ContentWidget(body: ActivitiesWidget(),);
        break;
      case 4:
        body.value = ContentWidget(body: InteractiveGroupsWidget(),);
        break;
      case 10:
        logOut();
        break;
      default:
        body.value = ContentWidget(body: CvWidget(),);

    }
  }
  addProject(ProjectItem item){
    projectsList.add(item);
  }
  deleteProject(ProjectItem item){
    projectsList.remove(item);
  }
  addSkill(SkillItem item){
    skillsList.add(item);
  }
  addLanguage(LanguageItem item){
    languagesList.add(item);
  }
  deleteLanguage(LanguageItem item){
    languagesList.remove(item);
  }
  deleteSkill(SkillItem item){
    skillsList.remove(item);
  }
  setAboutMe(String about){
    aboutMe.value = about;
  }
  isWorking(bool check){
    working.value = check;
  }
  addEduCourses(EduCoursesItem item){
    eduCoursesList.add(item);
  }
  deleteEduCourses(EduCoursesItem item){
    eduCoursesList.remove(item);
  }
  addEducation(EduInfItem item){
    eduInfoList.add(item);
  }
  deleteEducation(EduInfItem item){
    eduInfoList.remove(item);
  }
  addJob(JobInfoItem item){
    jobInfoList.add(item);
  }
  deleteJob(JobInfoItem item){
    jobInfoList.remove(item);
  }

}