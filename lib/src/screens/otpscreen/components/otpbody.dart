import 'package:flutter/material.dart';
import 'package:khtfoods/src/screens/otpscreen/components/otpform.dart';
class OTPBody extends StatefulWidget {
  final String phone;
  final String countryCode;
  OTPBody({this.phone,this.countryCode});
  @override
  _OTPBodyState createState() => _OTPBodyState();
}

class _OTPBodyState extends State<OTPBody> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: Column(
          children: [
            Text(
              "OTP Verification",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
            ),
            Text("We sent your code to ${widget.countryCode} ${widget.phone}"),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("This code will expired in "),
                TweenAnimationBuilder(
                  tween: Tween(begin: 60.0, end: 0),
                  duration: Duration(seconds: 60),
                  builder: (context, value, child) {
                    return Text(
                      "00:${value.toInt()}",
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.w900),
                    );
                  },
                  onEnd: () {},
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            OTPForm(phone: widget.phone,countryCode: widget.countryCode,),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {},
              child: Text(
                "Resend OTP Code",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
