import 'package:flutter/material.dart';
import 'package:initium_task/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var firstName, lastName;

  @override
  Widget build(BuildContext context) {
    getUserInfo();
    return Scaffold(
      appBar: AppBar(
        elevation: 20.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.call,
              size: 30,
              color: Colors.white,
            ),
            onPressed: () {
              // do something
            },
          )
        ],
      ),
      drawer: Drawer(
        child: Container(
          color: primaryColor,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              Container(
                height: 200.0,
                child: DrawerHeader(
                  margin: EdgeInsets.only(left: 10, top: 60),
                  child: Text(
                    'Welcome, \n $firstName $lastName',
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.white),
                  ),
                  decoration: BoxDecoration(
                    color: primaryColor,
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  'Main Screen',
                  style: TextStyle(color: Colors.white),
                ),
                leading: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Logout', style: TextStyle(color: Colors.white)),
                leading: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
                onTap: () {
                  logOutUser();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> getUserInfo() async {
    var preferences = await SharedPreferences.getInstance();
    setState(() {
      firstName = preferences.get('firstName');
      lastName = preferences.get('lastName');
    });
  }

  Future<void> logOutUser() async {
    var preferences = await SharedPreferences.getInstance();
    preferences.clear();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MyHomePage()),
    );
  }
}
//a