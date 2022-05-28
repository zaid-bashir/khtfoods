import 'package:flutter/material.dart';
import 'package:khtfoods/src/models/food_model.dart';
import 'package:get/get.dart';
import 'package:khtfoods/src/pages/order_page.dart';

class FoodDetailsPage extends StatelessWidget {
  final Food food;
  FoodDetailsPage({this.food});

  @override
  Widget build(BuildContext context) {
    var itemQty = 1.obs;

    void increment() {
      itemQty++;
    }

    void decrement() {
      itemQty--;
    }

    Widget _buildButton() {
      return InkWell(
        onTap: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => OrderPage(
                name: food.name,
                imagePath: food.imagePath,
                price: food.price,
              ),
            ),
          );
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
              "Add to Cart",
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
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Food Details",
            style: TextStyle(fontSize: 16.0, color: Colors.black),
          ),
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset(
                        "${food.imagePath}",
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          food.name,
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "\u20B9 ${food.price}",
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      "Description",
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "${food.description}",
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            icon: Icon(Icons.add_circle),
                            onPressed: () {
                              increment();
                            }),
                        SizedBox(
                          width: 10,
                        ),
                        Obx(
                          () => Text(
                            "$itemQty",
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        IconButton(
                            icon: Icon(Icons.remove_circle),
                            onPressed: () {
                              decrement();
                            }),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    _buildButton(),
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
