import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSlider = 100.0;
  bool _bloquearCheck = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider page'),
      ),
      body: Container(
        child: Column(
          children: [
            _crearSlider(),
            _checkBox(),
            _crearSwitch(),
            Expanded(
              child: _crearImage(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _crearSlider() {
    return Slider(
      value: _valorSlider,
      min: 10.0,
      max: 400.0,
      activeColor: Colors.amber,
      label: 'Tamaño de la imagen',
      onChanged: _bloquearCheck
          ? null
          : (valor) {
              setState(() {
                _valorSlider = valor;
              });
            },
    );
  }

  Widget _crearImage() {
    return Image(
      image: NetworkImage(
          'https://static.wikia.nocookie.net/disney/images/9/96/Iron-Man-AOU-Render.png/revision/latest?cb=20180410032118&path-prefix=es'),
      width: _valorSlider,
      fit: BoxFit.contain,
    );
  }

  Widget _checkBox() {
    /* return Checkbox(
      value: _bloquearCheck,
      onChanged: (valor) {
        setState(() {
          _bloquearCheck = valor;
        });
      },
    ); */
    return CheckboxListTile(
        value: _bloquearCheck,
        title: Text('Bloquear slider'),
        onChanged: (valor) {
          setState(() {
            _bloquearCheck = valor;
          });
        });
  }

  Widget _crearSwitch() {
    return SwitchListTile(
        value: _bloquearCheck,
        title: Text('Bloquear slider'),
        onChanged: (valor) {
          setState(() {
            _bloquearCheck = valor;
          });
        });
  }
}
