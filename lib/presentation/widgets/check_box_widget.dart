import 'package:flutter/material.dart';

class CheckBoxWidget extends StatefulWidget {
  ValueChanged<bool> result;
  String title;
  bool checkValue;
  CheckBoxWidget({this.result,this.checkValue,this.title});
  @override
  _CheckBoxWidgetState createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:
      Row(children: [
        Text(widget.title),
        Checkbox(
          value: widget.checkValue,
          onChanged: (bool value) {
            setState(() {
              widget.checkValue = value;
              widget.result(true);
            });
          },
        ),
      ],),
    );
  }
}
