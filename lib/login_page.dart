import 'dart:convert';

import 'package:flutter/material.dart';

import 'api_service.dart';
import 'elements.dart';
import 'home_page.dart';
import 'register_page.dart';
import 'stkpush_page .dart';

class LoginPage extends StatefulWidget{
  static String tag = 'tag-';
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{
 bool _isLoading = false;
  final _email = TextEditingController();
  final _password = TextEditingController();final double h =9.0,hh =15.0;
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
          //Navigator.of(context).pushNamed(StkPushPage.tag);
           Navigator.pushNamed(context, '/stkpush');
      },
      color: Colors.lightBlueAccent,
      child: Text('Login', style: TextStyle(color: Colors.white),),
    ),
  ),
);
final registerButton = Padding(
  padding: EdgeInsets.symmetric(vertical: 16.0),
  child: Material(
    borderRadius: BorderRadius.circular(30.0),
    shadowColor: Colors.lightBlueAccent.shade100,
    elevation: 5.0,
    child: MaterialButton(
      minWidth: 200.0,
      height: 42.0,
      onPressed:  () {
          //Navigator.of(context).pushNamed(RegisterPage.tag);
           Navigator.pushNamed(context, '/register');
      },
      color: Colors.lightBlueAccent,
      child: Text('Register', style: TextStyle(color: Colors.white),),
    ),
  ),
);


final forgotLabel = FlatButton(
  child: Text(
    'Forgot Password?',
    style: TextStyle( color: Colors.black54),
  ),
  onPressed: () {

         //Navigator.of(context).pushNamed(ForgotPasswordPage.tag);
          Navigator.pushNamed(context, '/forgotpassword');

  },
);
final welcome = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Login',
        style: TextStyle(fontSize: 28.0, color: Colors.white),

      ),
    );

final haveAccountLabel = FlatButton(
  child: Text(
    'Register',
    style: TextStyle( color: Colors.blue),
  ),
  onPressed: () {
          Navigator.pushNamed(context, '/register');
  },
);

    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            welcome,
            SizedBox(height: hh),
             buildTextField("Email",false,_email),
            SizedBox(height: h),
             buildTextField("Password",true,_password),
            SizedBox(height: hh),
              buildButtonContainerLogin(context,setState,_isLoading,_email,_password),
            SizedBox(height: hh),
            forgotLabel,
            SizedBox(height: 24.0),
            haveAccountLabel
          ],
        ),
      ),
    );

  }
}


Widget buildButtonContainerLogin(context,setState,_isLoading,_email,_password){
  return Container(
    height: 56.0,
   //MainAxisAlignment:MainAcisalignment.center,
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(23.0),
      gradient: LinearGradient(
        colors: [
          Color(0xFFFB415b),
          Color(0xFFE5623),
        ],
        begin: Alignment.centerRight,
        end: Alignment.centerLeft
        )
    )
    ,child: GestureDetector(
      onTap: () {
        // Navigator.of(context).pushNamed(StkPushPage.tag);


                if(_email.text.isEmpty ||
                 _password.text.isEmpty){
                  showDialog(
                    builder: (context) => AlertDialog(
                      title: Text('Failure'),
                      content: Text('Fill in All Needed values'),
                      actions: <Widget>[ FlatButton(
                        onPressed: () { Navigator.pop(context);},
                        child: Text('Ok'),
                      )],
                    ),
                    context: context
                  );
                  return;
                }

                  final new_user = {
                  'email': _email.text,
                  'password':_password.text
                };


final us =json.encode(new_user);
                setState(() {
                 _isLoading = true;
                 print('loading $_isLoading');
                });
                ApiService.userLogin(new_user)
                .then((success){
                   setState(() {
                 _isLoading = false;
                });
print('success entry $success');
final us =json.encode(new_user);
print('new member $us');
                  String title, text;
                  if(success){
                    title = "Success";
                    text = "Identification Successful";
                         Navigator.pushNamed(context, '/stkpush');
                  }
                  else {
                    title = "Error x";
                    text = "Error Submitting";
                  }
                   showDialog(
                    builder: (context) => AlertDialog(
                      title: Text(title),
                      content: Text(text),
                      actions: <Widget>[ FlatButton(
                        onPressed: () {
                          //Navigator.of(context).pushNamed(LoginPage.tag);
                          Navigator.pop(context);

                          },
                        child: Text('Ok'),
                      )],
                    ),
                    context: context
                  );
                });


      },//end tap here
      child: Text(
        "Submit",
           textAlign:TextAlign.center,
            overflow: TextOverflow.ellipsis,
        //textDirection: TextDirection.rtl,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18.0,
        ),
      ),
    ),

  );
}
