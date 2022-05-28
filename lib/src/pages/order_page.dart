import 'package:flutter/material.dart';
import 'package:khtfoods/src/pages/deliveryAddress.dart';
import 'package:khtfoods/src/pages/signin_page.dart';
import 'package:khtfoods/src/widgets/order_card.dart';
import '../data/address_data.dart';

class OrderPage extends StatefulWidget {
  final List<OrderCard> orders = <OrderCard>[];

  final String imagePath;
  final double price;
  final String name;

  OrderPage({this.imagePath, this.price, this.name});

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  Color pricingColor = Colors.black87;
  Color addressColor = Colors.black54;

  //==================================================
  //Unicode Value for Indian Rupee Symbol is \u20B9.
  //I got it from : https://unicode-table.com/en/20B9/
  //==================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          "Your Food Cart",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 10.0,
        ),
        scrollDirection: Axis.vertical,
        children: [
          OrderCard(
            name: "Wazwan",
            price: 65000,
            imagePath: "assets/images/food6.jpeg",
          ),
          OrderCard(
            name: "Ice Cream",
            price: 2000,
            imagePath: "assets/images/food5.jpeg",
          ),
          _buildTotalContainer(),
        ],
      ),
    );
  }

  Widget _buildTotalContainer() {
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Cart Total",
                style: TextStyle(
                  color: pricingColor,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "\u20B9 450",
                style: TextStyle(
                  color: pricingColor,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Discount",
                style: TextStyle(
                  color: pricingColor,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "\u20B9 50",
                style: TextStyle(
                  color: pricingColor,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Tax",
                style: TextStyle(
                  color: pricingColor,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "\u20B9 5",
                style: TextStyle(
                  color: pricingColor,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Divider(
            height: 20.0,
            color: Color(0xFFD3D3D3),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Sub Total",
                style: TextStyle(
                  color: pricingColor,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "\u20B9 405",
                style: TextStyle(
                  color: pricingColor,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Divider(
            height: 20.0,
            color: Color(0xFFD3D3D3),
          ),
          SizedBox(
            height: 10.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: "Your Area Pincode",
                  prefixIcon: Icon(Icons.point_of_sale_sharp),
                  hintStyle: TextStyle(
                    color: Color(0xFFBDC2CB),
                    fontSize: 18.0,
                  ),
                  labelText: "Pincode",
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text("Check Availibility"),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Icon(Icons.local_shipping_sharp),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Add or Select Your Delivery Address",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w900),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 40),
                width: MediaQuery.of(context).size.width,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => DeliveryAddress(),
                      ),
                    );
                  },
                  child: Center(
                      child: Text(
                    "Add new Address",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold),
                  )),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  "Or",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                height: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: addressList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Column(
                        children: [
                          Container(
                            width: 300,
                            height: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: Switch(
                                      value: addressList[index].isChecked,
                                      onChanged: (val) {
                                        setState(() {
                                          addressList[index].isChecked = val;
                                        });
                                      },
                                    ),
                                  ),
                                  Text(
                                    "Fullname : ${addressList[index].fullName}",
                                    style: TextStyle(
                                        color: addressColor,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Mobile Number : ${addressList[index].mobileNo}",
                                    style: TextStyle(
                                        color: addressColor,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Pincode : ${addressList[index].pincode}",
                                    style: TextStyle(
                                        color: addressColor,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Flat Or House Number : ${addressList[index].flatOrHouseNo}",
                                    style: TextStyle(
                                        color: addressColor,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Area/Colony/Street : ${addressList[index].area}",
                                    style: TextStyle(
                                        color: addressColor,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Landmark : ${addressList[index].landMark}",
                                    style: TextStyle(
                                        color: addressColor,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Town/City : ${addressList[index].townOrCity}",
                                    style: TextStyle(
                                        color: addressColor,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SignInPage(),
                ),
              );
            },
            child: Container(
              width: MediaQuery.of(context).size.width * .9,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Center(
                  child: Text(
                "Proceed to Checkout",
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              )),
            ),
          ),
        ],
      ),
    );
  }
}
