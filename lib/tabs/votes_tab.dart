import 'package:flutter/material.dart';
import 'dart:math';

class VotesTab extends StatefulWidget {
  @override
  _VotesTabState createState() => _VotesTabState();
}

class Question {
  int id;
  String title;
  DateTime date;
  List<Choice> choices;

  Question(this.id, this.title, this.date, this.choices);
}

class Choice {
  String title;
  int id;

  Choice(this.title, this.id);
}

class _VotesTabState extends State<VotesTab> {
  List<Question> _questions = <Question>[];
  int _selected;

  @override
  void initState() {
    // We will load one pending question at a time
    super.initState();
    // Create mock data
    _questions.add(
      Question(1, 'Qual cor você gostaria que fosse pintado o prédio?',
          DateTime.now(), [
        Choice('Azul', 1),
        Choice('Vermelho', 2),
        Choice('Marrom', 3),
        Choice('Bege', 4),
        Choice('Roxo', 5),
      ]),
    );
  }

  Question getNextQuestion() {
    return _questions.length > 0 ? _questions.first : null;
  }

  @override
  Widget build(BuildContext context) {
    Question question = getNextQuestion();

    return Padding(
      child: Column(
        children: <Widget>[
          Text(
            question.title,
            style: TextStyle(
              fontSize: 36.0,
              color: Colors.white,
            ),
          ),
          Expanded(
            child: Card(
              child: ListView.builder(
                itemCount: question.choices.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      question.choices[index].title,
                      style: TextStyle(fontSize: 20.0),
                    ),
                    leading: Icon(
                      index == _selected ? Icons.check_circle : Icons.radio_button_unchecked,
                      size: 36.0,
                      color: Colors.blueAccent,
                    ),
                    contentPadding: EdgeInsets.all(5.0),
                    onTap: () {
                      setState(() { _selected = index; });
                    },
                  );
                },
              ),
              margin: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 10.0),
            ),
          ),
          RaisedButton(
            child: Text('Confirmar'),
            color: Theme.of(context).buttonColor,
            onPressed: () {},
          ),
        ],
      ),
      padding: EdgeInsets.all(10.0),
    );
  }
}
