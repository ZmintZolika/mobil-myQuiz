import 'package:flutter/material.dart';
import 'questions.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int _currentQuestion = 0;
  int _score = 0;

  final List<String> _shuffledAnswers = [];

  void shuffleAnswers() {
    _shuffledAnswers.clear();
    _shuffledAnswers.addAll(answers[_currentQuestion].toList());
    _shuffledAnswers.shuffle();
  }

  @override
  void initState() {
    super.initState();
    shuffleAnswers();
  }

  void answerQuestion(String currentAnswer) {
    setState(() {
      if (currentAnswer == correctAnswers[_currentQuestion]) {
        _score++;
      }
      if (_currentQuestion < (questions.length - 1)) {
        _currentQuestion++;
        shuffleAnswers();
      } else {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Vége!'),
            content: Text(
              'Megválaszoltad az összes kérdést! \n A helyes válaszok száma: $_score / ${questions.length}',
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kvíz App'),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(questions[_currentQuestion]),
            for (final answer in _shuffledAnswers)
              ElevatedButton(
                onPressed: () => answerQuestion(answer),
                child: Text(answer),
              ),
            Text('Helyes válaszok száma: $_score / $_currentQuestion'),
          ],
        ),
      ),
    );
  }
}
