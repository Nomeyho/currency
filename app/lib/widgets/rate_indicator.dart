import 'package:app/models/currency.dart';
import 'package:app/state/app_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RateIndicator extends StatelessWidget {
  final onTap;

  RateIndicator({@required this.onTap});

  _formatRate(Currency from, Currency to) {
    final rate = from.rate / to.rate;

    if(rate.truncateToDouble() == rate) {
      return rate.toStringAsFixed(0);
    } else {
      return rate.toStringAsFixed(3);
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<AppState>(context);
    final from = state.from;
    final to = state.to;
    final titleStyle = Theme.of(context).textTheme.title;

    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 2,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[400]),
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
        child: GestureDetector(
          onTap: onTap,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                '${from.symbol} 1',
                style: titleStyle,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4),
                child: Icon(Icons.swap_horiz, size: 36),
              ),
              Text(
                '${to.symbol} ${_formatRate(from, to)}',
                style: titleStyle,
              )
            ],
          ),
        ),
      ),
    );
  }
}
