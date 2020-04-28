import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:storage_config_app/src/shared_prefs/preferencias_usuarios.dart';
import 'package:storage_config_app/src/widgets/menu_widget.dart';

class SettingsPage extends StatefulWidget {
  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _colorSecundario;
  int _genero;
  String _nombre = 'pau';

  TextEditingController _textController;

  final prefs = new PreferenciasUsuario();

  @override
  void initState() async {
    super.initState();
    prefs.ultimaPagina = SettingsPage.routeName;
    _genero = prefs.genero;
    _colorSecundario = prefs.colorSecundario;

    // cargarPref();
    _textController = new TextEditingController(
      text: _nombre,
    );
  }

  // cargarPref() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   _genero = prefs.getInt('genero');
  //   setState(() {

  //   });
  // }

  _setSelectedRadio(int valor) {
    prefs.genero = valor;
    _genero = valor;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ajustes'),
        backgroundColor: (prefs.colorSecundario) ? Colors.teal : Colors.blue,
      ),
      drawer: MenuWidget(),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            child: Text(
              'settings',
              style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold),
            ),
          ),
          Divider(),
          SwitchListTile(
            value: _colorSecundario,
            title: Text('Color secundario'),
            onChanged: (value) {
              setState(() {
                _colorSecundario = value;
                prefs.colorSecundario = value;
              });
            },
          ),
          RadioListTile(
            value: 1,
            groupValue: _genero,
            onChanged: _setSelectedRadio,
            title: Text('masculino'),
          ),
          RadioListTile(
            value: 2,
            groupValue: _genero,
            onChanged: _setSelectedRadio,
            title: Text('femenino'),
          ),
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                labelText: 'nombre',
                helperText: 'otro nombre',
              ),
              onChanged: (value) {
                prefs.nombreUsuario = value;
              },
            ),
          )
        ],
      ),
    );
  }
}
