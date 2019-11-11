import 'package:flutter/material.dart';

import 'elements.dart';
import 'home_page.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget{
  static String tag = 'tag-';
  @override
  _RegisterPageState createState() => new _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>{

  bool _isLoading = false;
  final _firstname = TextEditingController();
  final _lastname = TextEditingController();
  final _nationalid= TextEditingController();
  final _mobile= TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();final double h =9.0,hh =15.0;
  @override
  Widget build(BuildContext context){
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('assets/facebook.png'),
      ),
    );

    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      initialValue: 'kafwihi@gmail.com',
      decoration: InputDecoration(
        hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0)
        )
      ),
    );

    final password = TextFormField(
      autofocus: false,
      initialValue: 'Password',
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0)
        )
      ),
    );

final loginButton = Padding(
  padding: EdgeInsets.symmetric(vertical: 16.0),
  child: Material(
    borderRadius: BorderRadius.circular(30.0),
    shadowColor: Colors.lightBlueAccent.shade100,
    elevation: 5.0,
    child: MaterialButton(
      minWidth: 200.0,
      height: 42.0,
      onPressed:  () {
          Navigator.of(context).pushNamed(HomePage.tag);
      },
      color: Colors.lightBlueAccent,
      child: Text('Login', style: TextStyle(color: Colors.white),),
    ),
  ),
);
  final welcome = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Register',
        style: TextStyle(fontSize: 28.0, color: Colors.white),

      ),
    );

final forgotLabel = FlatButton(
  child: Text(
    'Already Have Account? Login',
    style: TextStyle( color: Colors.blue),
  ),
  onPressed: () {
         // Navigator.of(context).pushNamed(LoginPage.tag);
           Navigator.pushNamed(context, '/login');

  },
);
    return Scaffold(

      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.orangeAccent,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[

            welcome,
            SizedBox(height: h),
             buildTextField("National ID",false,_nationalid),
            SizedBox(height: h),
             buildTextField("First Name",false,_firstname),
            SizedBox(height: h),
             buildTextField("Last Name",false,_lastname),
            SizedBox(height: h),
             buildTextField("Mobile",false,_mobile),
            SizedBox(height: h),
             buildTextField("Email",false,_email),
            SizedBox(height: h),
             buildTextField("Password",true,_password),
            SizedBox(height: hh),
              buildButtonContainer(context,setState,_isLoading, _nationalid,_firstname,_lastname,_mobile,_email,_password),
            SizedBox(height: hh),
            forgotLabel
          ],
        ),
      ),

    );

  }
}