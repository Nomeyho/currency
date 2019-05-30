import 'package:app/i18n/app_i18n.dart';
import 'package:app/state/app_state.dart';
import 'package:app/utils/ago.dart';
import 'package:app/widgets/centered_loader.dart';
import 'package:app/widgets/currency_input.dart';
import 'package:app/widgets/header.dart';
import 'package:app/widgets/rate_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _focusNode1 = FocusNode();
  final _focusNode2 = FocusNode();
  final _inputController1 =
      MoneyMaskedTextController(precision: 2, thousandSeparator: ' ');
  final _inputController2 =
      MoneyMaskedTextController(precision: 2, thousandSeparator: ' ');

  @override
  void initState() {
    super.initState();
    _inputController1.afterChange = onInputChange1;
    _inputController2.afterChange = onInputChange2;
    _inputController1.updateValue(1);
  }

  void onInputChange1(String masked, double raw) {
    if (_focusNode1.hasFocus) {
      final state = Provider.of<AppState>(context);
      _inputController2.updateValue(raw * state.rate);
    }
  }

  void onInputChange2(String masked, double raw) {
    if (_focusNode2.hasFocus) {
      final state = Provider.of<AppState>(context);
      _inputController1.updateValue(raw / state.rate);
    }
  }

  void _swap() {
    final state = Provider.of<AppState>(context);
    final tmp = _inputController2.numberValue;
    _inputController2.updateValue(_inputController1.numberValue);
    _inputController1.updateValue(tmp);
    state.invert();
  }

  _buildCurrencyInput1(AppState state) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: CurrencyInput(
        controller: _inputController1,
        focusNode: _focusNode1,
        onSelect: (currency) {
          state.from = currency;
          Navigator.pop(context);
        },
        label: state.from.code,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
        color: Colors.white,
      ),
    );
  }

  _buildCurrencyInput2(AppState state) {
    return Container(
      padding: EdgeInsets.all(20.0),
      color: Theme.of(context).canvasColor,
      child: CurrencyInput(
        controller: _inputController2,
        focusNode: _focusNode2,
        onSelect: (currency) {
          state.to = currency;
          Navigator.pop(context);
        },
        label: state.to.code,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<AppState>(context);
    final locale = AppI18n.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        elevation: 0,
      ),
      body: Container(
        color: Theme.of(context).primaryColor,
        child: Column(
          children: <Widget>[
            Header(
              title: locale.text('home_screen.title'),
              subtitle: ago(state.date, locale),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 18),
                child: state.loading
                    ? CenteredLoader()
                    : Stack(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Expanded(child: _buildCurrencyInput1(state)),
                              Expanded(child: _buildCurrencyInput2(state)),
                            ],
                          ),
                          RateIndicator(onTap: _swap)
                        ],
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _focusNode1.dispose();
    _focusNode2.dispose();
    _inputController1.dispose();
    _inputController2.dispose();
    super.dispose();
  }
}
