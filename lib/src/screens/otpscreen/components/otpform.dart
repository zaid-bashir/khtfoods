import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:khtfoods/src/pages/albumsec.dart';
import 'package:khtfoods/src/pages/order_page.dart';
import 'package:http/http.dart' as http;

class OTPForm extends StatefulWidget {
  final String phone;
  final String countryCode;

  OTPForm({this.countryCode, this.phone});

  @override
  _OTPFormState createState() => _OTPFormState();
}

class _OTPFormState extends State<OTPForm> {
  String pin1;
  String pin2;
  String pin3;
  String pin4;
  String pin5;
  String pin6;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  FocusNode pin2FocusNode;
  FocusNode pin3FocusNode;
  FocusNode pin4FocusNode;
  FocusNode pin5FocusNode;
  FocusNode pin6FocusNode;

  @override
  void initState() {
    super.initState();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
    pin5FocusNode = FocusNode();
    pin6FocusNode = FocusNode();
  }

  @override
  void dispose() {
    pin2FocusNode.dispose();
    pin3FocusNode.dispose();
    pin4FocusNode.dispose();
    pin5FocusNode.dispose();
    pin6FocusNode.dispose();
    super.dispose();
  }

  void nextField({String value, FocusNode focusNode}) {
    if (value.length == 1) {
      focusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Form(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 60,
                  height: 60,
                  child: TextFormField(
                    autofocus: true,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    obscureText: true,
                    style: TextStyle(fontSize: 24),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onChanged: (value) {
                      nextField(value: value, focusNode: pin2FocusNode);
                      pin1 = value;
                    },
                  ),
                ),
                SizedBox(
                  width: 60,
                  height: 60,
                  child: TextFormField(
                    focusNode: pin2FocusNode,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    obscureText: true,
                    style: TextStyle(fontSize: 24),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onChanged: (value) {
                      nextField(value: value, focusNode: pin3FocusNode);
                      pin2 = value;
                    },
                  ),
                ),
                SizedBox(
                  width: 60,
                  height: 60,
                  child: TextFormField(
                    focusNode: pin3FocusNode,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    obscureText: true,
                    style: TextStyle(fontSize: 24),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onChanged: (value) {
                      nextField(value: value, focusNode: pin4FocusNode);
                      pin3 = value;
                    },
                  ),
                ),
                SizedBox(
                  width: 60,
                  height: 60,
                  child: TextFormField(
                    focusNode: pin4FocusNode,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    obscureText: true,
                    style: TextStyle(fontSize: 24),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onChanged: (value) {
                      nextField(value: value, focusNode: pin5FocusNode);
                      pin4 = value;
                    },
                  ),
                ),
                SizedBox(
                  width: 60,
                  height: 60,
                  child: TextFormField(
                    focusNode: pin5FocusNode,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    obscureText: true,
                    style: TextStyle(fontSize: 24),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onChanged: (value) {
                      nextField(value: value, focusNode: pin6FocusNode);
                      pin5 = value;
                    },
                  ),
                ),
                SizedBox(
                  width: 60,
                  height: 60,
                  child: TextFormField(
                    focusNode: pin6FocusNode,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    obscureText: true,
                    style: TextStyle(fontSize: 24),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onChanged: (value) {
                      pin6FocusNode.unfocus();
                      pin6 = value;
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                print(
                    "===================================OTP Code is : $pin1$pin2$pin3$pin4$pin5$pin6=======================================");
                String genOTP = "$pin1$pin2$pin3$pin4$pin5$pin6";
                createAlbum(
                    otp: genOTP,
                    phone: widget.phone,
                    countryCode: widget.countryCode);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => OrderPage(),
                  ),
                );
              },
              child: Text("Continue"),
            ),
          ],
        ),
      ),
    );
  }

  Future<AlbumSec> createAlbum(
      {String otp, String phone, String countryCode}) async {
    final response = await http.post(
      Uri.parse('http://192.168.29.216:4040/api/v1/users/verifyOtp'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "otp": otp,
        "mobileNumber": phone,
        "countryCode": countryCode,
      }),
    );
    if (response.statusCode == 200) {
      print("===========================================");
      print("===========================================");
      print("Response Code");
      print("===========================================");
      print("===========================================");
      print(response.body);
      print("===========================================");
      print("===========================================");
      Map<String, dynamic> data = json.decode(response.body);
      data = {
        "n": 1,
        "nModified": 1,
        "ok": 1,
        "user": {
          "_id": "60dee22076840c1f6011b8d7",
          "role": "USER",
          "firstName": "Zaid",
          "lastName": "Bashir",
          "email": "tahseen@gmail.com"
        },
        "token": {
          "refresh_token":
              "\$2a\$10\$kLz/eEWxRtRZ5YFttiial.kqXfRzu8yeUTyztooDbrKauCCwjHMge",
          "expires_in": "2021-07-03T09:54:02.000Z",
          "access_token":
              "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwYXJ0bmVyTmFtZSI6InVuZGVmaW5lZCB1" +
                  "bmRlZmluZWQiLCJ1c2VySWQiOiI2MGRlZTIyMDc2ODQwYzFmNjAxMWI4ZDciLCJleHAiOjE2MjUzMDYwNDE5NTEsInJvbGUiOiJVU0VSIiwiaWF0IjoxNjI1MjE5NjQxfQ.f0I42psUcgzTnHydQua_Pdvux1xeWqRwcldMbawT5hc",
          "id_token":
              "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwYXJ0bmVyTmFtZSI6InVuZGVmaW5lZCB1bmRlZmluZWQiLCJ1c2VySWQiOiI2MGRlZTIyMDc2ODQwYzFmNjAxMWI4ZDciLCJleHAiOjE2MjUzMDYwNDE5NTEsInJvbGUiOiJVU0VSIiw" +
                  "iaWF0IjoxNjI1MjE5NjQxfQ.f0I42psUcgzTnHydQua_Pdvux1xeWqRwcldMbawT5hc",
        },
      };
      print("===========================================");
      print(data["user"]["email"]);
      print("===========================================");
      return AlbumSec.fromJson(jsonDecode(response.body));
    } else {
      print("===========================================");
      print("Error Occured ${response.statusCode}");
      print("===========================================");
      throw Exception('Failed to create album.');
    }
  }
}
