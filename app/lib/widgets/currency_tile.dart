import 'package:app/models/currency.dart';
import 'package:app/state/app_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CurrencyTile extends StatelessWidget {
  CurrencyTile({
    @required this.currency,
    @required this.onSelect,
  });

  final Currency currency;
  final Function onSelect;

  _buildIcon(currency) {
    try {
      return CircleAvatar(
        backgroundImage: AssetImage(
          'icons/currency/${currency.code.toLowerCase()}.png',
          package: 'currency_icons',
        ),
        backgroundColor: Colors.white,
      );
    } catch (e) {
      return CircleAvatar(backgroundColor: Colors.white);
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<AppState>(context);
    final bool disabled = currency == state.from || currency == state.to;

    return ListTile(
      onTap: () {
        if (!disabled) {
          onSelect(currency);
        }
      },
      leading: _buildIcon(currency),
      title: Text(currency.name,
          style: TextStyle(color: disabled ? Colors.red : Colors.grey)),
      subtitle: Text(currency.code, style: TextStyle(color: Colors.grey)),
      trailing: Text(currency.symbol, style: TextStyle(color: Colors.grey)),
    );
  }
}
