import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String email;

  @override
  Widget build(BuildContext context) {
    void validate() {
      if (formKey.currentState.validate()) {
        print(email);

        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => ForgotPassword(),
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
              "Submit",
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

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Khtfoods",
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            "Forgot Password",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: SafeArea(
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      "Enter your Email Id and we will send you the Instructions",
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Form(
                    child: Column(
                      children: [
                        _buildEmailTextField(),
                        SizedBox(
                          height: 50,
                        ),
                        _buildButton(),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
