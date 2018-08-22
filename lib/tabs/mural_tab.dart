import 'package:flutter/material.dart';

class MuralItem {
  final String title;
  final String body;

  MuralItem(this.title, this.body);
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
        31, (i) => MuralItem("Edital #${i+1}", "Texto do edital #${i+1}"));
//    _posts.addAll(items);

    return Column(
      children: <Widget>[
        Flexible(
          fit: FlexFit.loose,
          child: ListView.builder(
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
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
          child: RaisedButton(
            child: Text('Carregar posts já visualizados'),
            onPressed: () => {},
          ),
        ),
      ],
    );
  }

  Widget _buildPostRow(MuralItem item) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
      child: Card(
        child: ListTile(
          title: Center(
              child: Text(
            item.title,
            style: TextStyle(
              fontSize: 24.0,
            ),
          )),
          subtitle: Text(
              item.body.length > 50 ? item.body.substring(0, 50) : item.body),
        ),
      ),
    );
  }
}
