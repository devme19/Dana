import 'dart:convert';
import 'package:dana/core/config/config.dart';
import 'package:dana/presentation/controller/auth_controller.dart';
import 'package:dana/presentation/model/state_status.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
// ignore: must_be_immutable
class LoginPage extends GetView<AuthController>{
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // locale = Locale('en', 'US');
    // Get.updateLocale(locale);
    emailController.text='ahmad@yahoo.com';
    passwordController.text='123456';
    final node = FocusScope.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("ورود"),
      ),
        body:
        Form(
          key: _formKey,
          child:
          Container(
            margin: EdgeInsets.only(left: 32,right: 32),
            child: Center(
              child: SingleChildScrollView(
                child: Column(

                  children: [
                    TextFormField(
                      controller: emailController,
                      onEditingComplete: () => node.nextFocus(),
                      // style: TextStyle(fontSize: 25),
                      validator: (value){
                        if(value.isEmpty){
                          return 'لطفا ایمیل را وارد کنید'.tr;
                        }
                        else if(GetUtils.isEmail(value))
                          return null;
                        else return 'فرمت ایمیل نامعتبر است'.tr;
                      },
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Get.theme.brightness == Brightness.light?Colors.white:Get.theme.scaffoldBackgroundColor,
                          labelText: 'ایمیل',
                          prefixIcon: Icon(Icons.email),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
                              borderSide:Get.theme.brightness == Brightness.light?
                              BorderSide.none:BorderSide(color: Colors.white)

                          ),
                          border:OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
                              borderSide:Get.theme.brightness == Brightness.light?
                              BorderSide.none:BorderSide(color: Colors.white)
                          )
                      ),
                    ),
                    SizedBox(height: 25,),
                    TextFormField(
                      // style: TextStyle(fontSize: 25),
                      obscureText: true,
                      onEditingComplete: () => node.nextFocus(),
                      controller: passwordController,
                      // obscureText: controller.obscureText.value,
                      validator: (value){
                        if(value.isEmpty){
                          return 'لطفا کلمه عبور را وارد کنید'.tr;
                        }
                        else
                          return null;
                      },
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Get.theme.brightness == Brightness.light?Colors.white:Get.theme.scaffoldBackgroundColor,
                          labelText: 'کلمه عبور',
                          prefixIcon: Icon(Icons.vpn_key),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.remove_red_eye),
                            onPressed: (){
                              // controller.obscurePassword();
                            },
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
                              borderSide:Get.theme.brightness == Brightness.light?
                              BorderSide.none:BorderSide(color: Colors.white)

                          ),
                          border:OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
                              borderSide:Get.theme.brightness == Brightness.light?
                              BorderSide.none:BorderSide(color: Colors.white)
                          )
                      ),
                    ),
                    SizedBox(height: 50,),
                    // RaisedButton(
                    //     shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(borderRadius),
                    //       // side: BorderSide(color: Colors.grey.shade200)
                    //     ),
                    //     color: Colors.green,
                    //     padding: EdgeInsets.only(top: 20,bottom: 20),
                    //     onPressed:() {
                    //       if (_formKey.currentState.validate()) {
                    //         // Get.snackbar('processingDataTxt'.tr, '');
                    //         Map<String, dynamic> jsonMap = {
                    //           'email': emailController.text,
                    //           'password': passwordController.text,
                    //         };
                    //         String body = json.encode(jsonMap);
                    //         loginController.login(body);
                    //       }
                    //     },
                    //     child:
                    //     Obx(()=>Row(
                    //       mainAxisAlignment: MainAxisAlignment.center,
                    //       children: [
                    //         Text('loginBtnTxt'.tr,style: TextStyle(color: Colors.white),),
                    //         loginController.loading.value?Container(margin:EdgeInsets.only(left: 15),width:20,height: 20,child: CircularProgressIndicator(backgroundColor: Colors.white,)):Container()
                    //       ],
                    //     ))
                    // ),
                    Container(
                      child:
                      Obx(()=>
                          ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                                // side: BorderSide(color: Colors.grey.shade200)
                              ),),
                              backgroundColor: MaterialStateProperty.all(Color(0xffE1AD41)),
                              padding: MaterialStateProperty.all(EdgeInsets.only(left:64,right: 64,top: 8.0,bottom: 8.0)),
                              textStyle: MaterialStateProperty.all(TextStyle(fontSize: 25))
                          ),
                          onPressed:controller.userLoginState.value == StateStatus.LOADING?null:
                              () {
                            if (_formKey.currentState.validate()) {
                              // Get.snackbar('processingDataTxt'.tr, '');
                              Map<String, dynamic> jsonMap = {
                                'email': emailController.text,
                                'password': passwordController.text,
                              };
                              controller.login(jsonMap);
                              // controller.getEducations();
                            }
                          },
                          child: controller.userLoginState.value == StateStatus.LOADING?
                              Container(
                                height: 43,
                                width: 43,
                                padding: EdgeInsets.all(15),
                                child: CircularProgressIndicator(
                                  valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
                                ),
                              ):
                          // Padding(
                          //   padding: const EdgeInsets.only(left:64,right: 64,top: 8.0,bottom: 8.0),
                          //   child: SpinKitDualRing(color: Colors.white,size: 5,),
                          // ):
                          Text('ورود'.tr,style: TextStyle(color: Colors.white),)
                      )),
                    ),
                    SizedBox(height: 25,),
                    Row(
                      children: [
                        Expanded(
                          flex:1,
                          child:
                          Container(
                            height: 50,
                            child: InkWell(
                              // color: Colors.white,
                                onTap: (){
                                  // Get.toNamed(NavidAppRoutes.registerPage);
                                },
                                child: Center(child: Text('ثبت نام'.tr))
                            ),
                          ),
                        ),
                        Expanded(
                          flex:1,
                          child:
                          Container(
                            height: 50,
                            child: InkWell(
                              // color: Colors.white,
                                onTap: (){
                                  // Get.toNamed(NavidAppRoutes.resetPasswordPage);
                                },
                                child: Center(child: Padding(
                                  padding: const EdgeInsets.only(right:8.0,left: 8.0),
                                  child: Text('فراموشی کلمه عبور'.tr,maxLines: 1,),
                                ))
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
    );
  }

}
