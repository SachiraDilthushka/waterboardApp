import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:waterboard_app/screens/homePage.dart';
import 'package:waterboard_app/screens/resetPasswordPage.dart';
import '../widgets/widgets.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();
  bool _secureText = true;
  bool circular = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          BackgrounImage(),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage('images/logo.png'),
                    )),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(left: 30, right: 30),
                    child: Center(
                      child: Text(
                        'National Water Supply & Drainage Borad',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.blue,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage('images/logo2.png'),
                    )),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Form(
                        child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Text(
                            "Login to your account to continue",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: TextFormField(

                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.black87,
                              ),
                              controller: _usernameController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Enter your username..';

                                } else {
                                  return null;
                                }
                              },
                              decoration: const InputDecoration(
                                  labelText: 'Username',
                                  labelStyle: TextStyle(
                                      fontSize: 24, color: Colors.grey),
                                  hintText: 'username',
                                  border: UnderlineInputBorder(),
                                  icon: Icon(Icons.email_outlined)),
                              keyboardType: TextInputType.emailAddress,
                            )),
                        Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: TextFormField(

                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.black87,
                              ),
                              controller: _pwdController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Enter your password..';
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                  labelText: 'Password',
                                  labelStyle: const TextStyle(
                                      fontSize: 24, color: Colors.grey),
                                  hintText: '*********',
                                  icon: const Icon(Icons.security_outlined),
                                  suffixIcon: IconButton(
                                    icon: Icon(_secureText
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined),
                                    onPressed: () async{
                                      if(_formKey.currentState!.validate()){
                                        //save()

                                        Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                                builder: (builder) => const HomePage()),
                                                (route) => false);
                                      }else{
                                        print("Not ok");
                                      }
                                      setState(() {
                                        _secureText = !_secureText;
                                      });
                                    },
                                  )),
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: _secureText,
                            )),
                        Container(
                          alignment: const Alignment(1, 0),
                          padding: const EdgeInsets.only(
                              top: 0, left: 20.0, right: 15),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ResetPasswordPage()));
                            },
                            child: Text(
                              'Forgot your Password?',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat',
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 30,),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(
                            height: 50,
                            width: 400,
                            // ignore: deprecated_member_use
                            child: FlatButton(
                              color: Colors.indigo,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0)),
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  // save();
                                } else {
                                  print("Not ok");
                                }
                                setState(() {
                                  circular = true;
                                });
                                try {
                                  setState(() {
                                    circular = false;
                                  });
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (builder) =>
                                              const HomePage()),
                                      (route) => false);
                                } catch (e) {
                                  final snackBar =
                                      SnackBar(content: Text(e.toString()));
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                  print(e);
                                  setState(() {
                                    circular = false;
                                  });
                                }
                              },
                              child: circular
                                  ? const CircularProgressIndicator()
                                  : const Text(
                                      "LOGIN",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                      ),
                                    ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 100,
                        ),
                        Center(
                          child: Container(
                              alignment: Alignment.bottomCenter,
                              padding: const EdgeInsets.all(16),
                              child: Row(children: [
                                const Text(
                                  "You Don't have an account?  ",
                                  style: TextStyle(
                                    color: Colors.black54,

                                    fontSize: 17,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    // navigate signup page
                                  },
                                  child: const Text(
                                    "Register Now ",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                    ),
                                  ),
                                ),
                              ])),
                        )
                      ],
                    )),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
