import 'package:flutter/material.dart';

class ActivitiesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      Container(
        color: Colors.white,
        child: ListView.separated(
        shrinkWrap: true,
          itemBuilder: (index,context){
            return ListTile(

              title: Text('پسندیدن درس آموخته'),
              subtitle: Text('اصول پیاده سازی مدیریت دانش در سازمان'),
              leading: Image.network("https://images.all-free-download.com/images/graphiclarge/hd_picture_of_the_beautiful_natural_scenery_03_166249.jpg"),
              // leading:  Container(
              //   height: 100,
              //     decoration: new BoxDecoration(
              //         shape: BoxShape.rectangle,
              //         image: new DecorationImage(
              //             fit: BoxFit.fill,
              //             image: new NetworkImage(
              //                 "https://images.all-free-download.com/images/graphiclarge/hd_picture_of_the_beautiful_natural_scenery_03_166249.jpg")
              //         )
              //     )),
              trailing: Text('۱ دقیقه قبل'),
            );
          },
          separatorBuilder: (BuildContext context, int index) => Divider(),
          itemCount: 30
    ),
      );
  }
}
