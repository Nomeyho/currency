import 'package:app/screens/settings_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

AppBar customNavBar({
  @required String title,
  @required bool showSettings,
  @required context,
}) {
  return AppBar(
    title: Text(title),
    centerTitle: true,
    elevation: 0,
    actions: <Widget>[
      IconButton(
        icon: showSettings ? Icon(Icons.settings) : Container(),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => SettingsScreen()),
          );
        },
      ),
    ],
  );
}
