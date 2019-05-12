import 'package:app/state/app_state.dart';
import 'package:app/widgets/currency_tile.dart';
import 'package:app/widgets/custom_nav_bar.dart';
import 'package:app/widgets/search_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// TODO from != to in list
// TODO hilight selected
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
    final currencies = state.filteredCurrencies(_filter);

    return Scaffold(
      appBar: customNavBar(
        title: 'Select',
        showSettings: false,
        context: context,
      ),
      body: SafeArea(
        child: Container(
            margin: EdgeInsets.symmetric(horizontal: 8.0),
            padding: EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 8.0,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
              color: Colors.white,
            ),
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 24.0,
                    vertical: 16,
                  ),
                  child: SearchInput(onSearch: _onSearch),
                ),
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
            )),
      ),
    );
  }
}
