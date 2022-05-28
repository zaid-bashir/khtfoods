import 'package:flutter/material.dart';
import 'package:khtfoods/src/data/food_data.dart';
import 'package:khtfoods/src/models/food_model.dart';

class FoodItemsSearch extends SearchDelegate<Food> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          }),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(
          Icons.arrow_back_outlined,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text(query),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final mylist = query.isEmpty
        ? foods
        : foods.where((p) => p.name.startsWith(query)).toList();
    return mylist.isEmpty
        ? Center(
            child: Text("No Results Found"),
          )
        : ListView.builder(
            itemCount: mylist.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  showResults(context);
                },
                title: Text(mylist[index].name),
                subtitle: Text(mylist[index].category),
              );
            });
  }
}
