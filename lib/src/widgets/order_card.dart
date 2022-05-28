import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderCard extends StatelessWidget {
  final String name;
  final String imagePath;
  final double price;

  OrderCard({this.name, this.imagePath, this.price});

  var itemQty = 1.obs;

  void increment() {
    itemQty++;
  }

  void deccrement() {
    itemQty--;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 75.0,
              width: 45.0,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2.0,
                  color: Color(0xFFD3D3D3),
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      increment();
                    },
                    child: Icon(
                      Icons.keyboard_arrow_up,
                      color: Colors.black,
                    ),
                  ),
                  Obx(
                    () => Text(
                      "$itemQty",
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w900),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      deccrement();
                    },
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            Container(
              height: 70.0,
              width: 70.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("${this.imagePath}"),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(35.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 5.0,
                    offset: Offset(5.0, 5.0),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${this.name}",
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  "\u20B9 ${this.price}",
                  style: TextStyle(
                      color: Colors.orange,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5.0,
                ),
              ],
            ),
            Spacer(),
            GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.cancel_outlined,
                  color: Colors.black,
                )),
          ],
        ),
      ),
    );
  }
}
