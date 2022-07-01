import 'package:flutter/material.dart';
import 'package:siga/modules/home/performance_grafic_column_bar_panel.dart';
import 'package:siga/modules/home/performance_grafic_radial_panel.dart';

class Dashboard extends StatefulWidget {
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        child: LayoutBuilder(builder: (context, constraints) {
          // Large screens (tablet on landscape mode, desktop, TV)
          if (constraints.maxWidth > 1300) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  children: <Widget>[
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Flexible(
                            flex: 4,
                            fit: FlexFit.tight,
                            child: Container(
                              // margin: EdgeInsets.only(
                              //     bottom: constraints.maxHeight - 900),
                              child: BpmnDemo()
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Flexible(
                            flex: 3,
                            fit: FlexFit.tight,
                            child: Container(
                              // decoration: BoxDecoration(
                              //     border: Border.all(color: Colors.grey)),
                              margin: EdgeInsets.only(
                                  bottom: constraints.maxHeight - 530),
                              child: PerformanceGraficRadialPanel(),
                            ),
                          )
                        ],
                      ),
                    ),
                    // Flexible(
                    //   flex: 0,
                    //   fit: FlexFit.tight,
                    //   child: Container(
                    //       height: 400,
                    //       color: Colors.amber,
                    //       child: PerformanceGraficColumnPanel()),
                    // ),
                  ],
                ),
              ),
            );
          }

          // Samll screens
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  height: 500,
                  child: Center(child: PerformanceGraficRadialPanel()),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(10),
              //   child: Container(
              //     height: constraints.maxHeight - 400,
              //     width: constraints.maxWidth - 0,
              //     child: Center(child: CardPerfil()),
              //   ),
              // )
            ],
          );
        }));
  }
}
