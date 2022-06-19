import 'package:flutter/cupertino.dart';
import 'dart:ui' as ui;

class HeaderCurvo extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderCurvoPainter(),
      ),
    );
  }
}

class _HeaderCurvoPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = new Paint();

    //Propiedades
    lapiz.color = Color.fromARGB(255, 84, 200, 230);

    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 10;

    final path = new Path();

    //Dibujar con el path y el lapiz
    path.lineTo(0, size.height * 0.75);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.8, size.width * 0.45, size.height * 0.76);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.68, size.width, size.height * 0.73);
    path.lineTo(size.width, 0);
    // path.lineTo(size.width * 0.5, size.height * 0.30);
    // path.lineTo(size.width, size.height * 0.25);
    // path.lineTo(size.width, 0);

    canvas.drawPath(path, lapiz);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

}

class HeaderCurvo2 extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderCurvoPainter2(),
      ),
    );
  }
}

class _HeaderCurvoPainter2 extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = new Paint();

    //Propiedades
    lapiz.color = Color.fromARGB(255, 168, 122, 177);
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 10;

    final path = new Path();

    //Dibujar con el path y el lapiz
    path.lineTo(0, size.height * 0.75);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.8, size.width * 0.5, size.height * 0.75);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.7, size.width, size.height * 0.75);
    path.lineTo(size.width, 0);
    // path.lineTo(size.width * 0.5, size.height * 0.30);
    // path.lineTo(size.width, size.height * 0.25);
    // path.lineTo(size.width, 0);

    canvas.drawPath(path, lapiz);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

}