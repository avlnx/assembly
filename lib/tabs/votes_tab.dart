import 'package:flutter/material.dart';
import 'dart:math';

class VotesTab extends StatefulWidget {
  @override
  _VotesTabState createState() => _VotesTabState();
}

class Vote {
  String title;
  DateTime date;

  Vote(this.title, this.date);
}

class _VotesTabState extends State<VotesTab> {
  final _results = <Vote>[];

  @override
  void initState() {
    // implement initState
    super.initState();
    // Create mock data
    _results.addAll(List<Vote>.generate(
        50, (i) => Vote("Votação #${Random().nextInt(1000)}", DateTime.now())));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      child: Card(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Center(
                child: Text(
                  'Qual cor você gostaria que fosse pintado o prédio?',
                  style: TextStyle(fontSize: 32.0, ),
                ),
              ),
            ),
            ListTile(
              title: Text('Azul',
              style: TextStyle(fontSize: 24.0),),
              leading: Icon(Icons.radio_button_checked),
            ),
            ListTile(
              title: Text('Vermelho',
                style: TextStyle(fontSize: 24.0),),
              leading: Icon(Icons.radio_button_unchecked),
            ),
            ListTile(
              title: Text('Marrom',
                style: TextStyle(fontSize: 24.0),),
              leading: Icon(Icons.radio_button_unchecked),
            ),
            ListTile(
              title: Text('Bege',
                style: TextStyle(fontSize: 24.0),),
              leading: Icon(Icons.radio_button_unchecked),
            ),
          ],
        ),
        margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
      ),
      padding: EdgeInsets.all(10.0),
    );
  }
}
