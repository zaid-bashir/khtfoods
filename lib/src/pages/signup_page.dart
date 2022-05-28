import 'dart:convert';
import 'dart:ui';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:khtfoods/src/pages/album.dart';
import 'package:khtfoods/src/pages/signin_page.dart';
import 'package:khtfoods/src/screens/otpscreen/otpscreen.dart';

class SignUpPage extends StatefulWidget {
  @override
  SignUpPageState createState() => SignUpPageState();
}

class SignUpPageState extends State<SignUpPage> {
  //Global Key for SignUp Form
  //==========================

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  //For Dummy Registration Test
  //===========================
  String firstName = "Tahseen";
  String lastName = "Abass";
  String phone;
  String email;
  String password;
  String role = "USER";
  String selectedCountryCode;

  List<String> selectedCountryCodes = ['+91'];

  //Password Visibility ON or OFF
  //=============================

  bool _toggleVisibility = true;

  //Custum Function to Validate Forms
  //=================================

  void validate() {
    if (formKey.currentState.validate()) {
      createAlbum(
          email: email,
          password: password,
          phone: phone,
          countryCode: selectedCountryCode,
          firstName: firstName,
          lastName: lastName,
          role: role);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => OtpScreen(phone: phone,countryCode: selectedCountryCode,),
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
          email = value;
        });
      },
      decoration: InputDecoration(
        hintText: "Your Email Address",
        hintStyle: TextStyle(
          color: Color(0xFFBDC2CB),
          fontSize: 18.0,
        ),
        labelText: "Email Address",
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          borderSide: BorderSide(color: Colors.blue),
        ),
      ),
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value.isEmpty) {
          return "Please enter email address";
        } else {
          return null;
        }
      },
    );
  }

  Widget _buildPhoneTextField() {
    var countryDropDown = Container(
      decoration: new BoxDecoration(
        color: Colors.white,
        border: Border(
          right: BorderSide(
            color: Color(0xFFBDC2CB),
          ),
        ),
      ),
      height: 45.0,
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButton(
            value: selectedCountryCode,
            items: selectedCountryCodes.map((String value) {
              return new DropdownMenuItem<String>(
                  value: value,
                  child: new Text(
                    value,
                    style: TextStyle(fontSize: 16.0),
                  ));
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedCountryCode = value;
              });
            },
          ),
        ),
      ),
    );
    return TextFormField(
      onChanged: (value) {
        setState(() {
          phone = value;
        });
      },
      validator: (value) {
        if (value.isEmpty) {
          return "Please enter phone number";
        } else {
          return null;
        }
      },
      keyboardType: TextInputType.number,
      decoration: new InputDecoration(
        contentPadding: const EdgeInsets.all(12.0),
        prefixIcon: countryDropDown,
        hintStyle: TextStyle(
          color: Color(0xFFBDC2CB),
          fontSize: 18.0,
        ),
        hintText: 'Phone Number',
        labelText: "Phone Number",
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          borderSide: BorderSide(color: Colors.blue),
        ),
      ),
    );
  }

  Widget _buildPasswordTextField() {
    return TextFormField(
      onChanged: (value) {
        password = value;
      },
      obscureText: _toggleVisibility,
      decoration: InputDecoration(
        hintText: "Your Password",
        labelText: "Password",
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          borderSide: BorderSide(color: Colors.blue),
        ),
        hintStyle: TextStyle(
          color: Color(0xFFBDC2CB),
          fontSize: 18.0,
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
            "Sign Up",
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
              vertical: 20,
              horizontal: 8.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.w900),
                ),
                SizedBox(
                  height: 10.0,
                ),
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
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  "Or",
                  style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.w900),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Card(
                  elevation: 5.0,
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 30.0,
                          ),
                          _buildPhoneTextField(),
                          SizedBox(
                            height: 30.0,
                          ),
                          _buildEmailTextField(),
                          SizedBox(
                            height: 30.0,
                          ),
                          _buildPasswordTextField(),
                          SizedBox(
                            height: 30.0,
                          ),
                          _buildButton(),
                          SizedBox(
                            height: 30.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
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
                            builder: (context) => SignInPage(),
                          ),
                        );
                      },
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold),
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

  Future<Album> createAlbum(
      {String firstName,
      String lastName,
      String email,
      String password,
      String phone,
      String role,
      String countryCode}) async {
    final response = await http.post(
      Uri.parse('http://192.168.29.216:4040/api/v1/users'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "firstName": "Zaid",
        "lastName": "Bashir",
        "email": email,
        "password": password,
        "phone": phone,
        "role": "USER",
        "countryCode": selectedCountryCode,
      }),
    );
    if (response.statusCode == 200) {
      print("===========================================");
      print("Response Code");
      print("===========================================");
      return Album.fromJson(jsonDecode(response.body));
    } else {
      print("===========================================");
      print("Error Occured ${jsonDecode(response.body)}");
      print("===========================================");
      return null;
      // throw Exception('Failed to create album.');
    }
  }
}
