import 'package:carbon_icons/carbon_icons.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../Login_page.dart';
import '../Model.dart';
import 'drawerScreen.dart';

class MenuScreen extends StatefulWidget {
  String imagePath;
  String name;
  String email;

  MenuScreen(this.imagePath, this.name, this.email);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0599b6),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.10,
          ),
          Container(
            height: 70,
            width: 70,
            margin: EdgeInsets.only(left: 15),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(widget.imagePath.isEmpty
                      ? "https://w7.pngwing.com/pngs/527/663/png-transparent-logo-person-user-person-icon-rectangle-photography-computer-wallpaper.png"
                      : "${widget.imagePath}"),
                  fit: BoxFit.cover),
              color: Colors.black,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.black, width: 3),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 15),
            child: Text(
              "${widget.name}",
              style: GoogleFonts.notoSansAnatolianHieroglyphs(
                textStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                        color: Colors.black,
                        offset: Offset(2, 4),
                        blurRadius: 20)
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 5),
            child: Text(
              "${widget.email}",
              style: GoogleFonts.notoSansAnatolianHieroglyphs(
                textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 9,
                  shadows: [
                    Shadow(
                        color: Colors.black,
                        offset: Offset(2, 4),
                        blurRadius: 20)
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.070,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => drawerScreen(),
                      ));
                },
                child: Container(
                  margin: EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                    color: Color(0xff0599b6),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Color(0xffffffff),
                      width: 2,
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black,
                          blurRadius: 10,
                          offset: Offset(4, 6),
                          blurStyle: BlurStyle.normal,
                          spreadRadius: -5),
                    ],
                  ),
                  child: ListTile(
                    leading: Icon(
                      CarbonIcons.home,
                      color: Colors.white,
                    ),
                    title: Text("Home",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                    color: Color(0xff0599b6),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Color(0xffffffff),
                      width: 2,
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black,
                          blurRadius: 10,
                          offset: Offset(4, 6),
                          blurStyle: BlurStyle.normal,
                          spreadRadius: -5),
                    ],
                  ),
                  child: ListTile(
                    leading: Icon(
                      CarbonIcons.star,
                      color: Colors.white,
                    ),
                    title: Text("Story",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                    color: Color(0xff0599b6),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Color(0xffffffff),
                      width: 2,
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black,
                          blurRadius: 10,
                          offset: Offset(4, 6),
                          blurStyle: BlurStyle.normal,
                          spreadRadius: -5),
                    ],
                  ),
                  child: ListTile(
                    leading: Icon(
                      EvaIcons.heartOutline,
                      color: Colors.white,
                    ),
                    title: Text("Like",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                    color: Color(0xff0599b6),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Color(0xffffffff),
                      width: 2,
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black,
                          blurRadius: 10,
                          offset: Offset(4, 6),
                          blurStyle: BlurStyle.normal,
                          spreadRadius: -5),
                    ],
                  ),
                  child: ListTile(
                    leading: Icon(
                      EvaIcons.settings2Outline,
                      color: Colors.white,
                    ),
                    title: Text("Settings",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () async {
                  await GoogleSignIn().signOut();
                  Model.prefs!.clear();
                  Navigator.pushReplacement(
                      context,
                      PageRouteBuilder(
                        transitionDuration: Duration(milliseconds: 500),
                        pageBuilder:
                            (context, animation, secondaryAnimation) =>
                            Login_page(),
                        transitionsBuilder: (context, animation,
                            secondaryAnimation, child) {
                          return FadeTransition(opacity: animation,child: child,);
                        },
                      ));
                },
                child: Container(
                  margin: EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                    color: Color(0xff0599b6),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Color(0xffffffff),
                      width: 2,
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black,
                          blurRadius: 10,
                          offset: Offset(4, 6),
                          blurStyle: BlurStyle.normal,
                          spreadRadius: -5),
                    ],
                  ),
                  child: ListTile(
                    leading: Icon(
                      EvaIcons.logOutOutline,
                      color: Colors.white,
                    ),
                    title: Text("Log Out",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
