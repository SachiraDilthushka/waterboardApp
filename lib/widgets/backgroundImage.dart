import 'package:flutter/material.dart';
class BackgrounImage extends StatelessWidget {
  const BackgrounImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/login.png'),
              fit: BoxFit.cover
          )
      ),


    );
  }
}
