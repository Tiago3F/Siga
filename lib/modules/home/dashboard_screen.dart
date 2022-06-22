import 'package:flutter/material.dart';
import 'package:siga/modules/home/card_perfil.dart';
import 'package:siga/modules/home/performance_grafic_panel.dart';

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
              child: Container(
                  child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  children: <Widget>[
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Row(
                        children: <Widget>[
                          Flexible(
                            flex: 3,
                            fit: FlexFit.tight,
                            child: Container(
                              child: PerformanceGraficPanel(),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child: Container(
                              margin: EdgeInsets.only(bottom: constraints.maxHeight - 440),
                              child: CardPerfil(),
                             
                            ),
                          )
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                ),
              )),
            );
          }

          // Samll screens
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  height: 300,
                  child: Center(child: PerformanceGraficPanel()),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  height: constraints.maxHeight - 400,
                  width: constraints.maxWidth - 0,
                  child: Center(child: CardPerfil()),
                ),
              )
            ],
          );
        }));
  }
}
