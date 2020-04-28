import 'package:flutter/material.dart';
import 'package:storage_config_app/src/shared_prefs/preferencias_usuarios.dart';

import 'package:storage_config_app/src/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {
  static final String routeName = 'home';
  final prefs = new PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {
    prefs.ultimaPagina = HomePage.routeName;
    // prefs.initPrefs();

    return Scaffold(
      appBar: AppBar(
        title: Text('preferencias de usuario'),
        backgroundColor: (prefs.colorSecundario) ? Colors.teal : Colors.blue,
      ),
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('color secundario: ${prefs.colorSecundario}'),
          Divider(),
          Text('género: ${prefs.genero}'),
          Divider(),
          Text('nombre usuario: ${prefs.nombreUsuario}'),
          Divider(),
        ],
      ),
    );
  }

  // _crearMenu(BuildContext context) {
  //   return Drawer(
  //     child: ListView(
  //       padding: EdgeInsets.zero,
  //       children: <Widget>[
  //         DrawerHeader(
  //             child: Container(
  //           decoration: BoxDecoration(
  //               image: DecorationImage(
  //                   image: AssetImage('assets/menu.jpg'), fit: BoxFit.cover)),
  //         )),
  //         ListTile(
  //           leading: Icon(Icons.home, color: Colors.blue),
  //           title: Text('home'),
  //           onTap: () =>
  //               Navigator.pushReplacementNamed(context, HomePage.routeName),
  //         ),
  //         ListTile(
  //           leading: Icon(Icons.party_mode, color: Colors.blue),
  //           title: Text('party mode'),
  //           onTap: () {},
  //         ),
  //         ListTile(
  //           leading: Icon(Icons.people, color: Colors.blue),
  //           title: Text('people'),
  //           onTap: () {},
  //         ),
  //         ListTile(
  //           leading: Icon(Icons.settings, color: Colors.blue),
  //           title: Text('settings'),
  //           onTap: () => {
  //             // Navigator.pop(context),
  //             Navigator.pushReplacementNamed(context, SettingsPage.routeName),
  //           },
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
