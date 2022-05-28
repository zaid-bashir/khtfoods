import 'package:flutter/material.dart';

import 'package:khtfoods/src/widgets/explored_food.dart';

class FavoritePage extends StatefulWidget {
  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "All Food Items",
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ExploredFood(),
                    SizedBox(
                      height: 20,
                    ),
                    ExploredFood(),
                    SizedBox(
                      height: 20,
                    ),
                    ExploredFood(),
                    SizedBox(
                      height: 20,
                    ),
                    ExploredFood(),
                    SizedBox(
                      height: 20,
                    ),
                    ExploredFood(),
                    SizedBox(
                      height: 20,
                    ),
                    ExploredFood(),
                    SizedBox(
                      height: 20,
                    ),
                    ExploredFood(),
                    SizedBox(
                      height: 20,
                    ),
                    ExploredFood(),
                    SizedBox(
                      height: 20,
                    ),
                    ExploredFood(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
