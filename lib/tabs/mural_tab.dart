import 'package:flutter/material.dart';
import 'dart:math';

class MuralItem {
  String title;
  String body;
  bool read;

  MuralItem(this.title, this.body, this.read);
}

class MuralTab extends StatefulWidget {
  @override
  _MuralTabState createState() => _MuralTabState();
}

class _MuralTabState extends State<MuralTab> {
  final _postsAddedToInterface = <MuralItem>[];
  final _allItems = <MuralItem>[];

  @override
  void initState() {
    // implement initState
    super.initState();
    // Create mock data
    _allItems.addAll(List<MuralItem>.generate(
    20,
    (i) =>
    MuralItem("Edital #${Random().nextInt(1000)}", "Texto do edital", i % 3 != 0)));
  }

  @override
  Widget build(BuildContext context) {
    // Put all unread items first in the list but keep order (date order)
    List<MuralItem> _readItems = [];
    List<MuralItem> _unreadItems = [];
    for (var i = 0; i < _allItems.length; i++) {
      _allItems[i].read ? _readItems.add(_allItems[i]) : _unreadItems.add(_allItems[i]);
    }
    _allItems.clear();
    _allItems.addAll(_unreadItems);
    _allItems.addAll(_readItems);

    return ListView.builder(
      itemCount: _allItems.length,
      itemBuilder: (context, index) {
        int numOfItemsPerFetch = 10;

        if (index >= _postsAddedToInterface.length) {
          // Skip same number of already added items and add `numOfItemsPerFetch` more
          _postsAddedToInterface.addAll(_allItems.skip(_postsAddedToInterface.length).take(numOfItemsPerFetch));
        }

        return _buildPostRow(_postsAddedToInterface[index]);
      },
      padding: EdgeInsets.all(10.0),
    );
  }

  Widget _buildPostRow(MuralItem item) {
    IconData readIcon =
        item.read ? Icons.chat_bubble_outline : Icons.chat_bubble;
    Color readIconColor = item.read ? Colors.grey : Colors.deepOrange;

    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
      child: Card(
        child: ListTile(
          leading: Icon(readIcon, color: readIconColor),
          title: Text(
            item.title,
            style: TextStyle(
              fontSize: 24.0,
            ),
          ),
          onTap: () {
            showModalBottomSheet<void>(context: context, builder: (BuildContext context) {
              return Container(
                  child: Padding(
                      padding: EdgeInsets.all(32.0),
                      child: Column(
                        children: <Widget>[
                          Text(item.title,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Theme.of(context).accentColor,
                                  fontSize: 24.0
                              )
                          ),
                          Text(item.body),
                        ],
                      ),
                  )
              );
            });
            setState(() {
              int i = _allItems.indexOf(item);
              if (!item.read) {
                _allItems[i].read = true;
              }
            });
          },
        ),
      ),
    );
  }
}
