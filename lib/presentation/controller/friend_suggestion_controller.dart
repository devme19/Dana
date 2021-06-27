import 'package:dana/core/usecase/usecase.dart';
import 'package:dana/data/model/user_model.dart';
import 'package:dana/domain/entity/suggestion_entity.dart';
import 'package:dana/domain/usecase/user/follow_usecase.dart';
import 'package:dana/domain/usecase/user/get_suggestions_usecase.dart';
import 'package:dana/presentation/controller/cv_controller.dart';
import 'package:dana/presentation/model/state_status.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class FriendSuggestionController extends GetxController{
  List<User> suggestionUsers=[];
  int pageIndex = 1;
  RxInt suggestionLength = 0.obs;
  var getSuggestionsState = StateStatus.INITIAL.obs;
  var followState = StateStatus.INITIAL.obs;
  Rx<SuggestionEntity> suggestionEntity = SuggestionEntity().obs;
  RxString usrId =''.obs;
  CvController cvController = Get.put(CvController());

  follow(String body,String id,bool follow,ValueChanged<String> parentAction){
    usrId.value = id;
    followState.value = StateStatus.LOADING;
    FollowUseCase followUseCase = Get.find();
    followUseCase.call(Params(value: body)).then((response) {
      if(response.isRight)
      {
        followState.value = StateStatus.SUCCESS;
        if(follow)
          cvController.followingCount.value++;
        else {
          cvController.followingCount.value--;
          suggestionUsers.clear();
          getSuggestions('?page=1');
          usrId.value = '';
        }
        if(parentAction!= null)
          parentAction(id);
        // for(User usr in suggestionUsers)
        //   if(userId == usr.id)
        //     suggestionUsers.remove(usr);
      }
      else if(response.isLeft){
        followState.value = StateStatus.ERROR;
      }
    });
  }

  getSuggestions(String parameters){
    getSuggestionsState.value = StateStatus.LOADING;
    GetSuggestionsUseCase getSuggestionsUseCase = Get.find();
    getSuggestionsUseCase.call(Params(value: parameters)).then((response) {
      if(response.isRight){
        getSuggestionsState.value = StateStatus.SUCCESS;
        suggestionEntity.value = response.fold((_) => suggestionEntity.value,(suggestionEntity) => suggestionEntity);
        suggestionUsers.addAll(suggestionEntity.value.data.users);
        suggestionLength.value = suggestionUsers.length;
        pageIndex = int.parse(suggestionEntity.value.data.page);
      }
      else if(response.isLeft){
        getSuggestionsState.value = StateStatus.ERROR;
      }
    });
  }
}