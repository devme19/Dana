import 'package:flutter/material.dart';
// ignore: must_be_immutable
class StatusWidget extends StatelessWidget {
  String status;
  Color color = Colors.green;
  String txt='';
  StatusWidget({this.status}){
    if(status != null)
    if(status == 'evaluating') {
      txt = 'در حال ارزیابی';
      color = Colors.green;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      child: Text(txt,style: TextStyle(color: color),),
    );
  }
}
