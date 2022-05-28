import 'package:flutter/material.dart';
import 'package:khtfoods/src/pages/order_page.dart';

class DeliveryAddress extends StatefulWidget {
  @override
  _DeliveryAddressState createState() => _DeliveryAddressState();
}

class _DeliveryAddressState extends State<DeliveryAddress> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String fullName;

  String mobileNo;

  String pincode;

  String flatOrHouseNo;

  String area;

  String landMark;

  String townOrCity;

  void validate() {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      print("========================");
      print(fullName);
      print(mobileNo);
      print(pincode);
      print(flatOrHouseNo);
      print(area);
      print(landMark);
      print(townOrCity);

      print("=========================");
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => OrderPage(),
        ),
      );
    } else {
      print("Not Validated");
    }
  }

  Widget _buildAddressTextField(
      {String hintText, String labelText, String validationText}) {
    return TextFormField(
      onChanged: (value) {
        if (hintText == "Fullname") {
          setState(() {
            fullName = value;
            print(fullName);
          });
        }
        if (hintText == "Mobile Number") {
          setState(() {
            mobileNo = value;
            print(mobileNo);
          });
        }
        if (hintText == "Pincode") {
          setState(() {
            pincode = value;
            print(pincode);
          });
        }
        if (hintText == "Flat Or House Number") {
          setState(() {
            flatOrHouseNo = value;
            print(flatOrHouseNo);
          });
        }
        if (hintText == "Area/Colony/Street") {
          setState(() {
            area = value;
            print(area);
          });
        }
        if (hintText == "Landmark") {
          setState(() {
            landMark = value;
            print(landMark);
          });
        }
        if (hintText == "Town/City") {
          setState(() {
            townOrCity = value;
            print(townOrCity);
          });
        }
      },
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: Color(0xFFBDC2CB),
          fontSize: 18.0,
        ),
        labelText: labelText,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          borderSide: BorderSide(color: Colors.blue),
        ),
      ),
      keyboardType: (hintText == "Mobile Number" || hintText == "Pincode")
          ? TextInputType.number
          : TextInputType.text,
      validator: (value) {
        if (value.isEmpty && hintText == "Fullname") {
          return validationText;
        }
        if (value.isEmpty && hintText == "Mobile Number") {
          return validationText;
        }
        if (value.isEmpty && hintText == "Pincode") {
          return validationText;
        }
        if (value.isEmpty && hintText == "Flat Or House Number") {
          return validationText;
        }
        if (value.isEmpty && hintText == "Area/Colony/Street") {
          return validationText;
        }
        if (value.isEmpty && hintText == "Landmark") {
          return validationText;
        }
        if (value.isEmpty && hintText == "Town/City") {
          return validationText;
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
            "Submit",
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Khtfoods",
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text(
            "Delivery Address",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: SafeArea(
            child: ListView(
          padding: EdgeInsets.all(10),
          children: [
            Text(
              "Add a new Delivery Address",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w900),
            ),
            Form(
                key: formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                        bottom: 10,
                      ),
                      child: _buildAddressTextField(
                          hintText: "Fullname",
                          labelText: "Fullname",
                          validationText: "Please enter your Fullname"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: _buildAddressTextField(
                          hintText: "Mobile Number",
                          labelText: "Mobile Number",
                          validationText: "Please enter your Mobile Number"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: _buildAddressTextField(
                          hintText: "Pincode",
                          labelText: "PIncode",
                          validationText: "Please enter your Pincode"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: _buildAddressTextField(
                          hintText: "Flat Or House Number",
                          labelText: "Flat Or House Number",
                          validationText:
                              "Please enter your Flat Or House Number"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: _buildAddressTextField(
                          hintText: "Area/Colony/Street",
                          labelText: "Area/Colony/Street",
                          validationText:
                              "Please enter your Area/Colony/Street"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: _buildAddressTextField(
                          hintText: "Landmark",
                          labelText: "Landmark",
                          validationText: "Please enter your Landmark"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 40),
                      child: _buildAddressTextField(
                          hintText: "Town/City",
                          labelText: "Town/City",
                          validationText: "Please enter your Town/City"),
                    ),
                    _buildButton(),
                  ],
                )),
          ],
        )),
      ),
    );
  }
}
