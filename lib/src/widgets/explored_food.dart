import 'package:flutter/material.dart';
import 'package:khtfoods/src/widgets/custum_button.dart';

class ExploredFood extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget _buildButton() {
      return Center(
        child: InkWell(
          onTap: () {},
          child: Container(
            height: 40.0,
            width: MediaQuery.of(context).size.width * .4,
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
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
        ),
      );
    }

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      padding: EdgeInsets.all(10.0),
      width: MediaQuery.of(context).size.width,
      height: 250.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            blurRadius: 5.0,
            offset: Offset(0, 3.0),
            color: Colors.black38,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(right: 10),
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              image: DecorationImage(
                image: AssetImage("assets/images/food1.jpeg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "BreakFast ",
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15.0,
              ),
              Container(
                width: 200,
                child: Text(
                  "Namaste Break Fast,Hi Your Break Fast is Ready.This is the Little Description of the Food.It is really Awesome Food",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Container(
                width: 200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\u20B9 180",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    CustumButton(
                      text: "Buy",
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              _buildButton(),
            ],
          ),
        ],
      ),
    );
  }
}
