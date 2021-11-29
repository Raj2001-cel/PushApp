import 'package:flutter/material.dart';
import 'package:flutter_catalog/subexercise.dart';
import 'package:flutter_catalog/timerPage.dart';

import 'package:velocity_x/velocity_x.dart';

import 'catalog.dart';
import 'itemwidget.dart';

class HomeDetailPage extends StatelessWidget {
   final List<SubExercise> catalog;
   final num subExId;
   // final List<SubExercise> smallExercise;

  const HomeDetailPage({Key key, @required this.catalog,@required this.subExId})
      : assert(catalog != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {



    return Scaffold(
      // appBar: AppBar(title:Text(CatalogModel.items[subExId-1].name)),
      backgroundColor: Colors.white,
   appBar: AppBar(
      title: Text(CatalogModel.items[subExId-1].name,style: TextStyle(color: Color(0xff4d0ee2)),),
    backgroundColor: Colors.white,
    iconTheme: IconThemeData(color:Color(0xff4d0ee2)),
    elevation: 0,
    ),

      bottomNavigationBar: Container(
        color: Colors.black12.withOpacity(0.3),
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            " Timer ".text.bold.xl4.white.make(),
            ElevatedButton(
              onPressed: () => new TimerPage()
              ,
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Colors.deepPurpleAccent,
                  ),
                  shape: MaterialStateProperty.all(
                    StadiumBorder(),
                  )),
              child: "Start".text.make(),
            ).wh(100, 50)
          ],
        ).p32(),
      ),
     body: Padding(
       padding: const EdgeInsets.all(16.0),
       //all excercises of the select theme will be shown
       child: (this.catalog != null && this.catalog.length!=0)
           ? ListView.builder(
         itemCount: this.catalog.length,
         itemBuilder: (context, index) => ItemWidget(
           item:catalog[index] ,
         ),
       )
           : Center(
         child: CircularProgressIndicator(),
       ),
     ),

    );
  }
}