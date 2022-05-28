import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Khfoods",
      home: Scaffold(
        body: SafeArea(
          child: Container(
            child: Center(
              child: Text(
                "Notifications Goes Here",
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
