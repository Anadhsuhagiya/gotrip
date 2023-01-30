import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  String EmailError = "";
  bool emailError = true;
  bool isSwitch = false;
  String show = "";
  double Val = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: email,
            onChanged: (value) {
              EmailError = (value.length > 10 ? "Invalid Error" : null)!;
              setState(() {});
            },
            obscureText: emailError,
            decoration: InputDecoration(
                hintText: "Enter Your Email",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
                errorText: EmailError,
                suffixIcon: IconButton(
                    onPressed: () {
                      emailError = !emailError;
                      setState(() {});
                    },
                    icon: Icon(
                        emailError ? Icons.visibility : Icons.visibility_off))),
          ),
          TextButton(
              onPressed: () {
                show = email.text;
                setState(() {});
              },
              child: Text("Submit")),
          Text(show),
          Slider(
            value: Val,
            max: 100,
            divisions: 4,
            onChanged: (value) {
              Val = value;
              setState(() {});
            },
          ),
          Text(Val.toString()),

          CupertinoSwitch(value: isSwitch,activeColor: Colors.blue, onChanged: (value) {
            isSwitch = value;
            setState(() {

            });
          },)
        ],
      ),
    );
  }
}
