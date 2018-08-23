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
      body: PlaceholderWidget(result.date.toLocal().toString()),
    );
  }
}