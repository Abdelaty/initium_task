import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:initium_task/main.dart';
import 'package:initium_task/signup.dart';

import 'login.dart';
const signupAPI_URL =
    'https://prod-94.westeurope.logic.azure.com/workflows/2b388c189a8042d8a8011dea9a4dffc2/triggers/manual/paths/invoke?api-version=2016-06-01&sp=%2Ftriggers%2Fmanual%2Frun&sv=1.0&sig=uoLTJf5Pf_LO8pZdhQvebsJ_FFMP9wMd0wNRjjCnY3U';
const loginAPI_URL =
    'https://prod-80.westeurope.logic.azure.com/workflows/0d82783b372144f39d80734118867ced/triggers/manual/paths/invoke?api-version=2016-06-01&sp=%2Ftriggers%2Fmanual%2Frun&sv=1.0&sig=ncxT3y2VEzCw0b7xKIz75oINuFmNrlaeohK7SIYaORs';
const primaryColor = Color(0xFFf35829);
const getOrganizationAPI_URL =
    'https://prod-40.westeurope.logic.azure.com/workflows/454307d87b9a401d9908ebc9ffe0cccb/triggers/manual/paths/invoke?api-version=2016-06-01&sp=%2Ftriggers%2Fmanual%2Frun&sv=1.0&sig=kVqO2Ou8fCAbdg634i3eh2Sg6xXrD1Uj8brhuNrZD-g';
const encodedOtherImage =
    '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';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: primaryColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: 200.0,
              child: DrawerHeader(
                margin: EdgeInsets.only(left: 10, top: 60),
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
//                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage()),
                );
              },
            ),
            ListTile(
              title: Text('Login to my account',
                  style: TextStyle(color: Colors.white)),
              leading: Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
            ),
            ListTile(
              title: Text('Register', style: TextStyle(color: Colors.white)),
              leading: Icon(
                Icons.assignment_ind,
                color: Colors.white,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignupScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
