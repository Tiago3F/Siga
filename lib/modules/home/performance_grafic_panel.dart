import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'models/performance_series.dart';

class StackedAreaCustomColorLineChart extends StatefulWidget {
  @override
  State<StackedAreaCustomColorLineChart> createState() =>
      _StackedAreaCustomColorLineChartState();
}

class _StackedAreaCustomColorLineChartState
    extends State<StackedAreaCustomColorLineChart> {
  late List<GDPData> _chartData;
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SfCircularChart(
      title:
          ChartTitle(text: 'Continent wise GDP - 2021 \n (in billions of USD)'),
      legend:
          Legend(isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
      tooltipBehavior: _tooltipBehavior,
      series: <CircularSeries>[
        RadialBarSeries<GDPData, String>(
            dataSource: _chartData,
            xValueMapper: (GDPData data, _) => data.continent,
            yValueMapper: (GDPData data, _) => data.gdp,
            pointColorMapper: (GDPData data, _) => data.color,
            dataLabelSettings: DataLabelSettings(isVisible: true),
            enableTooltip: true,
            useSeriesColor: true,
           
            trackOpacity: 0.3,
            cornerStyle: CornerStyle.bothCurve,
            maximumValue: 40000)
      ],
    )));
  }

  List<GDPData> getChartData() {
    final List<GDPData> chartData = [
      GDPData('Oceania', 1600, Colors.red),
      GDPData('Africa', 2490,  Colors.red),
      GDPData('S America', 2900,  Colors.red),
      GDPData('Europe', 23050,  Colors.red),
      GDPData('N America', 24880,  Colors.red),
      GDPData('Asia', 34390,  Colors.red),
    ];
    return chartData;
  }
}

class PerformanceGraficPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.all(10),
          child: StackedAreaCustomColorLineChart()),
    );
  }
}
