import 'package:flutter/material.dart';
import '../placeholder_widget.dart';
import '../tabs/results_tab.dart';

class ResultDetailsScreen extends StatelessWidget {
  final Result result;

  ResultDetailsScreen(this.result);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(result.title),
        elevation: 0.0,
      ),
      body: Card(
        margin: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Text(result.date.toIso8601String().toString()),
            Text('Total de unidades: 61 unidades'),
            Row(
              children: <Widget>[
                Text('43 Votos a favor'),
                Text('================='),
              ],
            ),
            Row(
              children: <Widget>[
                Text('13 Votos contra'),
                Text('======='),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
