import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String title;
  final String subtitle;

  Header({ @required this.title, this.subtitle = '' });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
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
    );
  }
}
