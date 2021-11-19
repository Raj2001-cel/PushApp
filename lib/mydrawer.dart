import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {

  final url  = 'https://avatars.githubusercontent.com/u/62689742?v=4';
  @override
  Widget build(BuildContext context) {
    return Drawer(

      child: Container(
        color: Color(0xfff1e7e7),
        child: ListView(
          padding: EdgeInsets.zero,

          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,

              child: UserAccountsDrawerHeader(

                margin: EdgeInsets.zero,
                accountName: Text("Raj Mourya"),
                accountEmail: Text("rajhmourya@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(url),

                ),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: Color(0xff4d0ee2),
              ),
              title: Text(
                "Home",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Color(0xff4d0ee2),
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: Color(0xff4d0ee2),
              ),
              title: Text(
                "Profile",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Color(0xff4d0ee2),
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.mail,
                color: Color(0xff4d0ee2),
              ),
              title: Text(
                "Email me",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Color(0xff4d0ee2),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


