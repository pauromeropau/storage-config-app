import 'package:flutter/material.dart';

import 'package:storage_config_app/src/pages/home_page.dart';
import 'package:storage_config_app/src/pages/settings_page.dart';

class MenuWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
              child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/menu.jpg'), fit: BoxFit.cover)),
          )),
          ListTile(
            leading: Icon(Icons.home, color: Colors.blue),
            title: Text('home'),
            onTap: () =>
                Navigator.pushReplacementNamed(context, HomePage.routeName),
          ),
          ListTile(
            leading: Icon(Icons.party_mode, color: Colors.blue),
            title: Text('party mode'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.people, color: Colors.blue),
            title: Text('people'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.blue),
            title: Text('settings'),
            onTap: () => {
              // Navigator.pop(context),
              Navigator.pushReplacementNamed(context, SettingsPage.routeName),
            },
          ),
        ],
      ),
    );
  }
}
