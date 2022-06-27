import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class StackedAreaLineChart extends StatelessWidget {
  final List<charts.Series<dynamic, int>> seriesList;
  final bool animate;

  StackedAreaLineChart(this.seriesList, {required this.animate});

  /// Creates a [LineChart] with sample data and no transition.
  factory StackedAreaLineChart.withSampleData() {
    return StackedAreaLineChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return charts.LineChart(seriesList,
        defaultRenderer: charts.LineRendererConfig(
            includeArea: true,
            stacked: true,
            roundEndCaps: true,
            includeLine: true),
        animate: animate);
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<LinearSales, int>> _createSampleData() {
    final myFakeDesktopData = [
      LinearSales(0, 5, "teste"),
      LinearSales(1, 25, "teste"),
      LinearSales(2, 100, "teste"),
      LinearSales(3, 75, "teste"),
    ];

    var myFakeTabletData = [
      LinearSales(0, 10, "teste"),
      LinearSales(1, 50, "teste"),
      LinearSales(2, 200, "teste"),
      LinearSales(3, 150, "teste"),
    ];

    var myFakeMobileData = [
      LinearSales(0, 15, "teste"),
      LinearSales(1, 75, "teste"),
      LinearSales(2, 300, "teste"),
      LinearSales(3, 225, "teste"),
    ];

    return [
      charts.Series<LinearSales, int>(
        id: 'Desktop',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        keyFn: (LinearSales textoo, _) => textoo.textoo,
        overlaySeries: true,
        data: myFakeDesktopData,
      ),
      charts.Series<LinearSales, int>(
        id: 'Tablet',
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: myFakeTabletData,
      ),
      charts.Series<LinearSales, int>(
        id: 'Mobile',
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: myFakeMobileData,
      ),
    ];
  }
}

/// Sample linear data type.
class LinearSales {
  final int year;
  final int sales;
  final String textoo;
  LinearSales(this.year, this.sales, this.textoo);
}

class PerformanceGraficLinePanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.all(10),
          child: StackedAreaLineChart.withSampleData()),
    );
  }
}
