import 'package:flutter/material.dart';

class WhatAreEquations extends StatefulWidget {
  const WhatAreEquations({Key? key}) : super(key: key);

  @override
  State<WhatAreEquations> createState() => _WhatAreEquationsState();
}

class _WhatAreEquationsState extends State<WhatAreEquations> {
  String? selectedAnswer;
  bool showAnswer = false;

  void checkAnswer(String answer) {
    setState(() {
      selectedAnswer = answer;
      showAnswer = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('What are Equations?'),
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.all(16.0),
          elevation: 8,
          color: const Color(0xFFFEFFD2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'What are Equations?',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'An equation is a mathematical statement that asserts the equality of two expressions. '
                    'It consists of two expressions, one on each side of an equal sign (=).',
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Example:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    '2x + 3 = 5',
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Quiz:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'In this example, 2x + 3 and 5 are expressions, and the equation states that they are equal.',
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 20),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () => checkAnswer('True'),
                        style: ButtonStyle(
                          backgroundColor: selectedAnswer == 'True'
                              ? MaterialStateProperty.all(Colors.green)
                              : null,
                        ),
                        child: const Text('True'),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () => checkAnswer('False'),
                        style: ButtonStyle(
                          backgroundColor: selectedAnswer == 'False'
                              ? MaterialStateProperty.all(Colors.red)
                              : null,
                        ),
                        child: const Text('False'),
                      ),
                    ],
                  ),
                  if (showAnswer)
                    Text(
                      selectedAnswer == 'True'
                          ? 'Correct! Equations consist of two expressions separated by an equal sign.'
                          : 'Incorrect. Equations consist of two expressions separated by an equal sign.',
                      style: const TextStyle(fontSize: 18),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
