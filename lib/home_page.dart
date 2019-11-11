import 'package:flutter/material.dart';
import 'login_page.dart';
class HomePage extends StatelessWidget{
  static String tag = 'home-page';

  @override
  Widget build(BuildContext context){

    final alucard = Hero(
      tag: 'hero',
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: CircleAvatar(
          radius: 72.0,
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage('assets/facebook.png'),
        ),
      ),
    );

    final welcome = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Welcome Lynaa',
        style: TextStyle(fontSize: 28.0, color: Colors.white),

      ),
    );

     final lorem = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'There is light in the darkness',
        style: TextStyle(fontSize: 16.0, color: Colors.white),

      ),

    );

     final body = Container(
       width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        gradient:
        LinearGradient(colors:
         [Colors.blue,
         Colors.lightBlueAccent])
      ),
      child: Column(children: <Widget>[
        alucard,welcome,lorem
      ],),
    );

    return Scaffold(body: body,);
  }
}