import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:me_pin_interface/stkpush_page%20.dart';

import 'api_service.dart';

    Widget buildTextField(String hintText,boolean,_titleController,){
      return TextField(
        controller: _titleController,
        obscureText: boolean,
        decoration:  InputDecoration(
           contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.black45,
            fontSize: 18.0,
            height: 2.0,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),

        ),

      );
    }



Widget buildButtonContainer(BuildContext context,setState,_isLoading,_nationalid,_firstname,_lastname,_mobile,_email,_password){
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

                if(_firstname.text.isEmpty ||_lastname.text.isEmpty ||_mobile.text.isEmpty ||
                _email.text.isEmpty ||_nationalid.text.isEmpty ||
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
                 'nationalid': _nationalid.text,
                  'firstname': _firstname.text,
                  'lastname':_lastname.text,
                 'phone': _mobile.text,
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
