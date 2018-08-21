import 'package:flutter/material.dart';
import '../placeholder_widget.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações'),
      ),
      body: PlaceholderWidget('Configurações'),
    );
  }
}