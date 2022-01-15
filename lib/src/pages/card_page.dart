import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card Page'),
      ),
      body: ListView(
        children: <Widget>[
          _cardTipo1(),
          SizedBox(
            height: 30.0,
          ),
          _cardTipo2(),
          _cardTipo1(),
          SizedBox(
            height: 30.0,
          ),
          _cardTipo2(),
          _cardTipo1(),
          SizedBox(
            height: 30.0,
          ),
          _cardTipo2(),
          _cardTipo1(),
          SizedBox(
            height: 30.0,
          ),
          _cardTipo2(),
        ],
        padding: EdgeInsets.all(10),
      ),
    );
  }

  Widget _cardTipo1() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(
              Icons.photo_album,
              color: Colors.blue,
            ),
            title: Text('Soy el titulo de esta tarjeta'),
            subtitle: Text('Este es un texto cualquiera'),
          ),
          Row(
            children: <Widget>[
              TextButton(
                child: Text('Cancelar'),
                onPressed: () {},
              ),
              TextButton(
                child: Text('Aceptar'),
                onPressed: () {},
              )
            ],
            mainAxisAlignment: MainAxisAlignment.end,
          )
        ],
      ),
    );
  }

  Widget _cardTipo2() {
    final card = Container(
      child: Column(
        children: <Widget>[
          FadeInImage(
            image: NetworkImage(
                'https://fotoarte.com.uy/wp-content/uploads/2019/03/Landscape-fotoarte.jpg'),
            placeholder: AssetImage('assets/jar-loading.gif'),
            fadeInDuration: Duration(milliseconds: 200),
            height: 300,
            fit: BoxFit.cover,
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text('No se que poner aquí'),
          )
        ],
      ),
    );
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            color: Colors.white,
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0,
                  spreadRadius: 2.0,
                  offset: Offset(2.0, 10.0))
            ]),
        child:
            ClipRRect(child: card, borderRadius: BorderRadius.circular(30.0)));
  }
}
