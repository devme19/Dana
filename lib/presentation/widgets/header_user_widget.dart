import 'package:dana/presentation/controller/cv_controller.dart';
import 'package:dana/presentation/controller/cv_user_controller.dart';
import 'package:dana/presentation/widgets/following_users_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'followers_users_widget.dart';

class HeaderUserWidget extends GetView<CvUserController> {
  final String coverImage;
  final String organizationChartTitle;
  final String photo;
  final String name;
  final String family;
  final String personalCode;
  HeaderUserWidget({
    this.name,
    this.family,
    this.organizationChartTitle,
    this.coverImage,
    this.photo,
    this.personalCode
});
  onUserItemClick(String parameters){
    controller.pushToStack('?personal_code=$personalCode');
    controller.getCv(parameters);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(bottom: 16.0),
      height: 350,
      child: Stack(
        children: [

          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 200,
                child: coverImage ==null?Icon(Icons.image_not_supported_sharp):Image.network(coverImage,fit: BoxFit.cover,)),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              margin: EdgeInsets.only(right: 50.0,left: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        height: 130,
                        padding: EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),

                        child:  photo == null ?
                        Icon(Icons.image_not_supported_sharp):
                        Container(
                          width:123,
                            height: 123,
                            decoration: new BoxDecoration(
                                shape: BoxShape.circle,
                                image: new DecorationImage(
                                    fit: BoxFit.fill,
                                    image: new NetworkImage(photo)
                                )
                            )),
                      ),
                      Expanded(
                        child: Container(
                          height: 60,
                          child:
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [

                                  Padding(
                                    padding: const EdgeInsets.only(right:8.0,top: 8),
                                    child: Text(name+" "+family,style: TextStyle(fontWeight: FontWeight.bold),),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(right:8.0,top: 4),
                                      child: Text(organizationChartTitle),
                                    ),
                                  )
                                ],
                              ),
                              Row(

                                // mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('ویرایش',style: TextStyle(color: Colors.amber),),
                                  ),
                                  Icon(Icons.edit,color: Colors.amber,)
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),

                    ],
                  ),
                  SizedBox(height: 20,),
                 Obx(()=> Row(
                   // mainAxisAlignment: MainAxisAlignment.end,
                   children: [
                     ElevatedButton(onPressed: (){
                       FollowingUsersWidget(parameters: '&personal_code=$personalCode',parentAction: onUserItemClick,);
                     }, child: Row(
                       children: [
                         Text(controller.followingCount.value.toString()??""),
                         Text(" "),
                         Text('دنبال شونده'),
                       ],
                     ),style: ButtonStyle(
                       backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
                     ),),
                     SizedBox(width: 15,),
                     ElevatedButton(onPressed: (){
                       // Get.defaultDialog(
                       //   content: Container(height:300,child: FollowUsersWidget())
                       // );
                       FollowersUsersWidget(parameters: '&personal_code=$personalCode',parentAction: onUserItemClick);
                     }, child: Row(
                       children: [
                         Text(controller.followersCount.value.toString()??""),
                         Text(" "),
                         Text('دنبال کننده'),
                       ],
                     ),style: ButtonStyle(
                       backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
                     ),),


                   ],
                 ))
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
