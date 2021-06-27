import 'package:flutter/material.dart';

class BadgeWidget extends StatelessWidget {
  final IconData icon;
  final String count;
  BadgeWidget({this.icon,this.count});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Icon(icon),
          Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              child: Center(child: Text(count,style: TextStyle(color: Colors.black),)))
        ],
      ),
    );
  }
}
