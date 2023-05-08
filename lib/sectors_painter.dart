import 'package:flutter/material.dart';
import 'package:touchable/touchable.dart';

class SectorsPainter extends CustomPainter {
  final BuildContext context;
  final String middleText;
  final Function onTap;
  SectorsPainter({@required this.context, @required this.middleText, @required this.onTap});

  @override
  void paint(Canvas canvas, Size size) {
    var myCanvas = TouchyCanvas(context, canvas);

    final Paint paint = Paint()
      ..isAntiAlias = true
      ..strokeWidth = 3.0
      ..style = PaintingStyle.fill;

    final double mainCircleDiameter = size.width;

    final arcsRect = Rect.fromLTWH(0, 0, mainCircleDiameter, mainCircleDiameter);
    final useCenter = true;

    List<Color> sectorColors = [
      Colors.red,
      Colors.orange,
      Colors.yellow,
      Colors.green,
      Colors.teal,
      Colors.blue,
      Colors.indigo,
      Colors.purple,
      Colors.pink,
      Colors.amber
    ];
    List<String> colors = [
      "red",
      "orange",
      "yellow",
      "green",
      "teal",
      "blue",
      "indigo",
      "purple",
      "pink",
      "amber"
    ];

    final double sweepAngle = 0.593412;
    double startAngle = 0.0349066;
    for(int i=0; i<10; i++) {
      myCanvas.drawArc(arcsRect, startAngle, sweepAngle, useCenter,
        paint..color = sectorColors[i], onTapDown: (tapDetail) {
          onTap(colors[i]);
        });
      startAngle = startAngle + sweepAngle + 0.0349066;
    }

    final double innerCircleDiameter = 65;
    Offset circleOffset = Offset(size.width / 2, size.width / 2);
    canvas.drawCircle(
        circleOffset, innerCircleDiameter, paint..color = Colors.white);

    TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: middleText,
        style: TextStyle(
          color: Colors.black,
          fontSize: 17,
          fontWeight: FontWeight.w600
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();

    textPainter.paint(
      canvas,
      Offset(
        (size.width - textPainter.width) / 2,
        (size.height - textPainter.height) / 2,
      ),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
