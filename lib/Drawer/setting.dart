import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xff06b5d7), Color(0xff6dd9ef)])),
        ),
        title: Text(
          "Setting",
          style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              letterSpacing: 1,
              shadows: [
                Shadow(
                    color: Colors.black, offset: Offset(2, 3), blurRadius: 13)
              ]),
        ),
        centerTitle: true,
      ),
    ));
  }
}
