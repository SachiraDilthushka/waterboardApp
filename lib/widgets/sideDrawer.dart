import 'package:flutter/material.dart';
import 'package:waterboard_app/screens/signInPage.dart';
class SideDrawer extends StatefulWidget {
  const SideDrawer({Key? key}) : super(key: key);

  @override
  State<SideDrawer> createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            color: Colors.indigo,
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 150,
                    margin: const EdgeInsets.only(top: 30),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTCbuwzBWsYE-bms_JeMfSN_TMoSjUWljbjw&usqp=CAU'),
                      ),
                    ),
                  ),
                  const Text(
                    'User Name',
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  // Text(
                  //   'User Name',
                  //   style: TextStyle(
                  //     fontSize: 15,
                  //     color: Colors.white,
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(
              Icons.person,
              color: Colors.indigo,
              size: 30,
            ),
            title: const Text(
              'Profile',
              style: TextStyle(fontSize: 20),
            ),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(
              Icons.settings,
              color: Colors.indigo,
              size: 30,
            ),
            title: const Text(
              'Settings',
              style: TextStyle(fontSize: 20),
            ),
          ),
          ListTile(
            onTap: () async {

              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (builder) => SignInPage()),
                      (route) => false);
            },
            leading: const Icon(
              Icons.logout,
              color: Colors.indigo,
              size: 30,
            ),
            title: const Text(
              'Logout',
              style: TextStyle(fontSize: 20),
            ),
          ),
          // Container(
          //   padding: const EdgeInsets.all(20),
          //   width: 200,
          //   height: 100,
          //   margin: const EdgeInsets.only(top: 240, left: 40, right: 40),
          //   decoration: const BoxDecoration(
          //     shape: BoxShape.rectangle,
          //     image: DecorationImage(image: AssetImage('images/logo.png')),
          //   ),
          // )
        ],
      ),
    );
  }
}
