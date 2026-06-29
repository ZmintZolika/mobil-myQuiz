import 'package:flutter/material.dart';
import 'quiz.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Üdvözöljük a Kvíz App-ban!'),
        foregroundColor: Colors.white,
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Kezdődhet a kvíz?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const Quiz()),
              ),
              child: Column(
                children: [Text('Kezdjük!'), Icon(Icons.arrow_forward)],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
