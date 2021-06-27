import 'dart:convert';

import 'package:dana/core/error/exceptions.dart';
import 'package:dana/data/model/cv_model.dart';
import 'package:get_storage/get_storage.dart';

abstract class DanaLocalDataSource{
  saveToken(String token);
  String getToken();
  saveUserInfo(CvModel cvModel);
  bool logOut();
  setUserId(String id);
  String getUserId();

}

class DanaLocalDataSourceImpl implements DanaLocalDataSource{
  GetStorage box;
  final String TOKEN =  "token";
  final String USERINFO =  "userInfo";
  final String USERID =  "userId";
  DanaLocalDataSourceImpl(){
    box = GetStorage();
  }
  @override
  String getToken() {
    try{
      return box.read(TOKEN);
    }catch(e){
      throw CacheException();
    }
  }
  @override
  saveToken(String token) {
    try{
      box.write(TOKEN, token);
    }catch(e){
      throw CacheException();
    }
  }

  @override
  saveUserInfo(CvModel cvModel) {
    try{
      box.write(USERINFO, json.encode(cvModel));
    }catch(e){
      throw CacheException();
    }
  }

  @override
  bool logOut() {
    try{
      box.remove(TOKEN);
    }catch(e){
      throw CacheException();
    }
    return true;
  }

  @override
  String getUserId() {
    try{
      return box.read(USERID);
    }catch(e){
      throw CacheException();
    }
  }

  @override
  setUserId(String id) {
    try{
      box.write(USERID,id);
    }catch(e){
      throw CacheException();
    }
  }

}