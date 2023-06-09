import 'package:flutter/material.dart';
import 'package:quadcircle/quadrant_circle/quadrant_circle_painter.dart';
import 'package:touchable/touchable.dart';

class QuadrantGraphWidget extends StatelessWidget {

  final Map<QuadrantType, List<IconData>> items = {
    QuadrantType.topRight: [Icons.airplanemode_active, Icons.drive_eta, Icons.local_shipping],
    QuadrantType.bottomRight: [Icons.airplanemode_active],
    QuadrantType.bottomLeft: [Icons.music_note, Icons.subscriptions],
    QuadrantType.topLeft: [Icons.bookmark, Icons.extension, Icons.explore, Icons.landscape, Icons.adb],
  };

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.center,
        child: CanvasTouchDetector(
          gesturesToOverride: [GestureType.onTapDown],
          builder: (context) {
            return CustomPaint(
              painter: QuadrantCirclePainter(dataItems: items, context: context),
              size: Size(screenWidth, screenWidth),
            );
          }
        ),
      ),
    );
  }
}