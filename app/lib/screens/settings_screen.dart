import 'package:app/widgets/custom_nav_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// TODO
class SettingsScreen extends StatelessWidget {
  SettingsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customNavBar(
        title: 'Settings',
        showSettings: false,
        context: context,
      ),
      // backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    title: Text('Lang', style: TextStyle(color: Colors.black)),
                    trailing: Text('FR', style: TextStyle(color: Colors.black)),
                  ),
                  Divider(),
                  ListTile(
                    title: Text('Theme', style: TextStyle(color: Colors.black)),
                    trailing: Text('light', style: TextStyle(color: Colors.black)),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(30),
              child: Text('version', style: TextStyle(color: Colors.black)),
            )
          ],
        ),
      ),
    );
  }
}
