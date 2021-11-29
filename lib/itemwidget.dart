import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/subexercise.dart';

import 'catalog.dart';

class ItemWidget extends StatelessWidget {
  final SubExercise item;

  const ItemWidget({Key key, @required this.item})
      : assert(item != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      height: 110,
      child: Card(

        child: ListTile(
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