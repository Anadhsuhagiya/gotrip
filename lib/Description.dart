
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'Model.dart';

class desc extends StatefulWidget {
  int index;

  desc(this.index);

  @override
  State<desc> createState() => _descState();
}

class _descState extends State<desc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Car Details",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          centerTitle: true,
          backgroundColor: Color(0xff250148),
        ),
        body: Stack(
          children: [
            CustomPaint(
              size: Size(double.infinity,(double.infinity*0.5601583862304688).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
              painter: RPSCustomPainter(),
            ),
            Positioned(
              top: 50,
              left: 20,
              child: Image.asset('${Model.car_images[widget.index]}'),
              height: 150,
              width: 300,
            ),
            Positioned(
              top: 200,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  Text(
                    "${Model.car_name[widget.index]}",
                    style: TextStyle(fontSize: 30, color: Color(0xff250148)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Automatic",
                    style: TextStyle(fontSize: 17, color: Color(0xff707070)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "${Model.car_price[widget.index]}",
                    style: TextStyle(
                        fontSize: 22,
                        color: Color(0xff471581),
                        letterSpacing: 1),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 2),
                    child: Text(
                      "${Model.car_description[widget.index]}",
                      style: TextStyle(
                          fontSize: 17,
                          color: Color(0xff000000),
                          letterSpacing: 1),
                    ),
                  ),
                  SizedBox(
                    height: 45,
                  ),
                  Container(
                    height: 50,
                    width: 200,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 10,
                          offset: Offset(2, 4),
                          spreadRadius: -3,
                          blurStyle: BlurStyle.normal
                        )
                      ],
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xff471581),
                    ),
                    child: Text("Add Cart",style: TextStyle(color: Colors.white,fontSize: 20),),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}


class RPSCustomPainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {



    Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;
    paint0.shader = ui.Gradient.linear(Offset(size.width*0.50,size.height*0.90),Offset(size.width*0.50,size.height*0.07),[Color(0xffaaa9a9),Color(0xfff0f0f0)],[0.00,1.00]);

    Path path0 = Path();
    path0.moveTo(size.width*0.0503000,size.height*0.2681087);
    path0.quadraticBezierTo(size.width*0.0490750,size.height*0.7031493,size.width*0.0490000,size.height*0.8482571);
    path0.quadraticBezierTo(size.width*0.0445500,size.height*0.8951337,size.width*0.1249500,size.height*0.8928873);
    path0.lineTo(size.width*0.8754750,size.height*0.8928725);
    path0.quadraticBezierTo(size.width*0.9516250,size.height*0.8924857,size.width*0.9505250,size.height*0.8482571);
    path0.cubicTo(size.width*0.9505250,size.height*0.6660170,size.width*0.9495750,size.height*0.3018194,size.width*0.9495750,size.height*0.1195793);
    path0.cubicTo(size.width*0.9558250,size.height*0.0713489,size.width*0.8986000,size.height*0.0748151,size.width*0.8745750,size.height*0.0745622);
    path0.cubicTo(size.width*0.6688250,size.height*0.0824618,size.width*0.5866000,size.height*0.2803374,size.width*0.1255500,size.height*0.2237462);
    path0.quadraticBezierTo(size.width*0.0438000,size.height*0.2164269,size.width*0.0503000,size.height*0.2681087);
    path0.close();

    canvas.drawPath(path0, paint0);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}





