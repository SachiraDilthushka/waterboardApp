import 'package:flutter/material.dart';
import 'package:waterboard_app/screens/signInPage.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  Widget currentPage = SignInPage();

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner:false,
      home: currentPage,
    );
  }
}
