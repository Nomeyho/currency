import 'package:app/i18n/app_i18n.dart';
import 'package:app/models/currency.dart';
import 'package:app/state/app_state.dart';
import 'package:app/utils/sort_currencies.dart';
import 'package:app/widgets/currency_tile.dart';
import 'package:app/widgets/header.dart';
import 'package:app/widgets/search_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CurrencySelectorScreen extends StatefulWidget {
  final onSelect;

  CurrencySelectorScreen({Key key, @required this.onSelect}) : super(key: key);

  @override
  _CurrencySelectorState createState() => _CurrencySelectorState();
}

class _CurrencySelectorState extends State<CurrencySelectorScreen> {
  String _filter = '';

  _onSearch(String filter) {
    setState(() {
      _filter = filter.toLowerCase();
    });
  }

  _isLastFavorite(List<Currency> currencies, List<String> favorites, int index) {
    final currency = currencies[index];

    if(favorites.contains(currency.code)) {
      if(index + 1 < currencies.length) {
        return !favorites.contains(currencies[index + 1].code);
      }
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<AppState>(context);
    final locale = AppI18n.of(context);
    final theme = Theme.of(context);
    final currencies = state.filteredCurrencies(_filter);
    final favorites = state.favorites;

    sortCurrencies(currencies, favorites);

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
                        child: ListView.separated(
                          itemCount: currencies.length,
                          separatorBuilder: (context, index) {
                            if (_isLastFavorite(currencies, favorites, index)) {
                              return Container(
                                color: theme.canvasColor,
                                child: Divider(),
                              );
                            } else {
                              return Container();
                            }
                          },
                          itemBuilder: (context, index) {
                            final currency = currencies[index];
                            return CurrencyTile(
                                currency: currency,
                                onSelect: widget.onSelect,
                                favorite: favorites.contains(currency.code));
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
