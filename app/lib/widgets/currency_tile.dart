import 'package:app/models/currency.dart';
import 'package:app/state/app_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'currency_flag.dart';

class CurrencyTile extends StatelessWidget {
  CurrencyTile({
    @required this.currency,
    @required this.onSelect,
    @required this.favorite,
  });

  final Currency currency;
  final Function onSelect;
  final bool favorite;
  
  _subtitle(Currency currency) {
    if(currency.code == currency.symbol) {
      return currency.code;
    } else {
      return '${currency.code} (${currency.symbol})';
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<AppState>(context);
    final bool selected = currency == state.from || currency == state.to;

    return Material(
      color: Theme.of(context).canvasColor,
      child: ListTile(
        onTap: () {
          onSelect(currency);
        },
        selected: selected,
        leading: CurrencyFlag(currency: currency),
        title: Text(currency.name),
        subtitle: Text(_subtitle(currency)),
        trailing: favorite ? Icon(Icons.star) : null,
      ),
    );
  }
}
