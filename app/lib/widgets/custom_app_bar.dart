import 'package:flutter/material.dart';

class CustomAppBar extends AppBar with PreferredSizeWidget {
  CustomAppBar({Key key, @required String title, String subtitle = ''})
      : super(
            key: key,
            elevation: 0,
            bottom: PreferredSize(
              child: Container(
                margin: const EdgeInsets.all(20.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(subtitle,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ))
                  ],
                ),
              ),
              preferredSize: const Size.fromHeight(48.0),
            ));
}
