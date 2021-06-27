import 'package:flutter/material.dart';
class UserCommentWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          body: TabBarView(
            children: [
              Icon(Icons.directions_car),
              Icon(Icons.directions_transit),
            ],
          ),
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(text: 'دیدگاه کاربران',),
                Tab(text: 'به کارگیری دانش',),
              ],

            ),

          ),
        ),
      ),
    );
  }
}
