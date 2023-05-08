import 'package:flutter/material.dart';
import 'package:quadcircle/sectors_painter.dart';
import 'package:touchable/touchable.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sectors Painter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Sectors Painter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String middleText = "Sector";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.center,
        child: CanvasTouchDetector(
         gesturesToOverride: [GestureType.onTapDown],
          builder: (context) { 
            return CustomPaint(
            painter: SectorsPainter(context: context, middleText: middleText, onTap: (color) {
              setState(() {
                middleText = color;
              });
            }),
            size: Size(350, 350),
          );
          }
        ),
      ),
    );
  }
}
