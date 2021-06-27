import 'package:dana/presentation/model/avatar_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class AvatarListBoxWidget extends StatelessWidget {
  List<AvatarItem> avatarItems = [];
  @override
  Widget build(BuildContext context) {
    return Container(child: ListView.builder(
      scrollDirection: Axis.horizontal,
        itemBuilder: (context,index){
      return Column(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(avatarItems[index].imgUrl),
          ),
          Text(avatarItems[index].title)
        ],
      );
    }),);
  }
}
