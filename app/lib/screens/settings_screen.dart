import 'package:app/i18n/app_i18n.dart';
import 'package:app/state/app_state.dart';
import 'package:app/widgets/custom_nav_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// TODO
class SettingsScreen extends StatelessWidget {
  SettingsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<AppState>(context);
    final locale = AppI18n.of(context);

    return Scaffold(
      appBar: customNavBar(
        title: locale.text('settings_screen.title'),
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
                    title: Text(
                      locale.text('settings_screen.lang'),
                      style: TextStyle(color: Colors.black),
                    ),
                    trailing: Text(state.locale.languageCode, style: TextStyle(color: Colors.black)),
                    onTap: () {
                      // TODO
                      if (state.locale.languageCode == 'fr') {
                        state.locale = Locale('en');
                      } else {
                        state.locale = Locale('fr');
                      }
                    },
                  ),
                  Divider(),
                  ListTile(
                    title: Text(
                      locale.text('settings_screen.theme'),
                      style: TextStyle(color: Colors.black),
                    ),
                    trailing: Text('light', style: TextStyle(color: Colors.black)),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(30),
              child: Text(
                locale.text('settings_screen.version'),
                style: TextStyle(color: Colors.black),
              ),
            )
          ],
        ),
      ),
    );
  }
}
