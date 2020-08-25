import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: <Widget>[
          Container(
            color: Color(0xFFf35829),
            child: Column(
              children: <Widget>[
                AppBar(
                  elevation: 20.0,
                  leading: IconButton(
                    icon: Icon(
                      Icons.menu,
                      size: 30,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      // do something
                    },
                  ),
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
                    color: Color(0xFFf35829),
                  )),
                  width: double.infinity,
                  height: 100.0,
                ),
                SizedBox(
                  child: const DecoratedBox(
                      decoration: const BoxDecoration(
                          color: Color(0xFFe7e6e6),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30.0),
                              topRight: Radius.circular(30.0)))),
                  width: double.infinity,
                  height: 500.0,
                )
              ],
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(
                  left: 14.0, right: 14.0, top: 100.0, bottom: 120.0),
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  border: Border.all(color: Colors.white, width: 4.0)),
              child: Column(
                children: <Widget>[
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Text(
                        'Login to your account',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF7f7f7f),
                          fontSize: 20.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  NewTextField(hint: 'Email Address'),
                  NewTextField(hint: 'Password'),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Switch(
                        value: isSwitched,
                        onChanged: (value) {
                          setState(() {
                            isSwitched = true;
                            saveLoginCredentials();
                          });
                        },
                        activeColor: Color(0xFFf35829),
                      ),
                      Text(
                          'I would like to save my login \n credentials to this device')
                    ],
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  FlatButton(
                    onPressed: () {},
                    child: Text(
                      'Did you forgot your password?',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.blue[500]),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(6.0),
                    child: RaisedButton(
                      onPressed: () {},
                      child: Text(
                        '                   Login                   ',
                        style: TextStyle(fontSize: 20.0),
                      ),
                      textColor: Colors.white,
                      padding: EdgeInsets.all(12.0),
                      splashColor: Color(0xFFf35829),
                      color: Color(0xFFf35829),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Don’t have an account yet? ',
                        style: TextStyle(
                            letterSpacing: -0.5, color: Colors.grey[800]),
                      ),
                      FlatButton(
                        onPressed: () {},
                        child: Text(
                          'Register Now',
                          style: TextStyle(color: Colors.blue[500]),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(bottom: 50.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Don’t have an account yet? ',
                    style:
                        TextStyle(letterSpacing: -0.5, color: Colors.grey[800]),
                  ),
                  FlatButton(
                    onPressed: () {},
                    child: Text(
                      'Register Now',
                      style: TextStyle(color: Colors.blue[500]),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  saveLoginCredentials() {}
}

class NewTextField extends StatelessWidget {
  final String hint;

  NewTextField({
    Key key,
    this.hint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.0,
      margin: EdgeInsets.only(left: 70.0, right: 70.0, top: 10),
      child: TextField(
        textAlignVertical: TextAlignVertical(y: 1.0),
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 14.0),
        maxLines: 1,
        decoration: new InputDecoration(
            border: new OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                const Radius.circular(10.0),
              ),
            ),
            filled: true,
            hintStyle: new TextStyle(color: Colors.grey[600]),
            hintText: hint,
            fillColor: Color(0xFFe7e6e6)),
      ),
    );
  }
}

class LineRowWidget extends StatelessWidget {
  final String text;

  LineRowWidget({
    Key key,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        new Flexible(
          flex: 1,
          child: SizedBox(
            child: DecoratedBox(
                decoration: BoxDecoration(color: Color(0xFFf35829))),
            height: 2.0,
            width: double.infinity,
          ),
        ),
        new Flexible(
          flex: 2,
          child: Text(
            text,
            style: TextStyle(
              color: Color(0xFFf35829),
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        new Flexible(
          flex: 1,
          child: SizedBox(
            child: DecoratedBox(
                decoration: BoxDecoration(color: Color(0xFFf35829))),
            height: 2.0,
            width: double.infinity,
          ),
        ),
      ],
    );
  }
}
