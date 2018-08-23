import 'package:flutter/material.dart';
import 'dart:math';

class ResultsTab extends StatefulWidget {
  @override
  _ResultsTabState createState() => _ResultsTabState();
}

class Result {
  String title;
  DateTime date;

  Result(this.title, this.date);
}

class _ResultsTabState extends State<ResultsTab> {

  final _results = <Result>[];

  @override
  void initState() {
    // implement initState
    super.initState();
    // Create mock data
    _results.addAll(List<Result>.generate(
        50,
            (i) =>
            Result("Apuração #${Random().nextInt(1000)}", DateTime.now())));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _results.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text(_results[index].title, style: TextStyle(fontSize: 18.0),),
            subtitle: Text(_results[index].date.toLocal().toString()),
          ),
          margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
        );
      },
      padding: EdgeInsets.all(20.0),
    );
  }
}
