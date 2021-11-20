import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:u2_app_moneda/pages/tab_calculadora_page.dart';
import 'package:u2_app_moneda/pages/tab_monedas_page.dart';

class TabsPage extends StatelessWidget {
  const TabsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Moneda App'),
          leading: Icon(MdiIcons.cashMultiple),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Monedas'),
              Tab(text: 'Calculadora'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            TabMonedas(),
            TabCalculadora(),
          ],
        ),
      ),
    );
  }
}
