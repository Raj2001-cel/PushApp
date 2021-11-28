import 'package:flutter/material.dart';

import 'authservice.dart';
import 'myroutes.dart';


class Register extends StatefulWidget {

   @override
  _RegisterPageState createState() => _RegisterPageState();

}

class _RegisterPageState extends State<Register>{
  String email = "";
  String password = "";
  bool changeButton = false;
  String error = "";
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();


  moveToHome(BuildContext context) async {
    if(_formKey.currentState.validate()){
      setState(() {
        changeButton = true;
      });
      dynamic result = await _auth.registerWithEmailAndPassword(email, password);
      if(result == null) {
        setState(() {
          error = 'Please supply a valid email';
        });
      }
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.loginPage);
      setState(() {
        changeButton = false;
      });
    }


  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
              "welcome $email 👋" ,
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
                          email = value;
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
                      setState(() {
                        password = value;
                      });
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
                          "Register",
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



