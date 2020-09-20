import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:initium_task/login.dart';

import 'constants.dart';
import 'network.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController firstNameController = new TextEditingController();
  TextEditingController lastNameController = new TextEditingController();
  TextEditingController mobileController = new TextEditingController();
  TextEditingController idController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController rePasswordController = new TextEditingController();
  var agreeWithTerms = false;

  void _onRememberMeChanged(bool newValue) => setState(() {
        agreeWithTerms = newValue;
        if (agreeWithTerms) {
          print('Agreed');
        } else {
          print('not Agreed');
        }
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      drawer: AppDrawer(),
      body: Stack(
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
                    ),
                  ),
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
                          topRight: Radius.circular(30.0),
                        ),
                      ),
                    ),
                    width: double.infinity,
                    height: 500.0,
                  ),
                )
              ],
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(
                  left: 14.0, right: 14.0, top: 100.0, bottom: 20.0),
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
                        'New Account Registration',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF7f7f7f),
                          fontSize: 20.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  LineRowWidget(text: 'Contact\nInformation'),
                  NewTextField(
                    hint: 'First Name',
                    obscureText: false,
                    controller: firstNameController,
                  ),
                  NewTextField(
                    hint: 'Last Name',
                    obscureText: false,
                    controller: lastNameController,
                  ),
                  NewTextField(
                    hint: 'Mobile Number',
                    obscureText: false,
                    controller: mobileController,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  LineRowWidget(text: 'Access\nInformation'),
                  NewTextField(
                    hint: 'Civil ID',
                    obscureText: false,
                    controller: idController,
                  ),
                  NewTextField(
                    hint: 'Email Address',
                    obscureText: false,
                    controller: emailController,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  NewTextField(
                    hint: 'Password',
                    obscureText: true,
                    controller: passwordController,
                  ),
                  NewTextField(
                    hint: 'Retype Password',
                    obscureText: true,
                    controller: rePasswordController,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Checkbox(
                        value: agreeWithTerms,
                        checkColor: Colors.white,
                        onChanged: _onRememberMeChanged,
                        activeColor: primaryColor,
                      ),
                      Text(
                        'I agree with ',
                        style: TextStyle(
                            letterSpacing: -0.5, color: Colors.grey[800]),
                      ),
                      Text(
                        'Terms & Conditions',
                        style: TextStyle(color: Colors.blue[500]),
                      )
                    ],
                  ),
                  RaisedButton(
                    onPressed: () {
                      validateData() ? sendData() : showAlertDialog(context);
                    },
                    child: Text(
                      'Complete Registration',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    textColor: Colors.white,
                    padding: EdgeInsets.all(12.0),
                    splashColor: primaryColor,
                    color: primaryColor,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool validateData() {
    if (firstNameController.text != null &&
        firstNameController.text.length > 2 &&
        lastNameController.text != null &&
        mobileController.text != null &&
        mobileController.text.length > 5 &&
        idController.text != null &&
        emailController.text != null &&
        emailController.text.contains('@') &&
        passwordController.text != null &&
        passwordController.text == rePasswordController.text &&
        agreeWithTerms == true) {
      return true;
    } else {
      return false;
    }
  }

  sendData() async {
    var userRegistrationData = {
      'CustomerFirstName': firstNameController.text,
      'CustomerLastName': lastNameController.text,
      'CustomerMobileNo': mobileController.text,
      'CustomerCivilID': idController.text,
      'CustomerEmail': emailController.text,
      'CustomerPassword': passwordController.text
    };
    NetworkHelper networkHelper =
        NetworkHelper(signupAPI_URL, userRegistrationData);
    var responseCode = await networkHelper.sendData();
    if (responseCode != 200) {
      showAlertDialog(context);
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    }
  }

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Something wrong!"),
      content: Text("Please check your information again."),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

class NewTextField extends StatelessWidget {
  final String hint;
  final bool obscureText;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController controller;

  NewTextField({Key key, this.hint, this.obscureText, this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.0,
      margin: EdgeInsets.only(left: 70.0, right: 70.0, top: 10),
      child: Form(
        key: _formKey,
        child: TextFormField(
          controller: controller,
          validator: (value) {
            if (value.isEmpty) {
              return 'Please Enter Some Text';
            }
            return null;
          },
          obscureText: obscureText,
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
            child: DecoratedBox(decoration: BoxDecoration(color: primaryColor)),
            height: 2.0,
            width: double.infinity,
          ),
        ),
        new Flexible(
          flex: 2,
          child: Text(
            text,
            style: TextStyle(
              color: primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        new Flexible(
          flex: 1,
          child: SizedBox(
            child: DecoratedBox(decoration: BoxDecoration(color: primaryColor)),
            height: 2.0,
            width: double.infinity,
          ),
        ),
      ],
    );
  }
}
