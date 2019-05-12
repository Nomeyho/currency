import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchInput extends StatelessWidget {
  SearchInput({@required this.onSearch});

  final Function onSearch;

  @override
  Widget build(BuildContext context) {
    return TextField(
        autofocus: true,
        onChanged: onSearch,
        cursorColor: Colors.black,
        style: TextStyle(
          color: Colors.blue,
          fontSize: 16,
        ),
        decoration: new InputDecoration(
          suffixIcon: Icon(Icons.search),
          hintText: 'Search',
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 12,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: new BorderSide(),
            borderRadius: BorderRadius.all(Radius.circular(24.0)),
          ),
          border: OutlineInputBorder(
            borderSide: new BorderSide(),
            borderRadius: BorderRadius.all(Radius.circular(24.0)),
          ),
          alignLabelWithHint: false,
        ));
  }
}