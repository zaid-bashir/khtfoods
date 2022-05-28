import 'package:flutter/material.dart';
import 'package:im_stepper/stepper.dart';
import 'package:khtfoods/src/models/trackOrderModel.dart';

class OrderTrack extends StatefulWidget {
  OrderTrack({Key key}) : super(key: key);

  @override
  _OrderTrackState createState() => _OrderTrackState();
}

class _OrderTrackState extends State<OrderTrack> {
  final trackOrderList = [
    TrackOrderModal(
        icon: Icons.card_travel,
        title: "Ready to Pickup",
        subtitle: "Order from Khtfoods",
        time: "08.00"),
    TrackOrderModal(
        icon: Icons.person,
        title: "Order Processed",
        subtitle: "We are preparing your order",
        time: "09.50"),
    TrackOrderModal(
        icon: Icons.payment,
        title: "Payment Confirmed",
        subtitle: "Awaiting Confirmation",
        time: "11.30"),
    TrackOrderModal(
        icon: Icons.receipt,
        title: "Order Placed",
        subtitle: "We have received your order",
        time: "02.15"),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Khtfoods",
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Text(
            "Track Your Order",
            style: TextStyle(color: Colors.black),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            color: Colors.black,
            icon: Icon(Icons.arrow_back),
          ),
        ),
        body: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          "General Details:",
                          style: TextStyle(
                              color: Colors.orange,
                              fontSize: 18,
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          "Date : 22-06-2021",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w900),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          "Time : 02:45 PM",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w900),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        thickness: 2,
                        height: 2,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          "Check Your Order Tracking Details:",
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 18,
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          hintText: "Your Order ID",
                          prefixIcon: Icon(Icons.point_of_sale_sharp),
                          hintStyle: TextStyle(
                            color: Color(0xFFBDC2CB),
                            fontSize: 18.0,
                          ),
                          labelText: "Order ID",
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                        ),
                        keyboardType: TextInputType.text,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text("Track Order"),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        thickness: 2,
                        height: 2,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 16.0,
                    right: 16.0,
                    top: 16.0,
                  ),
                  child: Text(
                    "Orders",
                    style: TextStyle(
                      fontSize: 22.0,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 2,
                      width: MediaQuery.of(context).size.width / 6,
                      child: IconStepper(
                        direction: Axis.vertical,
                        enableNextPreviousButtons: false,
                        enableStepTapping: false,
                        stepColor: Colors.green,
                        activeStepBorderColor: Colors.black,
                        activeStepBorderWidth: 0.0,
                        activeStepBorderPadding: 0.0,
                        lineColor: Colors.green,
                        lineLength: 70.0,
                        lineDotRadius: 2.0,
                        stepRadius: 16.0,
                        icons: [
                          Icon(Icons.radio_button_checked, color: Colors.green),
                          Icon(Icons.check, color: Colors.black),
                          Icon(Icons.check, color: Colors.black),
                          Icon(Icons.check, color: Colors.black),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        itemCount: trackOrderList.length,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width / 1.5,
                                child: ListTile(
                                  contentPadding:
                                      EdgeInsets.symmetric(vertical: 16.0),
                                  leading: Icon(
                                    trackOrderList[index].icon,
                                    size: 28.0,
                                    color: Colors.black,
                                  ),
                                  title: Text(
                                    trackOrderList[index].title,
                                    style: TextStyle(fontSize: 18.0),
                                  ),
                                  subtitle: Text(
                                    trackOrderList[index].subtitle,
                                    style: TextStyle(fontSize: 16.0),
                                  ),
                                ),
                              ),
                              Text(
                                trackOrderList[index].time,
                                style: TextStyle(fontSize: 18.0),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.0),
                  padding: EdgeInsets.only(left: 24.0, top: 16.0, bottom: 16.0),
                  decoration: BoxDecoration(
                    // color: Colors.black,
                    border: Border.all(
                      width: 0.5,
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.home,
                        size: 64.0,
                      ),
                      SizedBox(width: 32.0),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Delivery Address",
                              style: TextStyle(fontSize: 20.0),
                            ),
                            Text(
                              "Home, Work & Other Address",
                              style: TextStyle(
                                fontSize: 17.0,
                                color: Colors.black.withOpacity(0.7),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 1.8,
                              child: Text(
                                "House No: 5A, 2nd Floor New Light Colony Srinagar",
                                style: TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.black.withOpacity(0.5),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
