import 'dart:io';

import 'package:dana/data/model/login_response_model.dart';
import 'package:dana/presentation/binding/main_binding.dart';
import 'package:dana/presentation/navigation/dana.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'data/client.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Client.init();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: DanaRoutes.splashPage,
      getPages: DanaApp.pages,
      locale: Locale('fa', 'IR'),
      initialBinding: MainBinding(),
      theme: ThemeData(
        primaryColor: Colors.blueGrey.shade100,
        iconTheme: IconThemeData(
          color:Color(0xffFAD34E),
        ),
        fontFamily: 'IranYekan',
      ),
    );
  }

}
