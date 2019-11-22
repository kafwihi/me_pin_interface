import 'package:flutter/material.dart';
import 'package:me_pin_interface/add_business.dart';
import 'package:me_pin_interface/stkpush_page%20.dart';
import 'forgotPassword_page .dart';
import 'home_page.dart';
import 'list.dart';
import 'login_page.dart';
import 'register_page.dart';
void main() => runApp(new MyApp());

final routes = <String, WidgetBuilder> {
  /*LoginPage.tag: (context) => LoginPage(),
  HomePage.tag: (context) => HomePage(),
  StkPushPage.tag: (context) => StkPushPage(),
  RegisterPage.tag: (context) => RegisterPage(),*/
  //ForgotPasswordPage.tag: (context) => ForgotPasswordPage(),
   '/login':(BuildContext context) => new LoginPage(),
    '/stkpush':(BuildContext context) => new StkPushPage(),
    '/register':(BuildContext context) => new RegisterPage(),
    '/forgotpassword':(BuildContext context) => new ForgotPasswordPage(),
    '/viewlist':(BuildContext context) => new MainFetchData(),
    '/business':(BuildContext context) => new BusinessPage()

};
class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context){
return MaterialApp(
  title: 'Thank U God',
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
    primarySwatch: Colors.lightBlue,
    fontFamily: 'Montserrat'
  ),
  home: LoginPage(),
  routes: routes,
);
  }

}
