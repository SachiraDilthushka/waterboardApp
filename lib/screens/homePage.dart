import 'package:flutter/material.dart';
import 'package:waterboard_app/screens/bookingLocationPage.dart';
import 'package:waterboard_app/screens/reservationPage.dart';
import 'package:waterboard_app/widgets/sideDrawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentTab = 0;
  final List<Widget> screens = [
    HomePage(),
    BookingLocationPage(),
  ];
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = ReservationPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF0D47A1),
          actions: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.more_horiz_rounded),
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          // color: const Color(0xFF0D47A1),
          color: Colors.blue,
          shape: const CircularNotchedRectangle(),
          notchMargin: 10,
          child: Container(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MaterialButton(
                      onPressed: () {
                        setState(() {
                          currentScreen = ReservationPage();
                          currentTab = 0;
                        });
                      },
                      minWidth: 40,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.home,
                              color: currentTab == 0
                                  ? Colors.indigo
                                  : Colors.white),
                        ],
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        setState(() {
                          // currentScreen = ReservationPage();
                          currentTab = 1;
                        });
                      },
                      minWidth: 40,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.menu_rounded,
                              color: currentTab == 1
                                  ? Colors.indigo
                                  : Colors.white),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MaterialButton(
                      onPressed: () {
                        setState(() {
                          currentScreen = BookingLocationPage();
                          currentTab = 2;
                        });
                      },
                      minWidth: 40,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.search,
                              color: currentTab == 2
                                  ? Colors.indigo
                                  : Colors.white),
                        ],
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        setState(() {
                          // currentScreen = ReservationPage();
                          currentTab = 3;
                        });
                      },
                      minWidth: 40,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.bar_chart,
                              color: currentTab == 3
                                  ? Colors.indigo
                                  : Colors.white),
                        ],
                      ),
                    ),
                  ],
                ),
                // IconButton(
                //   icon: const Icon(Icons.home_filled),
                //   color: Color.fromARGB(255, 135, 195, 243),
                //   onPressed: () {},
                // ),
                // IconButton(
                //   icon: const Icon(Icons.menu_rounded),
                //   color: Color.fromARGB(255, 135, 195, 243),
                //   onPressed: () {},
                // ),
                // IconButton(
                //   icon: const Icon(Icons.search),
                //   color: Color.fromARGB(255, 135, 195, 243),
                //   onPressed: () {
                //     Navigator.pushAndRemoveUntil(
                //         context,
                //         MaterialPageRoute(
                //             builder: (builder) => BookingLocationPage()),
                //         (route) => false);
                //   },
                // ),
                // IconButton(
                //   icon: const Icon(Icons.bar_chart),
                //   color: Color.fromARGB(255, 135, 195, 243),
                //   onPressed: () {},
                // ),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xFF0D47A1),
          child: const Center(
            child: Icon(
              Icons.add,
              size: 32.0,
            ),
          ),
          onPressed: () {
            /*
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CreateEvent()),
                    );*/
          },
        ),
      drawer: const SideDrawer(),
        body: PageStorage(
          child: currentScreen,
          bucket: bucket,
        ));
  }
}
