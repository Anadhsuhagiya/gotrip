import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui' as ui;

import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Drawer/drawerScreen.dart';
import 'Login_page.dart';
import 'Model.dart';

class Registration extends StatefulWidget {
  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  FirebaseDatabase database = FirebaseDatabase.instance;
  List<Map> data = [];

  TextEditingController Name = TextEditingController();
  TextEditingController Email = TextEditingController();
  TextEditingController PhoneNumber = TextEditingController();
  TextEditingController Password = TextEditingController();
  TextEditingController DatePick = TextEditingController();

  bool nameerror = false;
  bool namevalid = false;
  bool emailerror = false;
  bool passerror = false;
  bool contacterror = false;
  bool hidepass = true;
  bool photoerror = false;

  int textLength = 0;
  int maxLength = 10;

  String contactmsg = "";
  String emailmsg = "";
  String passmsg = "";
  String ImagePath = "";

  String NAME = "";
  String EMAIL = "";

  @override
  void initState() {
    super.initState();
    initpref();
  }

  initpref() async {
    Model.prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   title: Text("Welcome to the Car World",style: TextStyle(color: Colors.white,fontSize: 18),),
      //   backgroundColor: Color(0xff250148),
      // ),

      body: SingleChildScrollView(
        child: Stack(
          children: [
            CustomPaint(
              size: Size(double.infinity, 600),
              //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
              painter: RPSCustomPainter(),
            ),
            Container(
              margin: EdgeInsets.only(top: 260),
              child: CustomPaint(
                size: Size(double.infinity, 650),
                //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                painter: RPSCustomPainter1(),
              ),
            ),
            Positioned(
              child: Wrap(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 170,
                      ),
                      Center(
                        child: Text(
                          "Sign Up",
                          style: GoogleFonts.aleo(
                            textStyle: TextStyle(
                                color: Color(0xff250148),
                                fontSize: 40,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextField(
                          onChanged: (value) {
                            print(value);
                            if (nameerror) {
                              if (value.isNotEmpty) {
                                nameerror = false;
                                setState(() {});
                              }
                            }
                          },
                          controller: Name,
                          keyboardType: TextInputType.name,
                          textCapitalization: TextCapitalization.words,
                          style: GoogleFonts.aleo(
                              textStyle: TextStyle(color: Color(0xff040065))),
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xff040065), width: 3)),
                              border: OutlineInputBorder(),
                              hintText: "Enter Name",
                              labelText: "Name",
                              labelStyle: GoogleFonts.aleo(
                                  textStyle:
                                      TextStyle(color: Color(0xff040065))),
                              errorText:
                                  nameerror ? "Please Enter Valid Name" : null,
                              prefixIcon: Icon(
                                Icons.person,
                                color: Color(0xff040065),
                              )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextField(
                          onChanged: (value) {
                            print(value);
                            if (emailerror) {
                              if (value.isNotEmpty) {
                                setState(() {
                                  emailerror = false;
                                });
                              }
                            }
                          },
                          controller: Email,
                          keyboardType: TextInputType.text,
                          textCapitalization: TextCapitalization.sentences,
                          style: GoogleFonts.aleo(
                              textStyle: TextStyle(color: Color(0xff040065))),
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xff250148), width: 3)),
                              border: OutlineInputBorder(),
                              hintText: "Enter Email Address",
                              labelText: "Email",
                              labelStyle: GoogleFonts.aleo(
                                  textStyle:
                                      TextStyle(color: Color(0xff040065))),
                              errorText: emailerror ? emailmsg : null,
                              prefixIcon: Icon(
                                Icons.email_rounded,
                                color: Color(0xff250148),
                              )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextField(
                          onChanged: (value) {
                            textLength = value.length;
                            if (contacterror) {
                              if (value.isNotEmpty) {
                                setState(() {
                                  contacterror = false;
                                });
                              }
                            }
                          },
                          controller: PhoneNumber,
                          keyboardType: TextInputType.phone,
                          textCapitalization: TextCapitalization.sentences,
                          style: GoogleFonts.aleo(
                              textStyle: TextStyle(color: Color(0xff040065))),
                          maxLength: 10,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xff250148))),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xff250148), width: 3)),
                              counter: Offstage(),
                              suffixText:
                                  '${textLength.toString()}/${maxLength.toString()}',
                              hintText: "Enter Your Contact",
                              labelText: "Contact",
                              labelStyle: GoogleFonts.aleo(
                                  textStyle:
                                      TextStyle(color: Color(0xff040065))),
                              errorText: contacterror ? contactmsg : null,
                              prefixIcon: Icon(
                                Icons.phone,
                                color: Color(0xff250148),
                              )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, bottom: 15),
                        child: TextField(
                          onTap: () async {
                            DateTime? date = await showDatePicker(
                                context: context,
                                builder: (context, child) {
                                  return Theme(
                                    data: Theme.of(context).copyWith(
                                      colorScheme: ColorScheme.light(
                                        primary: Color(0xff250148),
                                        // header background color
                                        onPrimary: Colors.white,
                                        // header text color
                                        onSurface:
                                            Colors.black, // body text color
                                      ),
                                      textButtonTheme: TextButtonThemeData(
                                        style: TextButton.styleFrom(
                                          primary: Color(
                                              0xff250148), // button text color
                                        ),
                                      ),
                                    ),
                                    child: child!,
                                  );
                                },
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1960),
                                lastDate: DateTime(2024));
                            DatePick.text =
                                "${date?.day} - ${date?.month} - ${date?.year}";
                            setState(() {});
                          },
                          controller: DatePick,
                          keyboardType: TextInputType.text,
                          autofocus: false,
                          readOnly: true,
                          textCapitalization: TextCapitalization.sentences,
                          style: GoogleFonts.aleo(
                              textStyle: TextStyle(color: Color(0xff040065))),
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xff250148), width: 3)),
                              border: OutlineInputBorder(),
                              hintText: "Pick Your BirthDate",
                              suffixIcon: IconButton(
                                  onPressed: () async {
                                    DateTime? date = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(1960),
                                        lastDate: DateTime(2024));
                                    DatePick.text =
                                        "${date?.day} / ${date?.month} / ${date?.year} / ";
                                    setState(() {});
                                  },
                                  icon: Icon(
                                    Icons.calendar_today,
                                    color: Color(0xff250148),
                                  )),
                              labelText: "BirthDate",
                              labelStyle: GoogleFonts.aleo(
                                  textStyle:
                                      TextStyle(color: Color(0xff040065))),
                              errorText: emailerror ? emailmsg : null,
                              prefixIcon: Icon(
                                Icons.date_range,
                                color: Color(0xff250148),
                              )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, bottom: 10, top: 3),
                        child: TextField(
                          onChanged: (value) {
                            print(value);
                            if (passerror) {
                              if (value.isNotEmpty) {
                                setState(() {
                                  passerror = false;
                                });
                              }
                            }
                          },
                          controller: Password,
                          obscureText: hidepass,
                          textCapitalization: TextCapitalization.sentences,
                          style: GoogleFonts.aleo(
                              textStyle: TextStyle(color: Color(0xff040065))),
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xff040065), width: 3)),
                              border: OutlineInputBorder(),
                              hintText: "Enter Your Password",
                              labelText: "Password",
                              labelStyle: GoogleFonts.aleo(
                                  textStyle:
                                      TextStyle(color: Color(0xff040065))),
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    hidepass = !hidepass;
                                    setState(() {});
                                  },
                                  icon: hidepass
                                      ? Icon(
                                          Icons.visibility,
                                          color: Color(0xff250148),
                                        )
                                      : Icon(
                                          Icons.visibility_off,
                                          color: Color(0xff250148),
                                        )),
                              errorText: passerror ? passmsg : null,
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Color(0xff250148),
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already Registered ? ",
                            style: GoogleFonts.aleo(
                              textStyle: TextStyle(
                                  color: Color(0xff7e7e7e), fontSize: 16),
                            ),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(
                                  builder: (context) {
                                    return Login_page();
                                  },
                                ));
                              },
                              child: Text("Login",
                                  style: GoogleFonts.aleo(
                                      textStyle: TextStyle(
                                          color: Color(0xff250148),
                                          fontSize: 20)))),
                          SizedBox(
                            width: 30,
                          ),
                          InkWell(
                            onTap: () async {
                              String name = Name.text.trim();
                              String Phone = PhoneNumber.text.trim();
                              String email = Email.text.trim();
                              String pass = Password.text.trim();
                              String Date = DatePick.text.trim();

                              // Map m = {'name': Name, 'phone': Phone, 'email': Email, 'pass': pass};

                              bool emailValid = RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(email);
                              bool passValid = RegExp(
                                      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$')
                                  .hasMatch(pass);

                              String link =
                                  "https://flutteranadh.000webhostapp.com/register.php";

                              if (name.isEmpty) {
                                Fluttertoast.showToast(
                                    msg: "Please Insert Name",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 15.0);
                                setState(() {
                                  nameerror = true;
                                });
                              } else if (email.isEmpty) {
                                Fluttertoast.showToast(
                                    msg: "Please Insert Email",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 15.0);
                                setState(() {
                                  emailerror = true;
                                  emailmsg = "Enter Email Address";
                                });
                              } else if (!emailValid) {
                                setState(() {
                                  emailerror = true;
                                  emailmsg = "Please Enter Valid Email Address";
                                });
                              } else if (Phone.isEmpty) {
                                Fluttertoast.showToast(
                                    msg: "Please Insert Mobile Number",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 15.0);
                                setState(() {
                                  contacterror = true;
                                  contactmsg = "Enter your Contact";
                                });
                              } else if (Phone.length < 10) {
                                setState(() {
                                  contacterror = true;
                                  contactmsg = "Please Enter 10 digit Contact";
                                });
                              } else if (pass.isEmpty) {
                                Fluttertoast.showToast(
                                    msg: "Please Create your own Password",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 15.0);
                                setState(() {
                                  passerror = true;
                                  passmsg = "Enter your password";
                                });
                              } else if (!passValid) {
                                setState(() {
                                  passerror = true;
                                  passmsg =
                                      "Please Enter Valid Formatted password";
                                });
                              } else {

                                showDialog(context: context, builder: (context) {
                                  return SimpleDialog(
                                    children: [
                                      Container(
                                        height: 60,
                                        child: ListTile(
                                          leading: Container(
                                            height: 45,
                                            width: 45,
                                            alignment: Alignment.center,
                                            child: CircularProgressIndicator(),
                                          ),
                                          title: Text(
                                            "Please Wait ...",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      )
                                    ],
                                  );
                                },);
                                String? key = database.ref('User').push().key;
                                database.ref('User').child(key!).set({
                                  'name': name,
                                  'Phone': Phone,
                                  'email': email,
                                  'pass': pass,
                                  'key': key
                                });

                                DatabaseEvent dv =
                                    await database.ref('User').once();
                                Map temp = dv.snapshot.value as Map;
                                data.clear();
                                temp.forEach((key, value) {
                                  data.add(value);
                                  print(data);
                                });
                                setState(() {});

                                String NAME = "";
                                String EMAIL = "";
                                for (int i = 0; i < data.length; i++) {
                                  if(name == data[i]['name'] && email == data[i]['email'])
                                    {
                                      NAME = data[i]['name'];
                                      EMAIL = data[i]['email'];
                                      print("NAME : $NAME");
                                      print("EMAIL : $EMAIL");
                                    }

                                }
                                await Model.prefs!
                                    .setString('Name', NAME);
                                await Model.prefs!
                                    .setString('Email', EMAIL);
                                // await Model.prefs!.setString('Mobile', Mobile!);
                                await Model.prefs!.setInt('registered', 1);
                                Navigator.pushReplacement(
                                    context,
                                    PageRouteBuilder(
                                      transitionDuration: Duration(milliseconds: 500),
                                      pageBuilder:
                                          (context, animation, secondaryAnimation) =>
                                          drawerScreen(),
                                      transitionsBuilder: (context, animation,
                                          secondaryAnimation, child) {
                                        return FadeTransition(opacity: animation,child: child,);
                                      },
                                    ));
                              }
                            },
                            child: Container(
                              height: 50,
                              width: 120,
                              alignment: Alignment.center,
                              decoration: ShapeDecoration(
                                  color: Color(0xff250148),
                                  shadows: [
                                    BoxShadow(
                                        blurRadius: 7,
                                        spreadRadius: 1,
                                        offset: Offset(0, 3),
                                        color: Colors.black.withOpacity(0.4))
                                  ],
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              child: Text(
                                "SignUp",
                                style: GoogleFonts.aleo(
                                    textStyle: TextStyle(
                                        color: Color(0xffffffff),
                                        fontSize: 20)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 40,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              showDialog(context: context, builder: (context) {
                                return SimpleDialog(
                                  children: [
                                    Container(
                                      height: 60,
                                      child: ListTile(
                                        leading: Container(
                                          height: 45,
                                          width: 45,
                                          alignment: Alignment.center,
                                          child: CircularProgressIndicator(),
                                        ),
                                        title: Text(
                                          "Please Wait ...",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    )
                                  ],
                                );
                              },);

                              String? Name = "";
                              String? Email = "";
                              String? Mobile = "";

                              signInWithGoogle().then((value) async {
                                print(value);
                                ImagePath = value.user!.photoURL!;
                                Name = value.user!.displayName;
                                Email = value.user!.email;
                                print(ImagePath);
                                print(Name);
                                print(Email);
                                await Model.prefs!.setString('Name', Name!);
                                await Model.prefs!.setString('Email', Email!);
                                // await Model.prefs!.setString('Mobile', Mobile!);
                                await Model.prefs!
                                    .setString('ImagePath', ImagePath);
                                await Model.prefs!.setInt('registered', 1);
                                Navigator.pushReplacement(
                                    context,
                                    PageRouteBuilder(
                                      transitionDuration: Duration(milliseconds: 500),
                                      pageBuilder:
                                          (context, animation, secondaryAnimation) =>
                                          drawerScreen(),
                                      transitionsBuilder: (context, animation,
                                          secondaryAnimation, child) {
                                        return FadeTransition(opacity: animation,child: child,);
                                      },
                                    ));
                              });
                            },
                            child: Container(
                              height: 50,
                              width: 50,
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(10),
                              decoration: ShapeDecoration(
                                  color: Color(0xfffffff8),
                                  shadows: [
                                    BoxShadow(
                                        blurRadius: 7,
                                        spreadRadius: 1,
                                        offset: Offset(0, 3),
                                        color: Colors.black.withOpacity(0.4))
                                  ],
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              child: Image.asset('images/google.png'),
                            ),
                          ),
                          SizedBox(width: 45,)
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;
    paint0.shader = ui.Gradient.linear(
        Offset(size.width * 0.64, 0),
        Offset(size.width, size.height * 0.30),
        [Color(0xff3f006a), Color(0xff1000c8)],
        [0.00, 1.00]);

    Path path0 = Path();
    path0.moveTo(size.width * 0.2823750, 0);
    path0.cubicTo(
        size.width * 0.3023500,
        size.height * 0.0437228,
        size.width * 0.3241750,
        size.height * 0.1089870,
        size.width * 0.5357750,
        size.height * 0.1111144);
    path0.cubicTo(
        size.width * 0.6057000,
        size.height * 0.1131823,
        size.width * 0.6439250,
        size.height * 0.1118731,
        size.width * 0.7152000,
        size.height * 0.1229712);
    path0.cubicTo(
        size.width * 0.7865250,
        size.height * 0.1349470,
        size.width * 0.8024250,
        size.height * 0.1455243,
        size.width * 0.8220500,
        size.height * 0.1918059);
    path0.cubicTo(
        size.width * 0.8308750,
        size.height * 0.2419107,
        size.width * 0.8332250,
        size.height * 0.2545709,
        size.width * 0.8741250,
        size.height * 0.2795489);
    path0.quadraticBezierTo(size.width * 0.9117750, size.height * 0.3012838,
        size.width, size.height * 0.3025037);
    path0.lineTo(size.width, 0);
    path0.quadraticBezierTo(
        size.width * 0.8205938, 0, size.width * 0.2823750, 0);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class RPSCustomPainter1 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;
    paint0.shader = ui.Gradient.linear(
        Offset(0, size.height * 0.87),
        Offset(size.width * 0.58, size.height * 0.87),
        [Color(0xff490e69), Color(0xff1c0e9d)],
        [0.00, 1.00]);

    Path path0 = Path();
    path0.moveTo(0, size.height * 0.7240512);
    path0.quadraticBezierTo(size.width * 0.1232500, size.height * 0.6918430,
        size.width * 0.2829250, size.height * 0.6996682);
    path0.cubicTo(
        size.width * 0.4254750,
        size.height * 0.7078504,
        size.width * 0.4836250,
        size.height * 0.7592942,
        size.width * 0.5225000,
        size.height * 0.8003689);
    path0.cubicTo(
        size.width * 0.5787750,
        size.height * 0.8666745,
        size.width * 0.5573750,
        size.height * 0.9260774,
        size.width * 0.5191250,
        size.height * 0.9604426);
    path0.cubicTo(
        size.width * 0.4808500,
        size.height * 1.0136865,
        size.width * 0.4257375,
        size.height * 1.0183132,
        size.width * 0.4001500,
        size.height * 1.0413721);
    path0.quadraticBezierTo(size.width * 0.3001125, size.height * 1.0413721, 0,
        size.height * 1.0413721);
    path0.lineTo(0, size.height * 0.7240512);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
