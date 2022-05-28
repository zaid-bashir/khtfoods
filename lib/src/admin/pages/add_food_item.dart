import 'package:flutter/material.dart';

class AddFoodItem extends StatefulWidget {
  @override
  _AddFoodItemState createState() => _AddFoodItemState();
}

class _AddFoodItemState extends State<AddFoodItem> {
  String title;
  String category;
  String description;
  String price;
  String discount;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void validate() {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      print("========================");
      print(title);
      print(category);
      print(description);
      print(price);
      print(discount);
      print("=========================");
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => AddFoodItem(),
        ),
      );
    } else {
      print("Not Validated");
    }
  }

  Widget _buildTextField(String hint, {int maxLines}) {
    return TextFormField(
      onChanged: (value) {
        if (hint == "Food Title") {
          setState(() {
            title = value;
            print(title);
          });
        }
        if (hint == "Category") {
          setState(() {
            category = value;
            print(category);
          });
        }
        if (hint == "Description") {
          setState(() {
            description = value;
            print(description);
          });
        }
        if (hint == "Price") {
          setState(() {
            price = value;
            print(price);
          });
        }
        if (hint == "Discount") {
          setState(() {
            discount = value;
            print(discount);
          });
        }
      },
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: "$hint",
        hintStyle: TextStyle(
          color: Color(0xFFBDC2CB),
          fontSize: 18.0,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          borderSide: BorderSide(color: Colors.blue),
        ),
      ),
      keyboardType: (hint == "Price" || hint == "Discount")
          ? TextInputType.number
          : TextInputType.text,
      validator: (value) {
        if (value.isEmpty && hint == "Food Title") {
          return "Food Title is Required";
        }
        if (value.isEmpty && hint == "Category") {
          return "Category is Required";
        }
        if (value.isEmpty && hint == "Description") {
          return "Description is Required";
        }
        if (value.isEmpty && hint == "Price") {
          return "Price is Required";
        }
        if (value.isEmpty && hint == "Discount") {
          return "Discount is Required";
        }
        return null;
      },
    );
  }

  Widget _buildButton() {
    return GestureDetector(
      onTap: () {
        validate();
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
            "Add Food Item",
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: _buildButton(),
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 170,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/noimage.png"),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      _buildTextField("Food Title"),
                      SizedBox(
                        height: 10,
                      ),
                      _buildTextField("Category"),
                      SizedBox(
                        height: 10,
                      ),
                      _buildTextField("Description", maxLines: 5),
                      SizedBox(
                        height: 10,
                      ),
                      _buildTextField("Price"),
                      SizedBox(
                        height: 10,
                      ),
                      _buildTextField("Discount"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
