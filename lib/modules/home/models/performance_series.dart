// import 'package:flutter/foundation.dart';
// import 'package:charts_flutter/flutter.dart' as charts;

// class PerformanceSeries {
//   final String hours;
//   final double spots;
//   final charts.Color barColor;

//   PerformanceSeries(
//     {
//       required this.hours,
//       required this.spots,
//       required this.barColor
//     }
//   );
// }

import 'package:flutter/painting.dart';
import 'package:flutter/src/material/colors.dart';

class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}

class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double y;
}

class GDPData {
  GDPData(this.continent, this.gdp, this.color);
  final String continent;
  final int gdp;
  final Color color;
}

class PieData {
 PieData(this.xData, this.yData, this.text, );
 final String xData;
 final num yData;
 final String text;
}