import 'package:dana/core/error/failures.dart';
import 'package:dana/core/usecase/usecase.dart';
import 'package:dana/data/model/cv_model.dart';
import 'package:dana/data/model/project_model.dart';
import 'package:dana/data/model/suggestion_model.dart';
import 'package:dana/data/model/user_model.dart';
import 'package:dana/domain/entity/follow_entity.dart';
import 'package:dana/domain/entity/info_entity.dart';
import 'package:dana/domain/entity/suggestion_entity.dart';
import 'package:dana/domain/entity/user_entity.dart';
import 'package:dana/domain/usecase/user/follow_usecase.dart';
import 'package:dana/domain/usecase/user/get_cv_usecase.dart';
import 'package:dana/domain/usecase/user/get_followers_usecase.dart';
import 'package:dana/domain/usecase/user/get_following_usecase.dart';
import 'package:dana/domain/usecase/user/get_suggestions_usecase.dart';
import 'package:dana/presentation/model/state_status.dart';
import 'package:dana/presentation/navigation/dana.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CvController extends GetxController{
  var getCvState = StateStatus.INITIAL.obs;

  var getFollowersState = StateStatus.INITIAL.obs;
  var getFollowingState = StateStatus.INITIAL.obs;

  Rx<CvEntity> cvEntity = CvEntity().obs;

  List<Experience> experiences=[];
  List<ProjectModel> projects=[];
  List<Education> educations=[];
  List<Course> courses=[];
  List<Skill> skills=[];

  RxInt followingCount = 0.obs;
  RxInt followersCount = 0.obs;

  List<Language> languages=[];
  RxString aboutMe ="".obs;
  // Rx<FollowEntity> followers = FollowEntity().obs;
  // Rx<FollowEntity> following = FollowEntity().obs;
  FollowEntity followingEntity = FollowEntity();
  FollowEntity followersEntity = FollowEntity();
  RxList following = [].obs;
  RxList followers = [].obs;
  RxInt experienceLength = 0.obs;
  RxInt educationsLength = 0.obs;
  RxInt coursesLength = 0.obs;
  RxInt skillsLength = 0.obs;
  RxInt languagesLength = 0.obs;
  RxInt projectsLength = 0.obs;

  getCv(String parameters){
    getCvState.value = StateStatus.LOADING;
    experiences.clear();
    GetCvUseCase getCvUseCase = Get.find();
    getCvUseCase.call(Params(value: parameters)).then((response) {
      if(response.isRight){
        experiences.clear();
        educations.clear();
        courses.clear();
        skills.clear();
        languages.clear();
        cvEntity.value = response.fold((_) => cvEntity.value,(cvEntity) => cvEntity);
        aboutMe.value = cvEntity.value.data.about_me;
        experiences.addAll(cvEntity.value.data.experiences);
        educations.addAll(cvEntity.value.data.educations);
        courses.addAll(cvEntity.value.data.courses);
        skills.addAll(cvEntity.value.data.skills);
        languages.addAll(cvEntity.value.data.languages);
        projects.addAll(cvEntity.value.data.projects);
        projectsLength.value = projects.length;
        languagesLength.value = languages.length;
        skillsLength.value = skills.length;
        coursesLength.value = courses.length;
        educationsLength.value = educations.length;
        experienceLength.value = experiences.length;
        getCvState.value = StateStatus.SUCCESS;
        followingCount.value = cvEntity.value.data.following;
        followersCount.value = cvEntity.value.data.followers;
      }else if(response.isLeft){
        ServerFailure failure;
        failure = response.fold((failure) => failure,null);
        if(failure.errorCode == 401)
          Get.offAndToNamed(DanaRoutes.loginPage);
        else
        getCvState.value = StateStatus.ERROR;
      }
    });
  }

  removeExperience(Experience experience){
    experiences.remove(experience);
    experienceLength.value = experiences.length;
  }
  removeEducation(Education education){
    educations.remove(education);
    educationsLength.value = educations.length;
  }
  removeSkill(Skill skill){
    skills.remove(skill);
    skillsLength.value = skills.length;
  }
  removeLanguage(Language language){
    languages.remove(language);
    languagesLength.value = languages.length;
  }
  removeProject(ProjectModel project){
    projects.remove(project);
    projectsLength.value = projects.length;
  }
  removeCourse(Course course){
    courses.remove(course);
    coursesLength.value = courses.length;
  }

  getFollowers(String parameters){
    getFollowersState.value = StateStatus.LOADING;
    GetFollowersUseCase getFollowersUseCase = Get.find();
    getFollowersUseCase.call(Params(value: parameters)).then((response) {
      if(response.isRight){
        followersEntity = response.fold((_) => followersEntity,(followersEntity) => followersEntity);
        followers.addAll(followersEntity.data.users);
        getFollowersState.value = StateStatus.SUCCESS;
      }
      else if(response.isLeft){
        ServerFailure failure;
        response.fold((failure) => failure,null);
        getFollowersState.value = StateStatus.ERROR;
      }
    });
  }
  getFollowing(String parameters){
    getFollowingState.value = StateStatus.LOADING;
    GetFollowingUseCase getFollowingUseCase = Get.find();
    getFollowingUseCase.call(Params(value: parameters)).then((response) {
      if(response.isRight){
        followingEntity = response.fold((_) => followingEntity,(followingEntity) => followingEntity);
        following.addAll(followingEntity.data.users);
        getFollowingState.value = StateStatus.SUCCESS;
        followingCount.value = followingEntity.data.total;
      }
      else if(response.isLeft){
        ServerFailure failure;
        response.fold((failure) => failure,null);
        getFollowingState.value = StateStatus.ERROR;
      }
    });
  }
  editAboutMe(String abtMe){
    aboutMe.value = abtMe;
  }
}