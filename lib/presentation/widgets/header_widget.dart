import 'package:dana/presentation/controller/cv_controller.dart';
import 'package:dana/presentation/widgets/following_users_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'followers_users_widget.dart';

class HeaderWidget extends GetView<CvController> {
  final String coverImage;
  final String organizationChartTitle;
  final String photo;
  final String name;
  final String family;
  HeaderWidget({
    this.name,
    this.family,
    this.organizationChartTitle,
    this.coverImage,
    this.photo
});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(bottom: 16.0),
      height: 350,
      child: Stack(
        children: [

          Container(
            height: 200,
              child: Row(
                children: [
                  Expanded(child: coverImage ==null?Icon(Icons.image_not_supported_sharp):Image.network(coverImage,fit: BoxFit.cover,)),
                ],
              )),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              margin: EdgeInsets.all(8.0),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black45,
              ),
              child: Icon(Icons.camera_alt_outlined,color: Colors.white,),
            ),
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

                        child:  Stack(
                          children: [
                            photo == null ?
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
                            Positioned(
                              right:8,
                              bottom:4,
                              child: Container(
                                margin: EdgeInsets.only(left: 0,right: 0
                                ),
                                height: 35,
                                width: 108,
                                child: Center(child: Icon(Icons.camera_alt_outlined,color: Colors.white,),),
                                decoration: BoxDecoration(

                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.elliptical(50.5,33.95),
                                    bottomLeft: Radius.elliptical(50.5,33.95),
                                    // bottomLeft: Radius.circular(150),
                                  ),
                                  color: Colors.black45,
                                ),
                              ),
                            )
                          ],
                        ),
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
                       FollowingUsersWidget(parameters: '',parentAction: null,homeAction: refresh,);
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
                       FollowersUsersWidget(parameters: '',parentAction: null,homeAction: refresh,);
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
  refresh(String value){
    controller.getCv('');
  }
}
