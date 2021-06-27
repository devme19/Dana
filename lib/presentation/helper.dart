import 'package:flutter/cupertino.dart';

String date(String dte){
  DateTime now = DateTime.now();
  DateTime pDate = DateTime.parse(dte);
  int difference = now.difference(pDate).inDays;
  int month = difference ~/ 30;
  int year = difference ~/ 365;
  String result='';
  if(year >0)
    result = year.toString() + ' سال';
  if(month>0)
    result+=month.toString() + ' ماه ';
  if(difference % 30 > 0)
    result+=(difference % 30).toString() + ' روز';
  result += ' پیش';
  if(difference == 0)
    result = 'امروز';
  else if(difference == 1)
    result = 'دیروز';
  return result;


}
