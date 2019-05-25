import 'package:app/i18n/app_i18n.dart';
import 'package:app/state/app_state.dart';
import 'package:app/widgets/currency_tile.dart';
import 'package:app/widgets/custom_app_bar.dart';
import 'package:app/widgets/header.dart';
import 'package:app/widgets/search_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// TODO from != to in list
// TODO highlight selected
class CurrencySelectorScreen extends StatefulWidget {
  final onSelect;

  CurrencySelectorScreen({Key key, @required this.onSelect}) : super(key: key);

  @override
  _CurrencySelectorState createState() => _CurrencySelectorState();
}

class _CurrencySelectorState extends State<CurrencySelectorScreen> {
  String _filter = '';

  _onSearch(filter) {
    setState(() {
      _filter = filter.toLowerCase();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<AppState>(context);
    final locale = AppI18n.of(context);
    final currencies = state.filteredCurrencies(_filter);

    return Scaffold(
        appBar: AppBar(
          title: Text(''),
          elevation: 0,
        ),
        body: Container(
          color: Theme.of(context).primaryColor,
          child: Column(
            children: <Widget>[
              Header(title: locale.text('currency_selector_screen.title')),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 18),
                  padding: EdgeInsets.fromLTRB(16, 12, 16, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(16),
                    ),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: <Widget>[
                      SearchInput(onSearch: _onSearch),
                      Expanded(
                        child: ListView.builder(
                          itemCount: currencies.length,
                          itemBuilder: (context, index) {
                            final currency = currencies[index];
                            return CurrencyTile(
                              currency: currency,
                              onSelect: widget.onSelect,
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
