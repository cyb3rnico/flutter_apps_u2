import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:u2_app_moneda/provider/monedas_provider.dart';

class TabMonedas extends StatefulWidget {
  TabMonedas({Key? key}) : super(key: key);

  @override
  _TabMonedasState createState() => _TabMonedasState();
}

class _TabMonedasState extends State<TabMonedas> {
  MonedasProvider monedas = new MonedasProvider();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        children: [
          Container(
            child: Text('Lista de Monedas', style: TextStyle(fontSize: 20)),
          ),
          Expanded(
            child: FutureBuilder(
              future: monedas.getMonedas(),
              builder: (context, AsyncSnapshot snapshot) {
                if (!snapshot.hasData) {
                  //no han llegado los datos
                  return Center(
                    child: Container(
                      width: 200,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Cargando...'),
                          LinearProgressIndicator(),
                        ],
                      ),
                    ),
                  );
                } else {
                  //llegó la respuesta
                  return ListView.separated(
                    separatorBuilder: (context, index) => Divider(),
                    //cuantos items va a cargar en la lista
                    itemCount: snapshot.data.length,
                    //funcion que se ejecuta para construir los datos
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Icon(MdiIcons.cash),
                        title: Text(snapshot.data[index]['Codigo']),
                        subtitle: Text(snapshot.data[index]['Nombre']),
                        trailing: Text('${snapshot.data[index]['Valor']} CLP '),
                        onTap: () {},
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
