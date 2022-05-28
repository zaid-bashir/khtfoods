import 'package:flutter/material.dart';
import 'package:khtfoods/src/screens/main_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "KhtFoods",
      theme: ThemeData(
        primaryColor: Colors.blueAccent,
      ),
      //===============================================
      //When Dark Mode of the Mobile Phone is Turned On
      //the App will change its theme into Dark Mode
      //===============================================
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        /* dark theme settings */
      ),
      home: MainScreen(),
    );
  }
}
