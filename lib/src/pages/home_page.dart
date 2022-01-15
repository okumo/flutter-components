import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/providers/menu_provider.dart';
import 'package:componentes/src/utils/icono_string_util.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes'),
      ),
      body: _lista(),
    );
  }

  Widget _lista() {
    return FutureBuilder(
      future: MenuProvider.cargarData(),
      initialData: [],
      builder: (context, snapshot) {
        return ListView(
          children: _listaItems(snapshot.data, context),
        );
      },
    );
  }
}

List<Widget> _listaItems(List<dynamic> datos, BuildContext context) {
  final List<Widget> lista = [];

  datos.forEach((element) {
    final tempWidget = ListTile(
      title: Text(element['texto']),
      leading: getIcon(element['icon']),
      trailing: Icon(
        Icons.keyboard_arrow_right,
        color: Colors.blue,
      ),
      onTap: () {
        Navigator.pushNamed(context, element['ruta']);
        /* final route = MaterialPageRoute(builder: (context) {
          return AlertPage();
        });
        Navigator.push(context, route); */
      },
    );
    lista..add(tempWidget);
  });
  return lista;
}
