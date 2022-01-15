import 'package:flutter/material.dart';

class HomeTemp extends StatelessWidget {
  var opciones = ["uno", "dos", "tres", "cuatros", "cinco"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes Temp'),
      ),
      body: ListView(children: _crearItemsCorta()),
    );
  }

  List<Widget> _crearItems() {
    List<Widget> lista = new List<Widget>();

    for (var item in opciones) {
      final tempWidget = ListTile(
        title: Text(item),
      );

      lista..add(tempWidget)..add(Divider());
    }
    return lista;
  }

  List<Widget> _crearItemsCorta() {
    return opciones.map((item) {
      return Column(
        children: [
          ListTile(
            title: Text(item),
            subtitle: Text('Pequeño'),
            trailing: Icon(Icons.arrow_right),
            leading: Icon(Icons.wallet_travel_sharp),
            onTap: () {},
          ),
          Divider()
        ],
      );
    }).toList();
  }
}
