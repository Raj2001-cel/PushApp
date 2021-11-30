import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/subexercise.dart';
import 'package:velocity_x/velocity_x.dart';

import 'catalog.dart';

class ItemWidget extends StatefulWidget {
  final SubExercise item;

  const ItemWidget({Key key, this.item}) : super(key: key);

  @override
  State<ItemWidget> createState() => ItemWidgetPage(this.item);

}

class ItemWidgetPage extends State<ItemWidget> {
  final SubExercise item;
  bool isLongPress = false;

  ItemWidgetPage(this.item);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      height: 110,
      child: isLongPress?Container(
        height: 400,
        width: 400,
        child: Image.network(item.image),
      ):Card(

        child: ListTile(
          onLongPress: () async =>{
            setState(()  {
              isLongPress = true;
            }),

          await Future.delayed(Duration(seconds: 2)),
            setState(() {
          isLongPress =false;
            })

            },

          minVerticalPadding: 0.5,
          onTap: () {
            print("${item.name} pressed");
          },
          leading: Image.network(item.image),
          title: Text(item.name),
          subtitle: Text("3 x12reps"),
          trailing: Text(
            "${item.time} min",
            textScaleFactor: 1.5,
            style: TextStyle(
              color: Colors.deepPurple,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}