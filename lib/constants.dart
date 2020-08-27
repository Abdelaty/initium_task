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
