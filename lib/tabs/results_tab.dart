import 'package:flutter/material.dart';
import 'dart:math';
import '../screens/result_details_screen.dart';

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
    _results.addAll(List<Result>.generate(50,
        (i) => Result("Apuração #${Random().nextInt(1000)}", DateTime.now())));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _results.length,
      itemBuilder: (context, index) {
        DateTime date = _results[index].date;
        String dateSlug ="${date.day.toString().padLeft(2,'0')}/${date.month.toString().padLeft(2,'0')}/${date.year.toString()}";

        return Card(
          child: ListTile(
            title: Text(
              _results[index].title,
              style: TextStyle(fontSize: 18.0),
            ),
            subtitle: Text(
              dateSlug,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultDetailsScreen(_results[index]),
                ),
              );
            },
          ),
          margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
        );
      },
      padding: EdgeInsets.all(10.0),
    );
  }
}
