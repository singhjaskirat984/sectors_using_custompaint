import 'dart:math' as math;
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:touchable/touchable.dart';

enum QuadrantType { topRight, bottomRight, bottomLeft, topLeft }

class QuadrantCirclePainter extends CustomPainter {
  /// UI control variables
  static const double dataItemCircleSize = 48;
  static const double dataIconSize = 24;
  static const double centerCircleSize = 55;
  static const double centerCircleIconSize = 48;

  static const Color topRightQuadrantColor = Colors.red;
  static const Color bottomRightQuadrantColor = Colors.blue;
  static const Color bottomLeftQuadrantColor = Colors.green;
  static const Color topLeftQuadrantColor = Colors.yellow;

  static const Color centerCircleColor = Colors.black;
  static const Color centerCircleIconColor = Colors.white;

  static const Color dataItemsCircleColor = Colors.purple;
  static const Color dataItemIconColor = Colors.white;

  /// Angle variables
  final double left = math.pi;
  final double top = math.pi + math.pi / 2;
  final double right = 0.0;
  final double bottom = math.pi / 2;
  // final double quarterAngle = math.pi / 5; // 1 quadrant = 90 degrees
  final double quarterAngle = 0.593412; // 1 quadrant = 90 degrees

  /// Data variable
  final Map<QuadrantType, List<IconData>> dataItems;
  final BuildContext context;

  QuadrantCirclePainter({@required this.dataItems, @required this.context});

  @override
  void paint(Canvas canvas, Size size) {
    var myCanvas = TouchyCanvas(context, canvas);
    print(math.pi);
    final Paint paint = new Paint()
      ..isAntiAlias = true
      ..strokeWidth = 3.0
      ..style = PaintingStyle.fill;

    final double centerCircleDiameter = centerCircleSize;
    final double outerDiameter = size.width;
    final double outerRadius = outerDiameter / 2;

    double centerX = size.width / 2;
    double centerY = size.height / 2;
    double radius = min(centerX, centerY);
    double angle = 0.593412;

    final arcsRect = Rect.fromLTWH(0, 0, outerDiameter, outerDiameter);
    final useCenter = true;

    double rectSideInsideQuadrant = math.sqrt((outerRadius * outerRadius) / 2);

    // /// DRAW QUADRANTS
    // /// Top Right Quarter
    // canvas.drawArc(arcsRect, top, quarterAngle, useCenter, paint..color = topRightQuadrantColor);
    // /// Bottom Right Quarter
    // canvas.drawArc(arcsRect, 0.0349066, quarterAngle, useCenter, paint..color = bottomRightQuadrantColor);
    // /// Bottom Left Quarter
    // canvas.drawArc(arcsRect, bottom, quarterAngle, useCenter, paint..color = bottomLeftQuadrantColor);
    // /// Top Left Quarter
    // canvas.drawArc(arcsRect, left, quarterAngle, useCenter, paint..color = Color(0xffFFD2B2));

    // canvas.drawArc(arcsRect, 218, quarterAngle, useCenter, paint..color = topLeftQuadrantColor);
    // canvas.drawArc(arcsRect, 317, quarterAngle, useCenter, paint..color = topLeftQuadrantColor);

    // Start from right 0 radians
    // first sector
    myCanvas.drawArc(arcsRect, 0.0349066, quarterAngle, useCenter,
        paint..color = Color(0xffC1EDC9), onTapDown: (tapDetail) {
      print("tapped first emoji smiley");
    });
    // second sector
    myCanvas.drawArc(arcsRect, 0.663225, quarterAngle, useCenter,
        paint..color = Color(0xffFFC4C4));
    // third sector
    myCanvas.drawArc(arcsRect, 1.29154, quarterAngle, useCenter,
        paint..color = Color(0xffD0E1FD));
    // fourth sector
    myCanvas.drawArc(arcsRect, 1.91986, quarterAngle, useCenter,
        paint..color = Color(0xffC1EDC9));
    // fifth sector
    myCanvas.drawArc(arcsRect, 2.54818, quarterAngle, useCenter,
        paint..color = Color(0xffBFE7F0));
    // sixth sector
    myCanvas.drawArc(arcsRect, 3.1765, quarterAngle, useCenter,
        paint..color = Color(0xffFFD2B2));
    // seventh sector
    myCanvas.drawArc(arcsRect, 3.80482, quarterAngle, useCenter,
        paint..color = Color(0xffE5D9F3));
    // eigth sector
    myCanvas.drawArc(arcsRect, 4.43314, quarterAngle, useCenter,
        paint..color = Color(0xffF9E8AC));
    // ninth sector
    myCanvas.drawArc(arcsRect, 5.06145, quarterAngle, useCenter,
        paint..color = Color(0xffF9E8AC));
    // tenth sector
    myCanvas.drawArc(arcsRect, 5.68977, quarterAngle, useCenter,
        paint..color = Color(0xffDBEDA9));

    // /// DRAW CENTER CIRCLE
    Offset circleOffset = Offset(size.width / 2, size.width / 2);
    canvas.drawCircle(
        circleOffset, centerCircleDiameter, paint..color = Colors.white);
    drawIcon(
      canvas,
      Icons.add,
      circleOffset,
      fromCenter: true,
      iconSize: centerCircleIconSize,
      iconColor: centerCircleIconColor,
    );

    // /// DRAW ITEMS in all quadrant bounds
    // for(QuadrantType quadrantType in QuadrantType.values){
    //   populateQuadrantItems(
    //     canvas,
    //     quadrantType,
    //     outerRadius,
    //     rectSideInsideQuadrant,
    //     centerCircleDiameter / 2,
    //   );
    // }
//     final icon = Icons.add;
// TextPainter textPainter = TextPainter(textDirection: TextDirection.rtl);
// textPainter.text = TextSpan(text: String.fromCharCode(icon.codePoint),
//         style: TextStyle(fontSize: 40.0,fontFamily: icon.fontFamily, color: Colors.black));
// textPainter.layout();
// // starting from left 1st
// textPainter.paint(canvas, Offset(size.width/4.5, size.height/7.5));
// // 2
// textPainter.paint(canvas, Offset(size.width/12.5, size.height/3.1));
// // 3
// textPainter.paint(canvas, Offset(size.width/2.25, size.height/18));
// // 4
// textPainter.paint(canvas, Offset(size.width/1.5, size.height/9));
// // 5
// textPainter.paint(canvas, Offset(size.width/1.25, size.height/3.1));
// // 6
// textPainter.paint(canvas, Offset(size.width/14.5, size.height/1.85));
// // 7
// textPainter.paint(canvas, Offset(size.width/1.25, size.height/3.1));
// // 8
// textPainter.paint(canvas, Offset(size.width/4.8, size.height/1.35));
// // 9
// textPainter.paint(canvas, Offset(size.width/2.35, size.height/1.25));
// // 10
// textPainter.paint(canvas, Offset(size.width/1.55, size.height/1.35));
// Add text to each sector

    final List<String> labels = [
      '😃', 
      '😡', 
      '😰', 
      '🤢', 
      '😞', 
      '😩', 
      '😕', 
      '😍', 
      '😐', 
      '🙂'  
    ];
    for (int i = 0; i < 3; i++) {
      double textAngle = (i * angle) + (angle / 2);
      TextSpan span = TextSpan(
        style: TextStyle(color: Colors.black, fontSize: 25),
        text: labels[i],
      );
      TextPainter textPainter = TextPainter(
        text: span,
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      double textX = 0.0;
      double textY = 0.0;
      switch (i) {
        case 0:
          textX = centerX +
              (radius / 1.3) * cos(textAngle) -
              (textPainter.width / 2);
          textY = centerY +
              (radius / 1.2) * sin(textAngle) -
              (textPainter.height / 2);
          break;
        case 1:
          textX = centerX +
              (radius / 1.4) * cos(textAngle) -
              (textPainter.width / 2);
          textY = centerY +
              (radius / 1.2) * sin(textAngle) -
              (textPainter.height / 2);
          break;
        case 2:
          textX =
              centerX + (radius / 1.0) * cos(textAngle) - (textPainter.width);
          textY = centerY +
              (radius / 1.3) * sin(textAngle) -
              (textPainter.height / 2);
          break;
      }
      Offset textOffset = Offset(textX, textY);
      textPainter.paint(canvas, textOffset);
    }

    for (int i = 3; i < 6; i++) {
      double textAngle = (i * angle) + (angle / 2);
      TextSpan span = TextSpan(
        style: TextStyle(color: Colors.black, fontSize: 25),
        text: labels[i],
      );
      TextPainter textPainter = TextPainter(
        text: span,
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      double textX = 0.0;
      double textY = 0.0;
      switch (i) {
        case 3:
          textX = centerX +
              (radius / 1.13) * cos(textAngle) -
              (textPainter.width / 1.5);
          textY = centerY +
              (radius / 1.3) * sin(textAngle) -
              (textPainter.height / 1.3);
          break;
        case 4:
          textX = centerX +
              (radius / 1.2) * cos(textAngle) -
              (textPainter.width / 2);
          textY =
              centerY + (radius / 1.4) * sin(textAngle) - (textPainter.height);
          break;
        case 5:
          textX = centerX +
              (radius / 1.3) * cos(textAngle) -
              (textPainter.width / 2);
          textY =
              centerY + (radius / 0.8) * sin(textAngle) - (textPainter.height);
          break;
      }
      Offset textOffset = Offset(textX, textY);
      textPainter.paint(canvas, textOffset);
    }
    for (int i = 6; i < 10; i++) {
      double textAngle = (i * angle) + (angle / 2);
      TextSpan span = TextSpan(
        style: TextStyle(color: Colors.black, fontSize: 25),
        text: labels[i],
      );
      TextPainter textPainter = TextPainter(
        text: span,
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      double textX = 0.0;
      double textY = 0.0;
      switch (i) {
        case 6:
          textX = centerX +
              (radius / 1.5) * cos(textAngle) -
              (textPainter.width / 3);
          textY =
              centerY + (radius / 1.2) * sin(textAngle) - (textPainter.height);
          break;
        case 7:
          textX = centerX +
              (radius / 5.5) * cos(textAngle) -
              (textPainter.width / 4);
          textY = centerY +
              (radius / 1.25) * sin(textAngle) -
              (textPainter.height / 2);
          break;
        case 8:
          textX = centerX +
              (radius / 0.8) * cos(textAngle) -
              (textPainter.width / 4);
          textY = centerY +
              (radius / 1.5) * sin(textAngle) -
              (textPainter.height / 2);
          break;
        case 9:
          textX = centerX +
              (radius / 1.15) * cos(textAngle) -
              (textPainter.width / 4);
          textY = centerY +
              (radius / 2.2) * sin(textAngle) -
              (textPainter.height / 4);
          break;
      }
      Offset textOffset = Offset(textX, textY);
      textPainter.paint(canvas, textOffset);
    }
  }

  /// Function to calculate the bounds of each quadrant that can be suitable to put icons inside
  Rect getQuadrantDrawableBounds(
    QuadrantType quadrantType,
    double quadrantRadius,
    double rectSizeOfQuadrantBound,
    double centerCircleRadius,
  ) {
    Offset offset = Offset(0, 0);
    switch (quadrantType) {
      case QuadrantType.topRight:
        offset = Offset(quadrantRadius + centerCircleRadius,
            quadrantRadius - rectSizeOfQuadrantBound);
        break;
      case QuadrantType.bottomRight:
        offset = Offset(quadrantRadius + centerCircleRadius + 8,
            quadrantRadius + centerCircleRadius + 8);
        break;
      case QuadrantType.bottomLeft:
        offset = Offset(quadrantRadius - rectSizeOfQuadrantBound,
            quadrantRadius + centerCircleRadius);
        break;
      case QuadrantType.topLeft:
      default:
        offset = Offset(quadrantRadius - rectSizeOfQuadrantBound,
            quadrantRadius - rectSizeOfQuadrantBound);
        break;
    }
    return Rect.fromLTWH(
      offset.dx,
      offset.dy,
      rectSizeOfQuadrantBound - centerCircleRadius,
      rectSizeOfQuadrantBound - centerCircleRadius,
    );
  }

  /// Add items inside for a quadrant within the respective quadrant bounds
  void populateQuadrantItems(
    Canvas canvas,
    QuadrantType quadrantType,
    double outerRadius,
    double rectSideInsideQuadrant,
    double centerCircleRadius,
  ) {
    Rect quadrantBounds = getQuadrantDrawableBounds(
      quadrantType,
      outerRadius,
      rectSideInsideQuadrant,
      centerCircleRadius,
    );
    addItemsToRect(
        canvas, quadrantBounds, dataItems[quadrantType], dataItemCircleSize);
  }

  /// Add data items inside the given bounds
  void addItemsToRect(
    Canvas canvas,
    Rect rect,
    List<IconData> items,
    double itemSize,
  ) {
    final Paint paint = new Paint()
      ..isAntiAlias = true
      ..strokeWidth = 1.0
      ..color = dataItemsCircleColor
      ..style = PaintingStyle.fill;

    int fitHorizontal = (rect.width / itemSize).floor();
    int fitVertical = (rect.height / itemSize).floor();

    int totalFit = fitHorizontal * fitVertical;

    int rowNumber = 0;
    int colNumber = 0;
    for (int i = 0; i < math.min(totalFit, items.length); i++) {
      if (colNumber >= fitHorizontal) {
        colNumber = 0;
        rowNumber += 1;
      }
      var leftOffset = colNumber * itemSize;
      var topOffset = rowNumber * itemSize;
      Offset offset = Offset(rect.left + leftOffset, rect.top + topOffset);

      /// Draw icon background circles
      Rect itemRect = Rect.fromLTWH(offset.dx, offset.dy, itemSize, itemSize);
      canvas.drawOval(itemRect, paint);

      /// Draw icons inside circles
      double iconPushFactor = ((itemSize - dataIconSize) / 2);
      drawIcon(
        canvas,
        items[i],
        Offset(offset.dx + iconPushFactor, offset.dy + iconPushFactor),
        iconSize: dataIconSize,
        iconColor: dataItemIconColor,
      );

      colNumber++;
    }
  }

  /// Utility function to draw an icon at given position offset in circle
  void drawIcon(
    Canvas canvas,
    IconData iconData,
    Offset offset, {
    bool fromCenter = false,
    double iconSize = 40,
    Color iconColor = Colors.white,
  }) {
    TextPainter textPainter = TextPainter(textDirection: TextDirection.rtl);
    textPainter.text = TextSpan(
        text: String.fromCharCode(iconData.codePoint),
        style: TextStyle(
            fontSize: iconSize,
            fontFamily: iconData.fontFamily,
            color: iconColor));
    textPainter.layout();
    if (fromCenter) {
      offset = Offset(offset.dx - (iconSize / 2), offset.dy - (iconSize / 2));
    }
    textPainter.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
