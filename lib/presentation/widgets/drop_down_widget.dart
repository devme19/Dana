import 'package:flutter/material.dart';

class DropDownDemo extends StatefulWidget {
  ValueChanged<String> parentAction;
  String value;
  DropDownDemo({this.parentAction,this.value});
  @override
  _DropDownDemoState createState() => _DropDownDemoState();
}

class _DropDownDemoState extends State<DropDownDemo> {
  String _chosenValue;


  @override
  Widget build(BuildContext context) {
    if(widget.value != null)
      _chosenValue = widget.value;
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButton<String>(
        value: _chosenValue,
        //elevation: 5,
        style: TextStyle(color: Colors.black),

        items: <String>[
          'پاره وقت',
          'تمام وقت',
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        hint: Text(
          "نحوه همکاری",
          style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w600),
        ),
        onChanged: (String value) {
          setState(() {
            _chosenValue = value;
          });
        },
      ),
    );
  }
}