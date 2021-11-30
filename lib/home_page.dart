import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catalog/homepagedetails.dart';
import 'package:flutter_catalog/mydrawer.dart';
import 'package:flutter_catalog/subexercise.dart';
import 'catalog.dart';


class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogJson =
    await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["exercises"];

   // print(productsData[0]['subexercises']);

    // print(subex);
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});

   final subexJson =  await rootBundle.loadString("assets/files/subexercise.json");
   final subexercisesDecodedate = jsonDecode(subexJson);
   var subexercisesList = subexercisesDecodedate['subexercises'];
    ExerciseCatalog.subexercise = List.from(subexercisesList)
        .map<SubExercise>((item) => SubExercise.fromMap(item))
        .toList();
    setState(() {});

    print("print subexercises ${ExerciseCatalog.subexercise}");
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("PushApp",style: TextStyle(color: Color(0xff4d0ee2)),),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color:Color(0xff4d0ee2)),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
            ? GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
          ),
          itemBuilder: (context, index) {
            final item = CatalogModel.items[index];

            return Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: GridTile(
                  // header: Container(
                  //   child: Text(
                  //     item.name,
                  //     style: TextStyle(color: Colors.white),
                  //   ),
                  //   padding: const EdgeInsets.all(12),
                  //   decoration: BoxDecoration(
                  //     color: Colors.deepPurple,
                  //   ),
                  // ),
                  child: InkWell(
                    child: Image.network(
                      item.image,
                    ),
                    onTap: ()=> move( item.id,item)

    ),
                    footer: Container(
                      child: Text(
                        item.name.toString()+"  "+item.time.toString()+"min",
                        style: TextStyle(color: Colors.white),
                      ),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.black,
                      ),
                    ),


                ));
          },
          itemCount: CatalogModel.items.length,
        )
            : Center(
          child: CircularProgressIndicator(),
        ),
      ),
      drawer: MyDrawer(),
    );

  }

void move(int id, Item item) {
    num totalTime = item.time;
  int subExId = item.id;
  List<SubExercise> output = [];
  ExerciseCatalog.subexercise.forEach((element) {
    if(element.id==subExId){
      output.add(element);
    }
  });
  Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeDetailPage( catalog: output,subExId: subExId,totalTime:totalTime*60 )));

}


}