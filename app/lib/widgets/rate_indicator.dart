import 'package:app/models/currency.dart';
import 'package:app/state/app_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RateIndicator extends StatelessWidget {
  label(Currency from, Currency to, double rate) {
    return '${from.symbol} 1 = ${to.symbol} ${(from.rate / to.rate).toStringAsFixed(3)}';
  }

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<AppState>(context);

    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 6.0,
          horizontal: 12.0,
        ),
        decoration: new BoxDecoration(
          border: new Border.all(color: Colors.grey[400]),
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
        child: Text(
          label(state.from, state.to, state.rate),
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
