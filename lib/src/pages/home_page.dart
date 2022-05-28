import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:khtfoods/src/data/food_data.dart';
import 'package:khtfoods/src/pages/favorite_page.dart';
import 'package:khtfoods/src/pages/food_details_page.dart';
import 'package:khtfoods/src/widgets/bought_foods.dart';
import 'package:khtfoods/src/widgets/food_category.dart';
import 'package:khtfoods/src/widgets/home_top_info.dart';
import 'package:khtfoods/src/widgets/search_field.dart';
import '../models/food_model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Food> _foods = foods;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(
          top: 10.0,
          left: 20.0,
          right: 20.0,
        ),
        children: <Widget>[
          HomeTopInfo(),
          FoodCategory(),
          SizedBox(
            height: 20.0,
          ),
          SearchField(),
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Frequently Bought Foods",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.orangeAccent),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FavoritePage(),
                        ),
                      );
                    },
                    child: Text(
                      "View All",
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Column(
            children: _foods.map(_buildFoodItem).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildFoodItem(Food food) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => FoodDetailsPage(food: food),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 20.0),
        child: BoughtFoods(
          id: food.id,
          name: food.name,
          imagePath: food.imagePath,
          category: food.imagePath,
          discount: food.discount,
          price: food.price,
          rating: food.rating,
        ),
      ),
    );
  }
}
