
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Drawer/drawerScreen.dart';
import 'Login_page.dart';
import 'Model.dart';
import 'Registration.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: splash(),
    ),
  );
}

// void main() => runApp(
//   DevicePreview(
//     enabled: !kReleaseMode,
//     builder: (context) => Home(), // Wrap your app
//   ),
// );




class splash extends StatefulWidget {
  const splash({Key? key}) : super(key: key);

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    go();
  }

  go() async {
    Model.prefs = await SharedPreferences.getInstance();

    await Future.delayed(Duration(seconds: 3));

    int stat = Model.prefs!.getInt('registered') ?? 0;

    if(stat == 1)
    {
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) {
          return drawerScreen();
        },
      ));
    }
    else
      {
        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) {
            return Login_page();
          },
        ));
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xff00a2ec),
              Color(0xff81cae3),
            ],
          ),
        ),
        child: Center(
          child: Lottie.network(
              'https://assets4.lottiefiles.com/packages/lf20_fyffhdtn.json'),
        ),
      ),
    );
  }
}
