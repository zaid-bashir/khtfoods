import 'package:flutter/material.dart';

class CustumListile extends StatelessWidget {
  final IconData icon;
  final String text;

  CustumListile({this.icon, this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              icon,
              color: Colors.blue,
            ),
            SizedBox(
              width: 15.0,
            ),
            Text(
              "$text",
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
        Divider(
          indent: 0.0,
          height: 10.0,
          color: Colors.grey,
        ),
      ],
    );
  }
}
