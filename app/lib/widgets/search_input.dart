import 'package:app/i18n/app_i18n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchInput extends StatelessWidget {
  SearchInput({@required this.onSearch});

  final Function onSearch;
  final borderStyle = OutlineInputBorder(
    borderSide: BorderSide(color: Colors.transparent),
    borderRadius: BorderRadius.all(
      Radius.circular(24),
    ),
  );

  @override
  Widget build(BuildContext context) {
    final locale = AppI18n.of(context);
    return Container(
      margin: EdgeInsets.all(12),
      child: TextField(
        onChanged: onSearch,
        style: TextStyle(fontSize: 16),
        decoration: InputDecoration(
          suffixIcon: Icon(Icons.search),
          hintText: locale.text('search_input.search'),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 12,
          ),
          border: borderStyle,
          enabledBorder: borderStyle,
          focusedBorder: borderStyle,
        ),
      ),
    );
  }
}
