import 'dart:ui' as ui;
import 'package:chart_engine/chart_engine_apexcharts.dart';
import 'package:chart_engine/chart_engine_chartjs.dart';
import 'package:universal_html/html.dart' as html;
import 'package:flutter/material.dart';
import 'package:universal_html/html.dart';

class BpmnDemo extends StatefulWidget {
  @override
  _BpmnDemoState createState() => _BpmnDemoState();
}

class _BpmnDemoState extends State<BpmnDemo> {
  late html.DivElement _element;

  // void main() async {
  //   querySelector('#apexcharts_version')!.text =
  //       ChartEngineApexCharts().version;

  //   querySelector('#chartjs_version')!.text = ChartEngineChartJS().version;

  //   // ignore: undefined_prefixed_name
  //   ui.platformViewRegistry.registerViewFactory(
  //       'teste',
  //       (int viewId) => DivElement()
  //         ..id = 'output'
  //         ..text = """
  //       const canvas = document.querySelector("flt-platform-view").shadowRoot.querySelector("#canvas");
  //       const viewer = new BpmnJS({ container: canvas });
  //       const uri = "https://cdn.staticaly.com/gh/bpmn-io/bpmn-js-examples/dfceecba/url-viewer/resources/pizza-collaboration.bpmn";
  //       fetch(uri).then(res => res.text().then(xml => viewer.importXML(xml)));
  //       """);
  // }

  void main() async {
    querySelector('#apexcharts_version')!.text =
        ChartEngineApexCharts().version;
    querySelector('#chartjs_version')!.text = ChartEngineChartJS().version;
    await createLineChart();
  }

  @override
  Future createLineChart() async {
    var series = ChartSeries([
      'Jan',
      'Feb',
      'Mar'
    ], {
      'A': [15, 10, 30],
      'B': [40, 15, 35],
      'C': [15, 30, 40]
    });

    series.title = 'Chart Example';
    series.xTitle = 'Months';
    series.yTitle = 'Count';
    series.options.steppedLines = true;
    series.options.straightLines = true;

    //var charEngine = ChartEngineChartJS() ;
    var charEngine = ChartEngineApexCharts();
    await charEngine.load();
    var element1 = html.querySelector('#output');
    charEngine.renderBarChart(element1!, series);

    super.initState();
  }

  Widget getMap() {
    String htmlId = "output";

    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
        'output',
        (int viewId) => DivElement()
          ..id = 'output'
          ..text = """
             <div id="output" class="output"> </div>
        """);

    createLineChart();

    return HtmlElementView(viewType: htmlId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.blue,
      body: Container(
        child: getMap(),
      ),
    );
  }
}
