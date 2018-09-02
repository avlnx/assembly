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
    _questions.add(
        Question(2, 'Você é a favor de trocar o síndico??',
            DateTime.now(), [
              Choice('Sim', 0),
              Choice('Não', 1),
            ])
    );
  }

  Question getNextQuestion() {
    return _questions.length > 0 ? _questions.first : null;
  }

  void confirmQuestionsChoice() {
    // Remove the answered question from the queue
    Question question;
    question = _questions.removeAt(0);
    Choice choice = question.choices[_selected];
    // Update interface
    setState(() {
      _selected = null;
    });

    // TODO: save questions choice in backend
    // carry on
  }

  @override
  Widget build(BuildContext context) {
    Question question = getNextQuestion();

    if (question == null) {
      // Done
      return Padding(
        padding: EdgeInsets.all(10.0),
        child: Center(
          child: Text(
            'Você não tem votações pendentes :)',
            style: TextStyle(color: Colors.white, fontSize: 48.0),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

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
              child: ListView.separated(
                itemCount: question.choices.length,
                separatorBuilder: (context, index) => Divider(),
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      question.choices[index].title,
                      style: TextStyle(fontSize: 20.0),
                    ),
                    leading: Icon(
                      index == _selected
                          ? Icons.check_circle
                          : Icons.radio_button_unchecked,
                      size: 36.0,
                      color: Colors.blueAccent,
                    ),
                    contentPadding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                    onTap: () {
                      setState(() {
                        _selected = index;
                      });
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
            onPressed: confirmQuestionsChoice,
          ),
        ],
      ),
      padding: EdgeInsets.all(10.0),
    );
  }
}
