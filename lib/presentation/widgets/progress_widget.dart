import 'package:flutter/material.dart';
class ProgressWidget extends StatelessWidget {
  Color startColor;
  Color endColor;
  ProgressWidget({this.startColor,this.endColor});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
          gradient: LinearGradient(
            colors: [startColor,endColor],
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
          )
      ),
    );
  }
}
