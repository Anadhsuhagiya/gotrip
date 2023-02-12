import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gotrip/Categories/Countries.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:story_view/story_view.dart';
import 'package:story_view/widgets/story_view.dart';

import 'Model.dart';
import 'Story.dart';

class Home extends StatefulWidget {
  String imagePath;
  String name;
  String email;

  Home(this.imagePath, this.name, this.email);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String title;
  GlobalKey<SliderDrawerState> _key = GlobalKey<SliderDrawerState>();

  TextEditingController Search = TextEditingController();
  StoryController storyController = StoryController();

  int status = 0;

  Connectivity _connectivity = Connectivity();

  checkRealTimeConnection() {
    _connectivity.onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.mobile) {
        status = 1;
        // I am connected to a mobile network.
      } else if (event == ConnectivityResult.wifi) {
        status = 1;
        // I am connected to a wifi network.
      } else {
        status = 0;
      }
      setState(() {});
    });
  }

  snack() {
    if (status == 1) {
      final snackbar = SnackBar(
        /// need to set following properties for best effect of awesome_snackbar_content
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          title: 'On Snap!',
          message: 'Back Online',

          /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
          contentType: ContentType.success,
        ),
      );
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackbar);
    } else if (status == 0) {
      final snackbar = SnackBar(
        /// need to set following properties for best effect of awesome_snackbar_content
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          title: 'On Snap!',
          message: 'Not Connected',

          /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
          contentType: ContentType.failure,
        ),
      );
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackbar);
    }
    ;
    setState(() {});
  }

  @override
  void initState() {
    title = "Home";
    super.initState();
    checkRealTimeConnection();
  }

  Future<bool?> toas() {
    checkRealTimeConnection();
    return status == 1
        ? Fluttertoast.showToast(
            msg: "Back Online",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 15.0)
        : Fluttertoast.showToast(
            msg: "Not Connected",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 15.0);
    setState(() {});
  }

  int _counter = 0;
  bool isOpened = false;

  final GlobalKey<SideMenuState> _sideMenuKey = GlobalKey<SideMenuState>();
  final GlobalKey<SideMenuState> _endSideMenuKey = GlobalKey<SideMenuState>();

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  toggleMenu([bool end = false]) {
    if (end) {
      final _state = _endSideMenuKey.currentState!;
      if (_state.isOpened) {
        _state.closeSideMenu();
      } else {
        _state.openSideMenu();
      }
    } else {
      final _state = _sideMenuKey.currentState!;
      if (_state.isOpened) {
        _state.closeSideMenu();
      } else {
        _state.openSideMenu();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return
        // SideMenu(
        //     key: _endSideMenuKey,
        //     inverse: false,
        //     // start side menu
        //     background: Color(0xffa9e6ef),
        //     type: SideMenuType.slideNRotate,
        //     menu: Padding(
        //       padding: const EdgeInsets.only(left: 25.0),
        //       child: buildMenu(),
        //     ),
        //     onChange: (_isOpened) {
        //       setState(() => isOpened = _isOpened);
        //     },
        //     child:
        MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'arial',
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        // appBar: AppBar(
        //   flexibleSpace: Container(
        //     decoration: BoxDecoration(
        //         gradient: LinearGradient(
        //             colors: [Color(0xff06b5d7), Color(0xff6dd9ef)])),
        //   ),
        //   title: Text(
        //     "Big Show Room",
        //     style: TextStyle(
        //         color: Colors.white,
        //         fontSize: 25,
        //         letterSpacing: 1,
        //         shadows: [
        //           Shadow(
        //               color: Colors.black, offset: Offset(2, 3), blurRadius: 13)
        //         ]),
        //   ),
        //   centerTitle: true,
        // ),
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xff06b5d7), Color(0xff6dd9ef)])),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
            ),
            onPressed: () {
              if (ZoomDrawer.of(context)!.isOpen()) {
                ZoomDrawer.of(context)!.close();
              } else {
                ZoomDrawer.of(context)!.open();
              }
            },
          ),
          title: Text("GoTrip",
              style: GoogleFonts.signikaNegative(
                  textStyle: TextStyle(fontSize: 22, color: Colors.black))),
        ),
        body: Builder(
          builder: (context) {
            toas();
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 200,
                    width: double.infinity,
                    margin: EdgeInsets.only(
                        left: 10, right: 10, bottom: 10, top: 20),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://www.oyorooms.com/travel-guide/wp-content/uploads/2021/07/DestinationsNearDelhi_1-1.jpg'),
                          opacity: 0.20,
                          fit: BoxFit.fill),
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                          colors: [Color(0xff7addf6), Color(0xffb7e2f5)]),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 20,
                          offset: Offset(2, 5),
                          spreadRadius: -10,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            "Search The Efficient Goal",
                            style: GoogleFonts.signikaNegative(
                                textStyle: TextStyle(
                                    fontSize: 24, color: Colors.black)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(0),
                          child: Text(
                            " Enjoy the Life ",
                            style: TextStyle(color: Colors.black, fontSize: 15),
                          ),
                        ),
                        Container(
                            height: 55,
                            width: double.infinity,
                            margin:
                                EdgeInsets.only(left: 10, right: 10, top: 30),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 20,
                                  offset: Offset(2, 4),
                                  spreadRadius: -10,
                                )
                              ],
                              borderRadius: BorderRadius.circular(40),
                              gradient: LinearGradient(colors: [
                                Color(0xffe7e7e7),
                                Color(0xffffffff)
                              ]),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: TextField(
                                onChanged: (value) {},
                                controller: Search,
                                keyboardType: TextInputType.text,
                                cursorColor: Color(0xff000000),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  prefixIcon: Icon(
                                    Icons.search,
                                    color: Colors.black,
                                  ),
                                  hintText: "Search",
                                  hintStyle: TextStyle(fontSize: 18),
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          "Categories",
                          style: GoogleFonts.signikaNegative(
                              textStyle:
                                  TextStyle(fontSize: 25, color: Colors.black)),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 120,
                    width: double.infinity,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: Model.Category.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                PageRouteBuilder(
                                  transitionDuration:
                                      Duration(milliseconds: 500),
                                  pageBuilder: (context, animation,
                                          secondaryAnimation) =>
                                      Countries(Model.Category, index,
                                          Model.Category_Name),
                                  transitionsBuilder: (context, animation,
                                      secondaryAnimation, child) {
                                    return FadeTransition(
                                      opacity: animation,
                                      child: child,
                                    );
                                  },
                                ));
                          },
                          child: Container(
                            margin: EdgeInsets.all(6),
                            padding: EdgeInsets.all(7),
                            height: 100,
                            width: 90,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                                  Color(0xff9ce2f5),
                                  Color(0xffebf1f5)
                                ]),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black,
                                      spreadRadius: -20,
                                      offset: Offset(2, 4),
                                      blurRadius: 20)
                                ]),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    child: Image.network(
                                  "${Model.Category[index]}",
                                )),
                                Text(
                                  "${Model.Category_Name[index]}",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 13),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10, top: 30, bottom: 0),
                    child: Row(
                      children: [
                        Text(
                          "Offers",
                          style: GoogleFonts.signikaNegative(
                              textStyle:
                                  TextStyle(fontSize: 25, color: Colors.black)),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 210,
                    width: double.infinity,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: Model.offers.length,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 200,
                          width: 300,
                          margin:
                              EdgeInsets.only(top: 10, left: 10, bottom: 10),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage("${Model.offers[index]}"),
                                  fit: BoxFit.cover),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black,
                                    spreadRadius: -20,
                                    offset: Offset(2, 4),
                                    blurRadius: 20)
                              ]),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10, top: 20, bottom: 10),
                    child: Row(
                      children: [
                        Text(
                          "Story",
                          style: GoogleFonts.signikaNegative(
                              textStyle:
                                  TextStyle(fontSize: 25, color: Colors.black)),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 500,
                    child: MasonryGridView.count(
                      itemCount: Model.Story_photos.length,
                      scrollDirection: Axis.vertical,
                      crossAxisCount: 2,
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 15,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            print("Story");
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return Story(index);
                              },
                            ));
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      spreadRadius: 20,
                                      color: Colors.black,
                                      offset: Offset(2, 4),
                                      blurRadius: 10,
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(20)),
                              child: Column(
                                children: [
                                  Image.network('${Model.Story_photos[index]}'),
                                  Row(
                                    children: [
                                      Container(
                                        height: 14,
                                        width: 45,
                                        margin: EdgeInsets.only(
                                            top: 5, left: 10, bottom: 5),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            gradient: LinearGradient(colors: [
                                              Color(0xff040f73),
                                              Color(0xff00c7fc)
                                            ]),
                                            borderRadius:
                                                BorderRadius.circular(3)),
                                        child: Text(
                                          "JUST IN",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Text(
                                          "${Model.Story_Title[index]}",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 13),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 11),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                        //   Container(
//   height: 250,
//   margin: EdgeInsets.only(top: 5,left: 5),
//   width: double.infinity/2,
//   decoration: BoxDecoration(
//     borderRadius: BorderRadius.circular(20),
//     color: Colors.white,
//     boxShadow: [
//       BoxShadow(
//         blurRadius: 20,
//         offset: Offset(2, 4),
//         color: Colors.black,
//         spreadRadius: -10
//       ),
//
//     ]
//   ),
// );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),

        //  Different slider Drawer example

        // SliderDrawer(
        //     appBar: SliderAppBar(
        //         title: Text("GoTrip",
        //             style: const TextStyle(
        //                 fontSize: 22, fontWeight: FontWeight.w700))),
        //     key: _key,
        //     sliderOpenSize: 179,
        //     slider: _SliderView(
        //       // onItemClick: (title) {
        //       //   _key.currentState!.closeSlider();
        //       //   setState(() {
        //       //     this.title = title;
        //       //   });
        //       // },
        //     ),
        //     child:
        //     )
      ),
    );
  }

  Widget buildMenu() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 50.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.black),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black,
                            blurRadius: 20,
                            offset: Offset(2, 4),
                            spreadRadius: -5)
                      ],
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage('images/qwerty.jpg'),
                          fit: BoxFit.cover)),
                ),
                // CircleAvatar(
                //   backgroundColor: Colors.white,
                //   child: Image(image: AssetImage('image/anadh.jpg')),
                //   radius: 40.0,
                // ),
                SizedBox(height: 16.0),
                Text(
                  "Hello, Anadh Suhagiya",
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(height: 20.0),
              ],
            ),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.home, size: 20.0, color: Colors.black),
            title: const Text(
              "Home",
              style: TextStyle(color: Colors.black),
            ),
            textColor: Colors.white,
            dense: true,
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.verified_user,
                size: 20.0, color: Colors.black),
            title: const Text(
              "Profile",
              style: TextStyle(color: Colors.black),
            ),
            textColor: Colors.white,
            dense: true,

            // padding: EdgeInsets.zero,
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.monetization_on,
                size: 20.0, color: Colors.black),
            title: const Text(
              "Wallet",
              style: TextStyle(color: Colors.black),
            ),
            textColor: Colors.white,
            dense: true,

            // padding: EdgeInsets.zero,
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.shopping_cart,
                size: 20.0, color: Colors.black),
            title: const Text(
              "Cart",
              style: TextStyle(color: Colors.black),
            ),
            textColor: Colors.white,
            dense: true,

            // padding: EdgeInsets.zero,
          ),
          ListTile(
            onTap: () {},
            leading:
                const Icon(Icons.star_border, size: 20.0, color: Colors.black),
            title: const Text(
              "Favorites",
              style: TextStyle(color: Colors.black),
            ),
            textColor: Colors.white,
            dense: true,

            // padding: EdgeInsets.zero,
          ),
          ListTile(
            onTap: () {},
            leading:
                const Icon(Icons.settings, size: 20.0, color: Colors.black),
            title: const Text(
              "Settings",
              style: TextStyle(color: Colors.black),
            ),
            textColor: Colors.white,
            dense: true,
            // padding: EdgeInsets.zero,
          ),
        ],
      ),
    );
  }
}

// class _SliderView extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.white,
//       padding: const EdgeInsets.only(top: 30),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: <Widget>[
//           SizedBox(
//             height: 30,
//           ),
//           CircleAvatar(
//             radius: 65,
//             backgroundColor: Colors.grey,
//             child: CircleAvatar(
//               radius: 60,
//               backgroundImage: AssetImage('images/anadh.jpg'),
//             ),
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           Text(
//             'Anadh Suhagiya',
//             style: TextStyle(
//                 color: Colors.black,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 20,
//                 fontFamily: 'BalsamiqSans'),
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           _SliderMenuItem(
//               title: 'Home', iconData: Icons.home, onTap: (p0) {
//
//                 Navigator.push(context, MaterialPageRoute(builder: (context) {
//                   return Home();
//                 },));
//               },),
//           _SliderMenuItem(
//               title: 'Notification',
//               iconData: Icons.notifications_active,
//               onTap: (p0) {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) {
//                   return Home();
//                 },));
//               },),
//           _SliderMenuItem(
//               title: 'Likes', iconData: Icons.favorite, onTap: (p0) {
//             Navigator.push(context, MaterialPageRoute(builder: (context) {
//               return Home();
//             },));
//               },),
//           _SliderMenuItem(
//               title: 'Setting', iconData: Icons.settings, onTap: (p0) {
//             Navigator.push(context, MaterialPageRoute(builder: (context) {
//               return Settings();
//             },));
//               },),
//           _SliderMenuItem(
//               title: 'LogOut',
//               iconData: Icons.arrow_back_ios,
//               onTap: (p0) {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) {
//                   return Login_page();
//                 },));
//               },),
//         ],
//       ),
//     );
//   }
// }
//
// class _SliderMenuItem extends StatelessWidget {
//   final String title;
//   final IconData iconData;
//   final Function(String)? onTap;
//
//   const _SliderMenuItem(
//       {Key? key,
//         required this.title,
//         required this.iconData,
//         required this.onTap})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//         title: Text(title,
//             style: TextStyle(
//                 color: Colors.black, fontFamily: 'BalsamiqSans_Regular')),
//         leading: Icon(iconData, color: Colors.black),
//         onTap: () => onTap?.call(title));
//   }
// }
