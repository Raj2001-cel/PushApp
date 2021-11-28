import 'dart:convert';

import 'package:flutter_catalog/subexercise.dart';

class CatalogModel {
  static List<Item> items;

}

class Item {
  int id;
   String name;
   String desc;
  num time;
   String color;
   String image;
   List<SubExercise> subexercise;

void setSubExercises(List<SubExercise> s){
  this.subexercise =s;
}

  Item({
    this.id,
    this.name,
    this.desc,
    this.time,
    this.color,
    this.image, this.subexercise,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'name': this.name,
      'desc': this.desc,
      'time': this.time,
      'color': this.color,
      'image': this.image,
      'subexercise':this.subexercise
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id'] as int,
      name: map['name'] as String,
      desc: map['desc'] as String,
      time: map['time'] as num,
      color: map['color'] as String,
      image: map['image'] as String,
      subexercise:map['subexercise'] as List<SubExercise>,
    );
  }
}