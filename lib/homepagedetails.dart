import 'package:flutter/material.dart';
import 'package:flutter_catalog/subexercise.dart';
import 'package:flutter_catalog/timerPage.dart';

import 'package:velocity_x/velocity_x.dart';

import 'catalog.dart';
import 'itemwidget.dart';
class HomeDetailPage extends StatefulWidget {
  final List<SubExercise> catalog;
  final num subExId;
  final num totalTime;

  const HomeDetailPage({Key key, this.catalog, this.subExId,this.totalTime}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return  DetailPage(catalog: catalog, subExId: subExId,totalTime: totalTime);
  }


}

class DetailPage extends State<HomeDetailPage> {
   final List<SubExercise> catalog;
   final num subExId;
   bool isTimerOn = false;
   num totalTime;
   // final List<SubExercise> smallExercise;

   DetailPage({Key key, @required this.catalog,@required this.subExId,this.totalTime})
      : assert(catalog != null);

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
          alignment: MainAxisAlignment.center,
          buttonPadding: EdgeInsets.zero,
          children: [
        ElevatedButton(

        onPressed: () => {

      }
        ,
        style: ButtonStyle(


            shape: MaterialStateProperty.all(
              StadiumBorder(),
            )),
        child: FlutterStopWatch(totalTime),
      ).wh(180, 100)

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
           item:catalog[index],
         ),
       )
           : Center(
         child: CircularProgressIndicator(),
       ),
     ),

    );
  }
}