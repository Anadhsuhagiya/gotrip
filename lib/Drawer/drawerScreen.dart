
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Home.dart';
import '../Model.dart';
import 'MenuScreen.dart';

class drawerScreen extends StatefulWidget {
  const drawerScreen({Key? key}) : super(key: key);

  @override
  State<drawerScreen> createState() => _drawerScreenState();
}

class _drawerScreenState extends State<drawerScreen> {
  final zoomDrawerController = ZoomDrawerController();
  String ImagePath = "";

  String NAME = "";
  String EMAIL = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initData();
  }

  initData() async {
    Model.prefs = await SharedPreferences.getInstance();

    NAME = Model.prefs!.getString('Name') ?? "";
    EMAIL = Model.prefs!.getString('Email') ?? "";
    ImagePath = Model.prefs!.getString('ImagePath') ?? "";
    print("Name : $NAME");
    print("Email : $EMAIL");
    print("Image : $ImagePath");
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
        controller: zoomDrawerController,
        menuScreen: MenuScreen(ImagePath,NAME,EMAIL),
        mainScreen: Home(ImagePath,NAME,EMAIL),
       showShadow: true,
      borderRadius: 30,
      style: DrawerStyle.defaultStyle,
      menuBackgroundColor: Color(0xff0599b6),
      slideWidth: MediaQuery.of(context).size.width*.55,
      openCurve: Curves.fastOutSlowIn,
      angle: 0.0,
    );
  }
}
