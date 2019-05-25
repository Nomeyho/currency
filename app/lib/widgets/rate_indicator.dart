import 'package:app/state/app_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// TODO onclick reverse
class RateIndicator extends StatelessWidget {

  final onPress;

  RateIndicator({ @required this.onPress });

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
        decoration: new BoxDecoration(
          border: new Border.all(color: Colors.grey[400]),
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
        child: InkWell(
          onTap: onPress,
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
                '${to.symbol} ${(from.rate / to.rate).toStringAsFixed(3)}',
                style: titleStyle,
              )
            ],
          ),
        ),
      ),
    );
  }
}
