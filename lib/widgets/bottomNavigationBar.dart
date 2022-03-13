import 'package:flutter/material.dart';
class BottomNavigationBar extends StatelessWidget {
  const BottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: const Color(0xFF0D47A1),
      shape: const CircularNotchedRectangle(),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: const Icon(Icons.home_filled),
            color: Color.fromARGB(255, 135, 195, 243),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.menu_rounded),
            color: Color.fromARGB(255, 135, 195, 243),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.search),
            color: Color.fromARGB(255, 135, 195, 243),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.bar_chart),
            color: Color.fromARGB(255, 135, 195, 243),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
