import 'package:flutter/material.dart';

import 'elements.dart';
import 'home_page.dart';
import 'placeholder_widget.dart';
import 'register_page.dart';

class StkPushPage extends StatefulWidget{
  static String tag = 'tag-';
  @override
  _StkPushPageState createState() => new _StkPushPageState();
}

class _StkPushPageState extends State<StkPushPage>{
 bool _isLoading = false;
  final _mobile = TextEditingController();
  final _amount = TextEditingController();final double h =9.0,hh =15.0;
  int _currentIndex = 0;
  final List<Widget> _children = [


    PlaceholderWidget(Colors.white),
    PlaceholderWidget(Colors.deepPurple),
    PlaceholderWidget(Colors.green),
  ];

void onTabTapped(int index){
   setState(() {
     _currentIndex = index;
   });
 }
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
        'Push',

        style: TextStyle(fontSize: 28.0, color: Colors.white),

      ),
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
             buildTextField("Mobile",false,_mobile),
            SizedBox(height: h),
             buildTextField("Amount",true,_amount),
            SizedBox(height: hh),
              buildButtonContainerStkpush(context,setState,_isLoading,_mobile,_amount),
            SizedBox(height: hh)

          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
       // _children[_currentIndex],
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          new BottomNavigationBarItem(

            icon: IconButton(
              icon: Icon(Icons.home),
              onPressed: (){
                Navigator.pushNamed(context, '/stkpush');
              },),
            title: Text('Home'),

 ),
          new BottomNavigationBarItem(icon: IconButton(
              icon: Icon(Icons.home),
              onPressed: (){
                Navigator.pushNamed(context, '/viewlist');
              },),
            title: Text('View'),
          ),
          new BottomNavigationBarItem(
              icon: IconButton(
              icon: Icon(Icons.home),
              onPressed: (){
                Navigator.pushNamed(context, '/login');
              },),
            title: Text('Logout'),
          )
        ],
      ),

    );

  }
}





Widget buildButtonContainerStkpush(BuildContext context,setState,_isLoading,_email,_password){
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
         Navigator.pushNamed(context, '/stkpush');

        /*

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
                ApiService.addKeyUser(new_user)
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
                    text = "User Submitted";
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
                });*/


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
