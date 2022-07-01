import 'package:animated_widgets/widgets/rotation_animated.dart';
import 'package:animated_widgets/widgets/shake_animated_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:get/route_manager.dart';
import 'package:siga/modules/home/dashboard_screen.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/home',
        getPages: [
          GetPage(name: '/:page_name', page: () => MasterPage()),
        ]);
  }
}

////////////////////////////////////

class MasterPage extends StatelessWidget {
  late Widget
      InnerView; //Aqui eu permitir que a variável receba um valor posteriormente, pois se não o "MasterPage" da erro.
  MasterPage() {
    Map<String, Widget> InnterRoutes = {
      'edit_perfil': Dashboard(),
      'home': Dashboard(),
    };
    InnerView = InnterRoutes[Get.parameters[
        'page_name']]!; // Já aqui eu permitir que a variável fosse iniciada como null, "pelo menos é o que eu acho que fiz!"
  }

  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Row(
      key: _key,
      children: [
        Drawer(
          // backgroundColor: AppColors.background,
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFFa12421),
                  Color(0xFFf91919),
                ],
                begin: FractionalOffset(0.0, 0.0),
                end: FractionalOffset(1.0, 0.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp,
              ),
            ),
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('../images/logo.png', width: 30, height: 25),
                      const Text(
                        "SIGA",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 23),
                      )
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Menu',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w100,
                        fontSize: 12),
                  ),
                ),
                const ExpansionTile(
                  leading:
                      Icon(Icons.edit_calendar_rounded, color: Colors.white),
                  collapsedIconColor: Colors.white,
                  iconColor: Colors.white,
                  title: Text('Cadastros',
                      style: TextStyle(
                        height: 1,
                        color: Colors.white,
                      )),
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(" - Texto 1",
                          style: TextStyle(
                            color: Colors.white,
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(" - Texto 2",
                          style: TextStyle(
                            color: Colors.white,
                          )),
                    ),
                  ],
                ),
                const ListTile(
                  iconColor: Colors.white,
                  textColor: Colors.white,
                  leading: Icon(Icons.speed_outlined),
                  title: Text('Dashboard Usuário'),
                  // onTap: () {
                  //   Get.toNamed('/edit_perfil');
                  // },
                ),
                const ExpansionTile(
                  leading: Icon(Icons.call, color: Colors.white),
                  collapsedIconColor: Colors.white,
                  iconColor: Colors.white,
                  title: Text('Fila',
                      style: TextStyle(
                        height: 1,
                        color: Colors.white,
                      )),
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(" - Texto 1",
                          style: TextStyle(
                            color: Colors.white,
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(" - Texto 2",
                          style: TextStyle(
                            color: Colors.white,
                          )),
                    ),
                  ],
                ),
                const ExpansionTile(
                  leading: Icon(Icons.table_rows_outlined, color: Colors.white),
                  collapsedIconColor: Colors.white,
                  iconColor: Colors.white,
                  title: Text('Mensagem URA',
                      style: TextStyle(
                        height: 1,
                        color: Colors.white,
                      )),
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(" - Texto 1",
                          style: TextStyle(
                            color: Colors.white,
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(" - Texto 2",
                          style: TextStyle(
                            color: Colors.white,
                          )),
                    ),
                  ],
                ),
                const ListTile(
                  iconColor: Colors.white,
                  textColor: Colors.white,
                  leading: Icon(Icons.warning_amber),
                  title: Text('Painel de Informações'),
                ),
                const ExpansionTile(
                  leading:
                      Icon(FontAwesomeIcons.fileLines, color: Colors.white),
                  collapsedIconColor: Colors.white,
                  iconColor: Colors.white,
                  title: Text('Relatórios',
                      style: TextStyle(
                        height: 1,
                        color: Colors.white,
                      )),
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(" - Texto 1",
                          style: TextStyle(
                            color: Colors.white,
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(" - Texto 2",
                          style: TextStyle(
                            color: Colors.white,
                          )),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const VerticalDivider(
          width: 4,
          thickness: 1,
        ),
        Expanded(
          // flex: 6, child: Container(color: Colors.white, child: InnerView)
          child: Scaffold(
            appBar: AppBar(
              leading: Builder(
                builder: (BuildContext context) {
                  return IconButton(
                    icon: const Icon(
                      Icons.menu,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      onPressed:
                      () => _key.currentState!.openDrawer();
                    },
                    tooltip: "Menu",
                  );
                },
              ),
              actions: [
                Container(
                  padding: EdgeInsets.all(8.0),
                  child: IntrinsicHeight(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconButton(
                            iconSize: 20,
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            padding: EdgeInsets.zero,
                            constraints: BoxConstraints(),
                            icon: const Icon(FontAwesomeIcons.solidMessage,
                                color: Color(0xFFa8a8a8)),
                            onPressed: () {},
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: 25,
                            child: FloatingActionButton(
                              backgroundColor: Color(0xFFe1524d),
                              child: const Icon(
                                Icons.question_mark_rounded,
                                size: 15,
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconButton(
                            iconSize: 22,
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            padding: EdgeInsets.zero,
                            constraints: BoxConstraints(),
                            icon: const Icon(FontAwesomeIcons.stopwatch,
                                color: Color(0xFF88acc3)),
                            onPressed: () {},
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Stack(children: [
                            ShakeAnimatedWidget(
                              duration: const Duration(milliseconds: 1500),
                              shakeAngle: Rotation.deg(x: 30),
                              curve: Curves.linear,
                              child: IconButton(
                                iconSize: 22,
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                padding: EdgeInsets.zero,
                                constraints: BoxConstraints(),
                                icon: const Icon(
                                  FontAwesomeIcons.cakeCandles,
                                  color: Color(0xFFe7797b),
                                ),
                                onPressed: () {},
                              ),
                            ),
                            Positioned(
                              top: -0.2,
                              right: 0,
                              child: Container(
                                padding: const EdgeInsets.all(1),
                                decoration: BoxDecoration(
                                  color: Colors.purple,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                constraints: const BoxConstraints(
                                  minWidth: 13,
                                  minHeight: 0,
                                ),
                                child: const Text(
                                  '3',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            )
                          ]),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Stack(children: [
                            ShakeAnimatedWidget(
                              duration: const Duration(milliseconds: 1500),
                              shakeAngle: Rotation.deg(z: 20),
                              curve: Curves.linear,
                              child: IconButton(
                                iconSize: 22,
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                padding: EdgeInsets.zero,
                                constraints: const BoxConstraints(),
                                icon: const Icon(
                                  FontAwesomeIcons.solidBell,
                                  color: Color(0xFFffc30d),
                                ),
                                onPressed: () {},
                              ),
                            ),
                            Positioned(
                              top: -0.2,
                              right: 0,
                              child: Container(
                                padding: const EdgeInsets.all(1),
                                decoration: BoxDecoration(
                                  color: Colors.purple,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                constraints: const BoxConstraints(
                                  minWidth: 13,
                                  minHeight: 0,
                                ),
                                child: const Text(
                                  '8',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            )
                          ]),
                        ),
                        PopupMenuButton<AdminMenuItem>(
                          child: Row(
                            children: const [
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                backgroundImage:
                                    AssetImage('../images/perfil.png'),
                                radius: 25,
                              ),
                              Text(
                                "Tiago Moreira",
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  FontAwesomeIcons.angleDown,
                                  color: Colors.grey,
                                  size: 13,
                                ),
                              )
                            ],
                          ),
                          itemBuilder: (context) {
                            return _adminMenuItems.map((AdminMenuItem item) {
                              return PopupMenuItem<AdminMenuItem>(
                                value: item,
                                child: Row(
                                  children: [
                                    Icon(
                                      item.icon,
                                      color: const Color(0xFFe7797b),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        item.title,
                                        style: const TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }).toList();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
              backgroundColor: Colors.white,
            ),
            body: Container(color: Colors.white, child: InnerView),
          ),
        ),
      ],
    );
  }

  final List<AdminMenuItem> _adminMenuItems = const [
    AdminMenuItem(
      title: 'Perfil',
      icon: Icons.account_circle,
      route: '/',
    ),
    AdminMenuItem(
      title: 'Configurações',
      icon: Icons.settings,
      route: '/',
    ),
    AdminMenuItem(
      title: 'Sair',
      icon: Icons.logout,
      route: '/',
    ),
  ];
}
