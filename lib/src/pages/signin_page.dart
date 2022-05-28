import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:khtfoods/src/pages/forgotPassword.dart';
import 'package:khtfoods/src/pages/order_page.dart';
import 'package:khtfoods/src/pages/signup_page.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  //Creating Global Key for managaing state of the Form
  //===================================================

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  //Creating dummy data for email and password
  //==========================================

  String usernameEmail;
  String password;

  //Password Visibility ON or OFF
  //=============================
  bool _toggleVisibility = true;

  //Validation for the Sign In Form
  //===============================

  void validate() {
    if (formKey.currentState.validate()) {
      print(usernameEmail);
      print(password);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => OrderPage(),
        ),
      );
    } else {
      print("Not Validated");
    }
  }

  Widget _buildEmailTextField() {
    return TextFormField(
      onChanged: (value) {
        setState(() {
          usernameEmail = value;
        });
      },
      decoration: InputDecoration(
        hintText: "Your Email",
        hintStyle: TextStyle(
          color: Color(0xFFBDC2CB),
          fontSize: 18.0,
        ),
        labelText: "Your Email",
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          borderSide: BorderSide(color: Colors.blue),
        ),
      ),
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value.isEmpty) {
          return "Please enter username or email";
        } else {
          return null;
        }
      },
    );
  }

  Widget _buildPasswordTextField() {
    return TextFormField(
      onChanged: (value) {
        setState(() {
          password = value;
        });
      },
      obscureText: _toggleVisibility,
      decoration: InputDecoration(
        hintText: "Your Password",
        hintStyle: TextStyle(
          color: Color(0xFFBDC2CB),
          fontSize: 18.0,
        ),
        labelText: "Password",
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          borderSide: BorderSide(color: Colors.blue),
        ),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _toggleVisibility = !_toggleVisibility;
            });
          },
          icon: _toggleVisibility
              ? Icon(Icons.visibility_off)
              : Icon(Icons.visibility),
        ),
      ),
      keyboardType: TextInputType.visiblePassword,
      validator: (value) {
        if (value.isEmpty) {
          return "Please enter Password";
        } else {
          return null;
        }
      },
    );
  }

  Widget _buildButton() {
    return GestureDetector(
      onTap: () {
        validate();
      },
      child: Container(
        height: 50.0,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          color: Colors.blueAccent,
        ),
        child: Center(
          child: Text(
            "Sign In",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w900,
              fontSize: 18.0,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * .1,
              horizontal: 8.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Sign In",
                  style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.w900),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                            iconSize: 60,
                            icon: Image.asset("assets/images/facebook.jpg"),
                            onPressed: () {}),
                        IconButton(
                            iconSize: 60,
                            icon: Image.asset("assets/images/google.png"),
                            onPressed: () {}),
                        IconButton(
                            iconSize: 60,
                            icon: Image.asset("assets/images/linkedin.png"),
                            onPressed: () {}),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Or",
                  style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.w900),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Card(
                  elevation: 5.0,
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          _buildEmailTextField(),
                          SizedBox(
                            height: 30.0,
                          ),
                          _buildPasswordTextField(),
                          SizedBox(
                            height: 30.0,
                          ),
                          _buildButton(),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(
                          color: Color(0xFFBDC2CB),
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => SignUpPage(),
                          ),
                        );
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ForgotPassword(),
                          ),
                        );
                        print("Clicked");
                      },
                      child: Text(
                        "Forgotten Password?",
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
