import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


class DoughNutChart extends StatefulWidget {
  const DoughNutChart({Key key}) : super(key: key);

  @override
  State<DoughNutChart> createState() => _DoughNutChartState();
}

class _DoughNutChartState extends State<DoughNutChart> {
  final List<ChartData> chartData = [
            ChartData('David', 25, Color.fromRGBO(9,0,136,1)),
            ChartData('Steve', 38, Color.fromRGBO(147,0,119,1)),
            ChartData('Jack', 34, Color.fromRGBO(228,0,124,1)),
            ChartData('Others', 52, Color.fromRGBO(255,189,57,1))
        ];
  @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: Center(
                child: Container(
                    child: SfCircularChart(
                        series: <CircularSeries>[
                            DoughnutSeries<ChartData, String>(
                                dataSource: chartData,
                                xValueMapper: (ChartData data, _) => data.x,
                                yValueMapper: (ChartData data, _) => data.y,
                                pointColorMapper: (ChartData data, _) => data.color,
                                // Radius of doughnut
                                radius: '50%'
                            )
                        ]
                    )
                )
            )
        );
    }
}

 class ChartData {
        ChartData(this.x, this.y, [this.color]);
            final String x;
            final double y;
            final Color color;
    }