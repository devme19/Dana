import 'package:flutter/material.dart';

class TitleBarWidget extends StatelessWidget {
  String title;
  TitleBarWidget({this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      padding: EdgeInsets.all(20),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(title,style: TextStyle(color: Colors.white,),textAlign: TextAlign.end,),
        ],
      ),
    );
  }
}
