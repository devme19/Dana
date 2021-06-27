import 'package:dana/presentation/binding/cv_user_binding.dart';
import 'package:dana/presentation/binding/free_knowledge_binding.dart';
import 'package:dana/presentation/binding/free_knowledge_detail_binding.dart';
import 'package:dana/presentation/binding/home_binding.dart';
import 'package:dana/presentation/binding/knowledge_binding.dart';
import 'package:dana/presentation/binding/knowledge_detail_binding.dart';
import 'package:dana/presentation/binding/login_binding.dart';
import 'package:dana/presentation/binding/main_binding.dart';
import 'package:dana/presentation/binding/splash_binding.dart';
import 'package:dana/presentation/pages/home_page.dart';
import 'package:dana/presentation/pages/login_page.dart';
import 'package:dana/presentation/pages/splash_page.dart';
import 'package:dana/presentation/pages/sub_pages/cv_user_page.dart';
import 'package:dana/presentation/pages/sub_pages/cv_widget.dart';
import 'package:dana/presentation/pages/sub_pages/free_knowledge_detail_page.dart';
import 'package:dana/presentation/pages/sub_pages/free_knowledge_page.dart';
import 'package:dana/presentation/pages/sub_pages/knowledge_detail_page.dart';
import 'package:dana/presentation/pages/sub_pages/knowledge_page.dart';
import 'package:get/get.dart';

class DanaRoutes{
  static final String loginPage = "/loginPage";
  static final String homePage = "/homePage";
  static final String splashPage = "/splashPage";
  static final String knowledgePage = "/knowledgePage";
  static final String knowledgeDetailPage = "/knowledgeDetailPage";
  static final String freeKnowledgePage = "/freeKnowledgePage";
  static final String freeKnowledgeDetailPage = "/freeKnowledgeDetailPage";
  static final String cvUserPage = "/cvUserPage";
}
class DanaApp{
  static final pages = [
    GetPage(name: DanaRoutes.loginPage, page:()=> LoginPage(),bindings:[MainBinding(),LoginBinding()]),
    GetPage(name: DanaRoutes.homePage, page: ()=>HomePage(),bindings: [MainBinding(),HomeBinding()]),
    GetPage(name: DanaRoutes.splashPage, page: ()=>SplashPage(),bindings: [MainBinding(),SplashBinding()]),
    GetPage(name: DanaRoutes.knowledgePage, page: ()=>KnowledgePage(),bindings: [MainBinding(),KnowledgeBinding()]),
    GetPage(name: DanaRoutes.knowledgeDetailPage, page: ()=>KnowledgeDetailPage(),bindings: [MainBinding(),KnowledgeDetailBinding()]),
    GetPage(name: DanaRoutes.freeKnowledgePage, page: ()=>FreeKnowledgePage(),bindings: [MainBinding(),FreeKnowledgeBinding()]),
    GetPage(name: DanaRoutes.freeKnowledgeDetailPage, page: ()=>FreeKnowledgeDetailPage(),bindings: [MainBinding(),FreeKnowledgeDetailBinding()]),
    GetPage(name: DanaRoutes.cvUserPage, page: ()=>CvUserPage(),bindings: [MainBinding(),CvUserBinding()]),
  ];
}