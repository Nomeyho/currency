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

    if (rate.truncateToDouble() == rate) {
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
    final theme = Theme.of(context);

    return Center(
      child: FlatButton(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.grey[400],
            width: 1,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(36),
        ),
        onPressed: onTap,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              '${from.symbol} 1',
              style: theme.textTheme.title,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4),
              child: Icon(
                Icons.swap_horiz,
                size: 36,
                color: Colors.grey[500],
              ),
            ),
            Text(
              '${to.symbol} ${_formatRate(from, to)}',
              style: theme.textTheme.title,
            )
          ],
        ),
      ),
    );
  }
}
