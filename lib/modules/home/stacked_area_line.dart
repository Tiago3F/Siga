import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'models/performance_series.dart';

class _MyHomePage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  _MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<_MyHomePage> {
  late List<ChartData> _chartData;
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  // @override
  // void initState() {
  //   data = [
  //     ChartData('CHN', 12),
  //     ChartData('GER', 15),
  //     ChartData('RUS', -30),
  //     ChartData('BRZ', 6.4),
  //     ChartData('IND', 14)
  //   ];
  //   _tooltip = TooltipBehavior(enable: true);
  //   super.initState();
  // }

  // Itens do gráfico
  List<ChartData> getChartData() {
    final List<ChartData> chartData = [
      ChartData('08:04:13', 45, Color(0xFF0386c6)),
      ChartData('08:12:20', -10, Color(0xFF0386c6)),
      ChartData('08:13:20', -10, Color(0xFF0386c6)),
      ChartData('08:14:20', -10, Color(0xFF0386c6)),
      ChartData('08:15:20', -10, Color(0xFF0386c6)),
      ChartData('08:17:20', -10, Color(0xFF0386c6)),
      ChartData('08:19:20', -10, Color(0xFF0386c6)),
      ChartData('08:11:20', -10, Color(0xFF0386c6)),
      ChartData('08:11:20', -10, Color(0xFF0386c6)),
      ChartData('Rechamada', 22, Color(0xFFf91919)),
      ChartData('Satisfação no Atendimento', -90, Color(0xFF359928)),
      ChartData('Índice de Resolução', 74, Color(0xFFf3c056)),
      ChartData('Pontuação', 61, Color(0xFFb130c8)),
      ChartData('Monitoria de Qualidade', 99, Color(0xFF20eeff)),
    ];
    return chartData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SfCartesianChart(
            onLegendItemRender: (LegendRenderArgs args) => legend(args),
            legend: Legend(
              isVisible: true,
              overflowMode: LegendItemOverflowMode.wrap,
              position: LegendPosition.bottom,
              iconWidth: 10,
              iconHeight: 10,
              isResponsive: true,
            ),
            primaryXAxis: CategoryAxis(),
            primaryYAxis: NumericAxis(),
            tooltipBehavior: _tooltipBehavior,
            series: <ChartSeries<ChartData, String>>[
          ColumnSeries<ChartData, String>(
            dataSource: _chartData,
            xValueMapper: (ChartData data, _) => data.x,
            yValueMapper: (ChartData data, _) => data.y,
            dataLabelMapper: (ChartData data, _) => data.x,
            sortFieldValueMapper: (ChartData data, _) => data.x,
            enableTooltip: true,
            pointColorMapper: (ChartData data, _) => data.color,
          )
        ]));
  }
}

// Controle de icones da legenda
void legend(LegendRenderArgs args) {
  args.legendIconType = LegendIconType.circle;
}

class PerformanceGraficLinePanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.all(10),
          child: _MyHomePage()),
    );
  }
}
