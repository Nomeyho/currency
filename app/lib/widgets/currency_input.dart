import 'package:app/screens/currency_selector_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CurrencyInput extends StatelessWidget {
  CurrencyInput({
    @required this.controller,
    @required this.focusNode,
    @required this.onSelect,
    @required this.label,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final Function onSelect;
  final String label;

  _openCurrencySelector(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => CurrencySelectorScreen(onSelect: onSelect)),
    );
  }

  _buildInput() {
    return TextField(
      controller: controller,
      focusNode: focusNode,
      autofocus: true,
      autocorrect: false,
      keyboardType: TextInputType.numberWithOptions(signed: false, decimal: true),
      textAlign: TextAlign.end,
      cursorColor: Colors.black,
      style: TextStyle(color: Colors.blue, fontSize: 30),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(40.0),
        border: InputBorder.none,
        alignLabelWithHint: false,
      ),
    );
  }

  _buildButton(BuildContext context) {
    return MaterialButton(
        onPressed: () => _openCurrencySelector(context),
        child: Row(
          children: <Widget>[
            Text(
              label,
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.w500,
              ),
            ),
            Icon(Icons.arrow_drop_down, color: Colors.grey[700])
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _buildButton(context),
        Flexible(
          child: _buildInput(),
        )
      ],
    );
  }
}
