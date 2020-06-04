import 'package:flutter/material.dart';
import 'package:preferencias_usuario_app/src/shared_prefs/pref_usuario.dart';
import 'package:preferencias_usuario_app/src/widgets/menu_widget.dart';

class SettingsPage extends StatefulWidget {
  
  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  bool _colorSecundario;
  int _genero;
  TextEditingController _textController;
  final _prefs = PreferenciasUsuario();

  @override
  void initState()  {
    super.initState();
    _genero = _prefs.genero;
    _colorSecundario = _prefs.colorSecundario;
    _textController = TextEditingController(text: _prefs.nombreUsuario);
    _prefs.ultimaPagina = SettingsPage.routeName;
  }

  _setSelectedRadio(int valor)  {
    _prefs.genero = valor;
    setState(() {
      _genero = valor;  
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajustes'),
        backgroundColor: (_prefs.colorSecundario) ? Colors.teal : Colors.blue
      ),
      drawer: MenuWidget(),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            child: Text('Settings',style: TextStyle(fontSize: 40.0,fontWeight: FontWeight.bold)),
          ),
          Divider(),
          SwitchListTile(
            value: _colorSecundario, 
            title: Text('Color secundario'),
            onChanged: (value){ 
              setState(() {
                _prefs.colorSecundario = value;
                _colorSecundario = value;
              });
            }
          ),
          RadioListTile(
            value: 1, 
            title: Text('Masculino'),
            groupValue: _genero, 
            onChanged: _setSelectedRadio
          ),
          RadioListTile(
            value: 2, 
            title: Text('Femenino'),
            groupValue: _genero, 
            onChanged: _setSelectedRadio
          ),
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                labelText: 'Nombre',
                helperText: 'Nombre de la persona usando el telefono'
              ),
              onChanged: (value){
                _prefs.nombreUsuario = value;
              },
            )
          )
        ],
      ),
    );
  }
}