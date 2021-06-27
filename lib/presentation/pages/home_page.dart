import 'dart:io';

import 'package:dana/presentation/controller/home_controller.dart';
import 'package:downloads_path_provider/downloads_path_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:permission_handler/permission_handler.dart';

class HomePage extends GetView<HomeController> {
  // HomePage(){
  //   controller.selectMenu(1);
  // }
  @override
  Widget build(BuildContext context) {
    return
      SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              iconTheme: IconThemeData(color:Colors.black54,),
            ),
            drawer:
            Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  // DrawerHeader(
                  //   decoration: BoxDecoration(
                  //     color: Color(0xffFAD34E),
                  //   ),
                  // ),
                  ListTile(
                    title: Text('رزومه'),
                    onTap: () {
                      Get.back();
                      controller.selectMenu(0);

                    },
                  ),
                  ListTile(
                    title: Text('درس آموخته ها'),
                    onTap: () {
                      Get.back();
                      controller.selectMenu(1);

                      // Update the state of the app.
                      // ...
                    },
                  ),
                  ListTile(
                    title: Text('دانش های آشکار'),
                    onTap: () {
                      Get.back();
                      controller.selectMenu(2);

                    },
                  ),
                  ListTile(
                    title: Text('فعالیت ها'),
                    onTap: () {
                      // controller.selectMenu(3);
                      Get.back();
                    },
                  ),
                  ListTile(
                    title: Text('گروه های تعاملی'),
                    onTap: () {
                      // controller.selectMenu(4);
                      Get.back();
                    },
                  ),
                  ListTile(
                    title: Text('علاقه مندی ها'),
                    onTap: () {

                    },
                  ),
                  ListTile(
                    title: Text('ارزیابی درس آموخته'),
                    onTap: () {

                    },
                  ),
                  ListTile(
                    title: Text('داشبورد فعالبت های من'),
                    onTap: () {

                    },
                  ),
                  ListTile(
                    title: Text('مدیریت درس آموخته های من'),
                    onTap: () {

                    },
                  ),
                  ListTile(
                    title: Text('مدیریت دانش های آشکار من'),
                    onTap: () {

                    },
                  ),
                  ListTile(
                    title: Text('خروج'),
                    onTap: () {
                      controller.selectMenu(10);
                      Get.back();
                    },
                  ),
                ],
              ),
            ),
            body:
            Obx(()=>controller.body.value
            )
        ),
      );
  }
}
