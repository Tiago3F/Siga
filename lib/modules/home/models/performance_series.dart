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

class GDPData {
  GDPData(this.items, this.valor, this.color);
  final String items;
  final int valor;
  final Color color;
}
