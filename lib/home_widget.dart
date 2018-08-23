import 'package:flutter/material.dart';
import 'placeholder_widget.dart';
import 'screens/settings_screen.dart';
import 'tabs/mural_tab.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    MuralTab(),
    PlaceholderWidget('Votações'),
    PlaceholderWidget('Apurações'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          'Desenrola',
          style: TextStyle(
            fontFamily: 'Kaushan Script',
            fontSize: 28.0,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SettingsScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex, // will be set when a new tab is tapped
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.assignment_late),
            title: new Text('Mural'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_balance), title: Text('Votações')),
          BottomNavigationBarItem(
              icon: Icon(Icons.people), title: Text('Apurações')),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
