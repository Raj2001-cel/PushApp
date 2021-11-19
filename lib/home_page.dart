import 'package:flutter/material.dart';
import 'package:flutter_catalog/mydrawer.dart';

class HomePage extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PushApp",style: TextStyle(color: Color(0xff4d0ee2)),),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color:Color(0xff4d0ee2)),
        elevation: 0,
      ),
      body: Center(
        child: Container(

          child: Text("Welcome to  days of flutter by Raj Mourya "),
        ),
      ),
      drawer: MyDrawer(),
    );
  }

  
}