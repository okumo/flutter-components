import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre = "";
  String _email = "";
  String _password = "";
  String _fecha = "";

  String _opcionSeleccionada = "Volar";
  TextEditingController _inputFieldDateController = new TextEditingController();

  List<String> _poderes = [
    'Volar',
    'Super Aliento',
    'Super fuerza',
    'Velocidad'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input Page'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: [
          _crearInput(),
          SizedBox(height: 10.0),
          _crearEmail(),
          SizedBox(height: 10.0),
          _crearPassword(),
          SizedBox(height: 10.0),
          _crearFecha(context),
          SizedBox(height: 10.0),
          _crearDropDown(),
          SizedBox(
            height: 10.0,
          ),
          _crearPersona()
        ],
      ),
    );
  }

  Widget _crearInput() {
    return TextField(
        textCapitalization: TextCapitalization.sentences,
        onChanged: (value) {
          setState(() {
            _nombre = value;
          });
        },
        decoration: InputDecoration(
            counter: Text('Letras 0'),
            hintText: 'Nombre de la persona',
            labelText: 'Nombre',
            helperText: 'Solo es el nombre',
            suffixIcon: Icon(Icons.accessibility),
            icon: Icon(Icons.account_circle),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))));
  }

  Widget _crearPersona() {
    return ListTile(
      title: Text('El nombre es: $_nombre'),
      subtitle: Text('El email es: $_email'),
      trailing: Text(_opcionSeleccionada),
    );
  }

  Widget _crearEmail() {
    return TextField(
        onChanged: (value) {
          setState(() {
            _email = value;
          });
        },
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            hintText: 'Ingrese un email',
            labelText: 'Email',
            suffixIcon: Icon(Icons.alternate_email_sharp),
            icon: Icon(Icons.email),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))));
  }

  Widget _crearPassword() {
    return TextField(
        onChanged: (value) {
          setState(() {
            _password = value;
          });
        },
        obscureText: true,
        decoration: InputDecoration(
            hintText: 'Ingrese una contraseña',
            labelText: 'Contraseña',
            suffixIcon: Icon(Icons.lock_open),
            icon: Icon(Icons.lock),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))));
  }

  Widget _crearFecha(BuildContext context) {
    return TextField(
        controller: _inputFieldDateController,
        enableInteractiveSelection: false,
        onChanged: (value) {
          setState(() {
            _password = value;
          });
        },
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
          _selectDate(context);
        },
        decoration: InputDecoration(
            hintText: 'Fecha de nacimiento',
            labelText: 'Fecha de nacimiento',
            suffixIcon: Icon(Icons.date_range),
            icon: Icon(Icons.calendar_today),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))));
  }

  _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
        context: context,
        firstDate: new DateTime(2018),
        lastDate: new DateTime(2024),
        initialDate: new DateTime.now());

    if (picked != null) {
      setState(() {
        _fecha = picked.toString();
        _inputFieldDateController.text = _fecha;
      });
    }
  }

  List<DropdownMenuItem<String>> getOpcionesDropDown() {
    List<DropdownMenuItem<String>> lista = new List();
    _poderes.forEach((element) {
      lista.add(DropdownMenuItem(
        child: Text(element),
        value: element,
      ));
    });

    return lista;
  }

  Widget _crearDropDown() {
    return Row(children: [
      Icon(Icons.select_all),
      SizedBox(
        width: 30.0,
      ),
      Expanded(
        child: DropdownButton(
          items: getOpcionesDropDown(),
          value: _opcionSeleccionada,
          onChanged: (opt) {
            setState(() {
              _opcionSeleccionada = opt;
            });
          },
        ),
      )
    ]);
  }
}
