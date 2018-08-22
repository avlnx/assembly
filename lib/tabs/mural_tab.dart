import 'package:flutter/material.dart';

class MuralItem {
  final String title;
  final String body;
  final bool read;

  MuralItem(this.title, this.body, this.read);
}

class MuralTab extends StatefulWidget {
  @override
  _MuralTabState createState() => _MuralTabState();
}

class _MuralTabState extends State<MuralTab> {
  final _posts = <MuralItem>[];

  @override
  Widget build(BuildContext context) {
    final items = List<MuralItem>.generate(
        31, (i) => MuralItem("Edital #${i+1}", "Texto do edital #${i+1}", i % 2 == 0));

    // Sort items by read status
    items.sort((a, b) => a.read.compareTo(b.read));

    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        int numOfItemsPerFetch = 10;

        if (index >= _posts.length) {
          // we reached the end of the list take 10 more
          _posts.addAll(items.take(numOfItemsPerFetch));
          // get rid of the items already added to the _posts array
          items.length >= numOfItemsPerFetch
              ? items.removeRange(0, numOfItemsPerFetch)
              : items.clear();
        }

        return _buildPostRow(_posts[index]);
      },
      padding: EdgeInsets.all(20.0),
    );
  }

  Widget _buildPostRow(MuralItem item) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
      child: Card(
        child: ListTile(
          leading: Icon(Icons.chat_bubble, color: Colors.deepOrange,),
          title: Text(
            item.title,
            style: TextStyle(
              fontSize: 24.0,
            ),
          ),
          subtitle: Text(
              item.body.length > 50 ? item.body.substring(0, 50) : item.body),
        ),
      ),
    );
  }
}
