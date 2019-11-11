
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MainFetchData extends StatefulWidget {
  @override
  _MainFetchDataState createState() => _MainFetchDataState();
}

class _MainFetchDataState extends State<MainFetchData> {
  List<Persons> _persons = List();

GlobalKey<ScaffoldState> _scaffoldKey;
TextEditingController _firstnamecon;
TextEditingController _lastnamecon;
//Employee _selectedEmployee;
bool isLoading;
String _titleProgress;


  @override
  void initState(){
    // TODO: implement build
    super.initState();
    _persons = [];
    isLoading = false;
    //_titleProgress = widget.title;
    _scaffoldKey = GlobalKey();
    _firstnamecon = TextEditingController();
    _lastnamecon = TextEditingController();

  }

  _fetchData() async {
    setState(() {
      isLoading = true;
    });
    final response =
        await http.get("http://192.168.0.27:3000/users");
    if (response.statusCode == 200) {
      _persons = (json.decode(response.body) as List)
          .map((data) => new Persons.fromJson(data))
          .toList();
      setState(() {
        isLoading = false;
      });
    } else {
      throw Exception('Failed to load Data');
    }
  }


SingleChildScrollView _dataBody(){
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: DataTable(

        columns: [
          DataColumn(label: Text('ID',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0, color: Colors.blue)),),
           DataColumn(label: Text('F.Name',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0, color: Colors.blue)),),
          DataColumn(label: Text('L.Name',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0, color: Colors.blue)),),
          DataColumn(label: Text('Phone',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0, color: Colors.blue)),)
        ],
        rows: _persons.map(
          (person) => DataRow(
          cells: [
            DataCell(Text(person.nationalid.toString(),style: TextStyle(fontWeight: FontWeight.normal,fontSize: 14.0, color: Colors.green)),
            ),
             DataCell(Text(person.firstname.toUpperCase(),style: TextStyle(fontWeight: FontWeight.normal,fontSize: 14.0, color: Colors.green)),
            ),
           DataCell(Text(person.lastname.toUpperCase(),style: TextStyle(fontWeight: FontWeight.normal,fontSize: 14.0, color: Colors.green)),            ),
            DataCell(Text(person.phone.toString(),style: TextStyle(fontWeight: FontWeight.normal,fontSize: 14.0, color: Colors.green)),            ),

          ]
          ),
          ).toList(),
      ),
    ),
  );
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("VIEW TRANSACTIONS"),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: RaisedButton(
            child: new Text("Refresh"),
            onPressed: _fetchData,
          ),
        ),
        body: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            :Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          isLoading?
          Row(children: <Widget>[
            OutlineButton(
              child: Text('UPDATE'),
              onPressed: (){
               // _updateEmployee();
              },
            ),
            OutlineButton(
              child: Text('CANCEL'),
              onPressed: (){
                setState(() {
                 isLoading = false;
                });
                //_clearValues();
              },
            )
          ],
          ):Container(),
   Expanded(
     child:    _dataBody(),
   ),
        ],
      ),
    ),
                );
  }
}

class Persons {
final String nationalid;
final String firstname;
final String lastname;
final String phone;
Persons._({this.nationalid, this.firstname,this.lastname, this.phone});
factory Persons.fromJson(Map<String, dynamic> json) {
    return new Persons._(
      nationalid: json['nationalid'],
      firstname: json['firstname'],
      lastname: json['lastname'],
      phone: json['phone'],
    );
  }
}