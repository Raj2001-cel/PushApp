import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/myroutes.dart';
import 'package:google_fonts/google_fonts.dart';



import 'home_page.dart';
import 'login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      themeMode: ThemeMode.light,

      darkTheme: ThemeData(
        brightness: Brightness.light,
          scaffoldBackgroundColor: Colors.white,
        primaryTextTheme:GoogleFonts.latoTextTheme(),
      ),
      initialRoute: MyRoutes.homePage,
      routes: {
        MyRoutes.loginPage:(context)=>Login(),
        MyRoutes.homePage:(context)=>HomePage()
      },

    );
  }
}