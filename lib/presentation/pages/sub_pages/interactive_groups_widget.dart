import 'package:flutter/material.dart';

class InteractiveGroupsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child:
      ListView.separated(
          shrinkWrap: true,
          itemBuilder: (index,context){
            return
              Column(
                children: [
                  Container(
                  height: 120,
                  child: Row(
                    children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.all(16.0),
                            decoration: new BoxDecoration(
                                shape: BoxShape.circle,
                                image: new DecorationImage(
                                    fit: BoxFit.fill,
                                    image: new NetworkImage(
                                        "https://images.all-free-download.com/images/graphiclarge/hd_picture_of_the_beautiful_natural_scenery_03_166249.jpg")
                                )
                            )),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Text('حاکمیت مدیریت دانش'),
                            ],
                          ),
                          Row(
                            children: [
                              Text('ساختار مناسب حاکمیتی در'),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(child:
                    Row(children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          Text('موضوعات'),
                          Text('۱ موضوع'),
                        ],),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          Text('تعداد پست'),
                          Text('۷ پست'),
                        ],),
                      ),
                    ],),)
                  ],),
            ),
                  Row(
                    children: [
                      Expanded(child:
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('مدیر فروم'),
                        ],
                      ),
                      ),
                      Expanded(
                        flex: 2,
                          child: Row(children: create(),))
                      // Expanded(
                      //   flex: 2,
                      //   child: Container(
                      //     height: 70,
                      //     child: CustomScrollView(
                      //       slivers: [
                      //         SliverGrid(
                      //           gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      //             maxCrossAxisExtent: 70,
                      //             mainAxisExtent: 70,
                      //             mainAxisSpacing: 2.0,
                      //             crossAxisSpacing: 2.0,
                      //             childAspectRatio: 1.0,
                      //           ),
                      //           delegate: SliverChildBuilderDelegate(
                      //                 (BuildContext context, int index) {
                      //               return
                      //                 Column(
                      //                   children: [
                      //                     Expanded(
                      //                       flex:2,
                      //                       child: ClipRRect(
                      //                           borderRadius: BorderRadius.circular(70.0),
                      //                           child: Image.asset('asset/image/me.jpg')
                      //                       ),
                      //                     ),
                      //                     Expanded(child: Text('mehdi'))
                      //                   ],
                      //                 );
                      //             },
                      //             childCount: 2,
                      //           ),
                      //         )
                      //       ],
                      //     ),
                      //   ),
                      // ),
                    ],
                  )
                ],
              );
          },
          separatorBuilder: (BuildContext context, int index) => Divider(),
          itemCount: 30
      ),
    );
  }
  List<Widget> create(){
    List<Widget> list = [];
    for(int i=0;i<3;i++)
      list.add(
          Container(
            height: 80,
            margin: EdgeInsets.all(8.0),
            child: Column(
        children: [
            Expanded(
              flex:2,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(70.0),
                  child: Image.asset('asset/image/me.jpg')
              ),
            ),
            Expanded(child: Text('mehdi'))
        ],
      ),
          ));
    return list
     ;
  }
}

