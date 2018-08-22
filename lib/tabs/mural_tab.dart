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
  @override
  Widget build(BuildContext context) {
    final items = List<MuralItem>.generate(
        3, (i) => MuralItem("Edital #$i", "Texto do edital #$i"));
    return Column(
      children: <Widget>[
        Flexible(
          fit: FlexFit.loose,
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final MuralItem item = items[index];

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
                    subtitle: Text(item.body.length > 50
                        ? item.body.substring(0, 50)
                        : item.body),
                  ),
                ),
              );
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
}
