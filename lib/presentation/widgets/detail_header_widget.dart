import 'package:dana/presentation/widgets/status_widget.dart';
import 'package:flutter/material.dart';

import '../helper.dart';
class DetailHeaderWidget extends StatelessWidget {
  final String photo;
  final String name;
  final String family;
  final String title;
  final String status;
  final String dte;


  DetailHeaderWidget({this.photo, this.name, this.family,this.title, this.dte,this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: Row(
        children: [
          Container(
              width: 80,
              height: 80,
              decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  image: new DecorationImage(
                      fit: BoxFit.cover,
                      image: new NetworkImage(photo)
                  )
              )),

          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(name +' '+ family,style: TextStyle(fontWeight: FontWeight.bold),),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(title),
                              ),
                            ],
                          ),


                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    status != null?StatusWidget(status: status,):Container(),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(date(dte)),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
