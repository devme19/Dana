import 'package:flutter/material.dart';
class UserLevelWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      Container(
        color: Colors.white,
        child: Column(children: [
        Row(
          // mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('سطح کاربر',style: TextStyle(fontWeight: FontWeight.bold),),
            ),
          ],
        ),
        // Padding(
        //   padding: const EdgeInsets.only(bottom: 8.0),
        //   child: Divider(color: Colors.grey,),
        // )
    ],),
      );
  }
}
