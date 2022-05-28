import 'package:flutter/material.dart';

import 'components/otpbody.dart';

class OtpScreen extends StatelessWidget {
  final String countryCode;
  final String phone;
  OtpScreen({this.countryCode,this.phone});
  @override
  Widget build(BuildContext context) {
    print("========================================OTP Screen Logs==============================================");
    print("========================================$phone=======================================================");
    print("========================================$countryCode=================================================");

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          "OTP Verification",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView(
        children: [
          OTPBody(phone: phone,countryCode: countryCode,),
        ],
      ),
    );
  }
}
