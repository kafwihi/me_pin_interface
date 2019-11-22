import 'package:flutter/material.dart';

import 'elements.dart';
import 'home_page.dart';
import 'login_page.dart';

class BusinessPage extends StatefulWidget{
  static String tag = 'tag-';
  @override
  _BusinessPageState createState() => new _BusinessPageState();
}

class _BusinessPageState extends State<BusinessPage>{

  bool _isLoading = false;
  final _shortcode = TextEditingController();
  final _email = TextEditingController();
  final _business_name= TextEditingController();
  final _business_location= TextEditingController();final double h =9.0,hh =15.0;
  @override
  Widget build(BuildContext context){
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.blueAccent,
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
        'Save Data',
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
             buildTextField("Shortcode",false,_shortcode),
            SizedBox(height: h),
             buildTextField("Email",false,_email),
            SizedBox(height: h),
             buildTextField("Business Name",true,_business_name),
             SizedBox(height: h),
             buildTextField("Business Location",true,_business_location),
            SizedBox(height: hh),
              buildButtonContainerBuz(context,setState,_isLoading, _shortcode,_email,_business_name,_business_location),
            SizedBox(height: hh),
            forgotLabel
          ],
        ),
      ),

    );

  }
}