import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:khtfoods/src/pages/favorite_page.dart';
import 'package:khtfoods/src/pages/notifications.dart';
import 'package:khtfoods/src/pages/profile_page.dart';
import '../pages/home_page.dart';
import '../pages/order_page.dart';
import 'myorders/myorders.dart';
import 'ordertracking/ordertracking.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int currentTabIndex = 0;

  List<Widget> pages;
  Widget currentPage;
  HomePage homePage;
  OrderPage orderPage;
  FavoritePage favoritePage;
  ProfilePage profilePage;
  MyOrders myOrders;

  @override
  void initState() {
    super.initState();
    // To Achieve TransParent Status Bar
    // =================================
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );

    //Hiding the Status Bar
    // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);

    //=================================
    homePage = HomePage();
    orderPage = OrderPage();
    favoritePage = FavoritePage();
    profilePage = ProfilePage();
    myOrders = MyOrders();
    pages = [homePage, favoritePage, orderPage, profilePage, myOrders];
    currentPage = homePage;
  }

  @override
  Widget build(BuildContext context) {
    Widget custumDrawer() {
      return Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(
                "Zaid Bashir",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              accountEmail: Text(
                "zaid.bashir@zumr.io",
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              currentAccountPicture: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50.0),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/userdemo.png"),
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => MainScreen(),
                  ),
                );
                if (_scaffoldKey.currentState.isDrawerOpen) {
                  _scaffoldKey.currentState.openEndDrawer();
                }
              },
            ),
            ListTile(
              leading: Icon(Icons.track_changes_sharp),
              title: Text("Track Your Order"),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => OrderTrack(),
                  ),
                );
                if (_scaffoldKey.currentState.isDrawerOpen) {
                  _scaffoldKey.currentState.openEndDrawer();
                }
              },
            ),
            ListTile(
              leading: Icon(Icons.contact_support),
              title: Text("Contact Us"),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => null,
                  ),
                );
                if (_scaffoldKey.currentState.isDrawerOpen) {
                  _scaffoldKey.currentState.openEndDrawer();
                }
              },
            ),
            ListTile(
              leading: Icon(Icons.store),
              title: Text("About Us"),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => null,
                  ),
                );
                if (_scaffoldKey.currentState.isDrawerOpen) {
                  _scaffoldKey.currentState.openEndDrawer();
                }
              },
            ),
          ],
        ),
      );
    }

    Widget _buildCart() {
      return Stack(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OrderPage(),
                ),
              );
            },
            child: Icon(
              Icons.shopping_cart,
              size: 30.0,
            ),
          ),
          Positioned(
            right: 0.0,
            child: Container(
              height: 15.0,
              width: 15.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: Colors.red,
              ),
              child: Center(
                  child: Text(
                "4",
                style: TextStyle(fontSize: 10),
              )),
            ),
          ),
        ],
      );
    }

    Widget _buildNotification() {
      return Stack(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Notifications(),
                ),
              );
            },
            child: Icon(
              Icons.notifications,
              size: 30.0,
            ),
          ),
          Positioned(
            right: 0.0,
            child: Container(
              height: 15.0,
              width: 15.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: Colors.red,
              ),
              child: Center(
                  child: Text(
                "2",
                style: TextStyle(fontSize: 10),
              )),
            ),
          ),
        ],
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text("Khtfoods"),
          actions: [
            //Dark and Light THeme
            // Center(
            //   child: Padding(
            //     padding: const EdgeInsets.all(8.0),
            //     child: IconButton(
            //         icon: Icon(Icons.wb_sunny_sharp),
            //         onPressed: () {
            //           Get.defaultDialog(
            //               title: "Theme Change",
            //               middleText:
            //                   "Which theme you want to apply in your App",
            //               actions: [
            //                 TextButton.icon(
            //                   onPressed: () {
            //                     Get.changeTheme(
            //                       ThemeData.light(),
            //                     );
            //                     Get.back();
            //                   },
            //                   icon: Icon(Icons.wb_sunny_outlined),
            //                   label: Text("Light"),
            //                 ),
            //                 Spacer(),
            //                 TextButton.icon(
            //                   onPressed: () {
            //                     Get.changeTheme(
            //                       ThemeData.dark(),
            //                     );
            //                     Get.back();
            //                   },
            //                   icon: Icon(Icons.wb_sunny),
            //                   label: Text("Dark"),
            //                 ),
            //               ]);
            //         }),
            //   ),
            // ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: _buildNotification(),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: _buildCart(),
              ),
            ),
          ],
        ),
        drawer: custumDrawer(),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              currentTabIndex = index;
              currentPage = pages[index];
            });
          },
          currentIndex: currentTabIndex,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: ("Home"),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.explore,
              ),
              label: ("Explore"),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart,
              ),
              label: ("Cart"),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              label: ("Profile"),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_bag,
              ),
              label: ("My Order"),
            ),
          ],
        ),
        body: currentPage,
      ),
    );
  }
}
