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
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true, header: "Dados");
    super.initState();
  }

  // Itens do gráfico
  final List<ChartData> chartDataFeitas = [
    ChartData('08:04:13', 8, Color(0xFF0dcc90)),
    ChartData('08:06:13', -2, Color(0xFFff5541)),
    ChartData('08:08:13', 4, Color(0xFF0dcc90)),
    ChartData('08:09:13', -6, Color(0xFFff5541)),
    ChartData('08:10:13', 7, Color(0xFF0dcc90)),
    ChartData('08:11:13', 3, Color(0xFF0dcc90)),
    ChartData('08:12:13', -1, Color(0xFFff5541)),
    ChartData('08:13:13', 5, Color(0xFF0dcc90)),
    ChartData('08:14:13', -3, Color(0xFFff5541)),
  ];

  final List<ChartData> chartDataFila = [
    ChartData('08:04:13', 10, Color(0xFF0dcc90)),
    ChartData('08:11:13', 10, Color(0xFF0dcc90)),
  ];

  final List<ChartData> chartDataTentativas = [
    ChartData('08:04:13', 0, Color(0xFF8f5fbc)),
  ];

  final List<ChartData> chartDataRamal = [
    ChartData('08:04:13', 0, Color(0xFFf5c955)),
  ];

  final List<ChartData> chartDataOcioso = [
    ChartData('08:06:13', -2, Color(0xFFff5541)),
  ];

  final List<ChartData> chartDataPausa = [
    ChartData('08:04:13', 0, Color(0xFFa7a2a4)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
      child: SfCartesianChart(
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
            StackedColumnSeries<ChartData, String>(
              animationDuration: 500,
              dataSource: chartDataFeitas,
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y,
              enableTooltip: true,
              legendItemText: "Feitas",
              pointColorMapper: (ChartData data, _) => data.color,
            ),
            // StackedColumnSeries<ChartData, String>(
            //   animationDuration: 500,
            //   dataSource: chartDataFila,
            //   xValueMapper: (ChartData data, _) => data.x,
            //   yValueMapper: (ChartData data, _) => data.y,
            //   enableTooltip: true,
            //   legendItemText: "Fila",
            //   color: Color(0xFF0dcc90),
            //   pointColorMapper: (ChartData data, _) => data.color,
            // ),
            // StackedColumnSeries<ChartData, String>(
            //   animationDuration: 500,
            //   dataSource: chartDataTentativas,
            //   xValueMapper: (ChartData data, _) => data.x,
            //   yValueMapper: (ChartData data, _) => data.y,
            //   enableTooltip: true,
            //   legendItemText: "Tentativas",
            //   color: Color(0xFF8f5fbc),
            //   pointColorMapper: (ChartData data, _) => data.color,
            // ),
            // StackedColumnSeries<ChartData, String>(
            //   animationDuration: 500,
            //   dataSource: chartDataRamal,
            //   xValueMapper: (ChartData data, _) => data.x,
            //   yValueMapper: (ChartData data, _) => data.y,
            //   enableTooltip: true,
            //   legendItemText: "Ramal",
            //   color: Color(0xFFf5c955),
            //   pointColorMapper: (ChartData data, _) => data.color,
            // ),
            // StackedColumnSeries<ChartData, String>(
            //   animationDuration: 500,
            //   dataSource: chartDataOcioso,
            //   xValueMapper: (ChartData data, _) => data.x,
            //   yValueMapper: (ChartData data, _) => data.y,
            //   enableTooltip: true,
            //   legendItemText: "Ocioso",
            //   color: Color(0xFFff5541),
            //   pointColorMapper: (ChartData data, _) => data.color,
            // ),
            // StackedColumnSeries<ChartData, String>(
            //   animationDuration: 500,
            //   dataSource: chartDataPausa,
            //   xValueMapper: (ChartData data, _) => data.x,
            //   yValueMapper: (ChartData data, _) => data.y,
            //   enableTooltip: true,
            //   legendItemText: "Pausa",
            //   color: Color(0xFFa7a2a4),
            //   pointColorMapper: (ChartData data, _) => data.color,
            // ),
          ]),
    ));
  }
}

class ChartData {
  ChartData(this.x, this.y, this.color);

  final String x;
  final double y;
  final Color color;
}

// Controle de icones da legenda
void legend(LegendRenderArgs args) {
  args.legendIconType = LegendIconType.circle;
}

class PerformanceGraficColumnPanel extends StatelessWidget {
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
