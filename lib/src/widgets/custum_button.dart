import 'package:flutter/material.dart';

class CustumButton extends StatelessWidget {
  final String text;
  CustumButton({this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 100,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.blue,
        ),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Center(
        child: Text(
          "$text",
          style: TextStyle(
            color: Colors.blue,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
