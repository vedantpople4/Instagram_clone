import 'package:flutter/material.dart';
import 'package:flutterfirebase/helper/authenticate.dart';
import 'package:flutterfirebase/helper/helperfunctions.dart';
import 'package:flutterfirebase/views/chatroomscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool userIsLoggedIn;

  @override
  void initState() {
    getLoggedInState();
    super.initState();
  }

  getLoggedInState() async {
    await HelperFunctions.getUserLoggedInSharedPreference().then((value) {
      setState(() {
        userIsLoggedIn = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color(0xff145C9E),
          scaffoldBackgroundColor: Color(0xff1F1F1F1),
          accentColor: Color(0xff007EF4),
          primarySwatch: Colors.blue,
        ),
        home: userIsLoggedIn != null
            ? /**/ userIsLoggedIn ? ChatRoom() : Authenticate()
            : Container(
                child: Center(
                  child: Authenticate(),
                ),
              ));
  }
}
