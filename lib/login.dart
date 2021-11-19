import 'package:flutter/material.dart';
import 'package:flutter_catalog/myroutes.dart';


class Login extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class  _LoginPageState extends State<Login> {
  String name = "";
  bool changeButton = false;

  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
      if(_formKey.currentState.validate()){
        setState(() {
          changeButton = true;
        });
        await Future.delayed(Duration(seconds: 1));
        await Navigator.pushNamed(context, MyRoutes.homePage);
        setState(() {
          changeButton = false;
        });
      }


  }


  @override
  Widget build(BuildContext context) {
    return Material(

      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Image.asset(
              "assets/images/login.png",
              height: 250,
              width: 400,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "welcome $name 👋" ,
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
              child: Column(
                children: [
                  TextFormField(
                      decoration: InputDecoration(
                        hintText: "demo@gmail.com",
                        labelText: "Username",
                      ),
                      onChanged: (value){
                        setState(() {
                          name = value;
                        });
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Username cannot be empty";
                        }
                        return null;
                      }
                  ),
                  SizedBox(height: 5,),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Enter password",
                      labelText: "Password",
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Password cannot be empty";
                      } else if (value.length < 1) {
                        return "Password length should be atleast 1";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 40.0,
                  )
                  ,
                  Material(
                    color: Color(0xff660478),
                    borderRadius:
                    BorderRadius.circular(8),

                    child: InkWell(
                      onTap: () => moveToHome(context),
                      child: AnimatedContainer(
                        duration: Duration(seconds: 1),
                        width: changeButton ? 50 : 150,
                        height: 50,
                        alignment: Alignment.center,
                        child: changeButton?Icon(
                          Icons.done,
                          color: Colors.white,
                        )
                            : Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),

                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
