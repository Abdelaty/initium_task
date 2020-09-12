import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:initium_task/cell.dart';
import 'package:initium_task/intro.dart';
import 'package:initium_task/login.dart';
import 'package:initium_task/signup.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constants.dart';
import 'network.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task',
      theme: ThemeData(
        primaryColor: primaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Task'),
    );
  }
}

Future<void> checkIfLogged(BuildContext context) async {
  var preferences = await SharedPreferences.getInstance();
  if (preferences.get('isLogged') == true) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MainScreen()),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var responseList;

  @override
  Widget build(BuildContext context) {
    getOrganizationsData();

    checkIfLogged(context);
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            color: primaryColor,
            child: Column(
              children: <Widget>[
                AppBar(
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
                SizedBox(
                  child: const DecoratedBox(
                      decoration: const BoxDecoration(
                    color: primaryColor,
                  )),
                  width: double.infinity,
                  height: 100.0,
                ),
                Expanded(
                  child: SizedBox(
                    child: const DecoratedBox(
                        decoration: const BoxDecoration(
                            color: Color(0xFFe7e6e6),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30.0),
                                topRight: Radius.circular(30.0)))),
                    width: double.infinity,
                  ),
                )
              ],
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(
                  left: 14.0, right: 14.0, top: 100.0, bottom: 130.0),
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  color: Color(0xFF404040),
                  shape: BoxShape.rectangle,
                  border: Border.all(color: Colors.white, width: 4.0)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Text(
                        'You can book an appointment to any of the following entities',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        'Select entity to continue',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 26.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  FutureBuilder(
                    future: getOrganizationsData(),
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: Container(
                            color: Color(0xFF404040),
                            margin: EdgeInsets.only(top: 100.0),
                            child: Text(
                              'Please wait its loading...',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        );
                      } else {
                        return GridView.count(
                          mainAxisSpacing: 0,
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          crossAxisCount: 2,
                          childAspectRatio: 1.3,
                          children: setOrganizationList(),
                        );
                      }
                    },
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  child: Text(
                    'Login to your account',
                    style:
                        TextStyle(fontSize: 24.0, fontWeight: FontWeight.w400),
                  ),
                  textColor: Colors.white,
                  padding: EdgeInsets.all(12.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0)),
                  splashColor: primaryColor,
                  color: primaryColor,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Don’t have an account yet?',
                      style:
                          TextStyle(fontSize: 18.0, color: Color(0xFF7f7f7f)),
                    ),
                    FlatButton(
                      padding: EdgeInsets.all(-5.0),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignupScreen()),
                        );
                      },
                      child: Text(
                        'Register Now!',
                        style:
                            TextStyle(fontSize: 18.0, color: Color(0xFF00b0f0)),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
      drawer: AppDrawer(),
    );
  }

  Future<void> getOrganizationsData() async {
    NetworkHelper networkHelper = NetworkHelper(getOrganizationAPI_URL, null);
    responseList = await networkHelper.getOrganizationsData();
  }

  List<Widget> setOrganizationList() {
    List<Widget> widgetsList = [];
    for (int i = 0; i < 3; i++) {
      widgetsList.add(Cell(
        title: responseList[i].title,
        thumbnailUrl: responseList[i].thumbnailUrl,
      ));
    }
    if (responseList.length > 3) {
      widgetsList.add(Cell(
        title: 'Other',
        thumbnailUrl: encodedOtherImage,
        clicker: openSecondScreen(),
      ));
    }
    return widgetsList;
  }

  openSecondScreen() {
    print('hello');
  }
}
