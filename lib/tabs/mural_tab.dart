import 'package:flutter/material.dart';

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
  final _readItems = <MuralItem>[];
  final _unreadItems = <MuralItem>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Create mock data
    _readItems.addAll(List<MuralItem>.generate(
    11,
    (i) =>
    MuralItem("Edital #${i+1}", "Texto do edital #${i+1}", true)));
    _unreadItems.addAll(List<MuralItem>.generate(
    11,
    (i) =>
    MuralItem("Edital #${i+12}", "Texto do edital #${i+12}", false)));
  }

  @override
  Widget build(BuildContext context) {
    List<MuralItem> _tempAllItems = [];
    _tempAllItems.addAll(_unreadItems);
    _tempAllItems.addAll(_readItems);
    return ListView.builder(
      itemCount: _tempAllItems.length,
      itemBuilder: (context, index) {
        int numOfItemsPerFetch = 10;

        if (index >= _postsAddedToInterface.length) {
          // we reached the end of the list take 10 more
          _postsAddedToInterface.addAll(_tempAllItems.take(numOfItemsPerFetch));
          // get rid of the items already added to the _posts array
          _tempAllItems.length >= numOfItemsPerFetch
              ? _tempAllItems.removeRange(0, numOfItemsPerFetch)
              : _tempAllItems.clear();
        }

        return _buildPostRow(_postsAddedToInterface[index]);
      },
      padding: EdgeInsets.all(20.0),
    );
  }

  Widget _buildPostRow(MuralItem item) {
    IconData readIcon =
        item.read ? Icons.chat_bubble_outline : Icons.chat_bubble;
    Color readIconColor = item.read ? Colors.grey : Colors.deepOrange;

    // Read?


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
          subtitle: Text(
              item.body.length > 50 ? item.body.substring(0, 50) : item.body),
          onTap: () {
            setState(() {
              if (!item.read) {
                item.read = true;
                _readItems.add(item);
                _unreadItems.remove(item);
              } else {
                item.read = false;
                _unreadItems.add(item);
                _readItems.remove(item);
              }
            });
          },
        ),
      ),
    );
  }
}
