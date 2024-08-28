import 'dart:math';
import 'package:confetti/confetti.dart'; // Add confetti package
import 'package:flutter/material.dart';
import 'instructions_widget.dart';
import 'score_manager.dart';

class EquationToWordsScreen extends StatefulWidget {
  const EquationToWordsScreen({Key? key}) : super(key: key);

  @override
  State<EquationToWordsScreen> createState() => _EquationToWordsScreenState();
}

class _EquationToWordsScreenState extends State<EquationToWordsScreen> {
  final List<Map<String, dynamic>> questions = [
    // Questions list (unchanged)
    {
      'equation': '2x + 4 = 8',
      'words': ['x', 'four', 'times', 'equals', 'two', 'eight', 'plus'],
      'answer': ['two', 'times', 'x', 'plus', 'four', 'equals', 'eight']
    },
    {
      'equation': '3y - 5 = 10',
      'words': ['y', 'three', 'minus', 'equals', 'five', 'ten'],
      'answer': ['three', 'y', 'minus', 'five', 'equals', 'ten']
    },
  ];

  int currentQuestionIndex = 0;
  List<String> userAnswer = [];
  final ScoreManager _scoreManager = ScoreManager();
  final ConfettiController _confettiController =
      ConfettiController(duration: const Duration(seconds: 2));

  @override
  void initState() {
    super.initState();
    _loadRandomQuestion();
  }

  void _loadRandomQuestion() {
    final random = Random();
    currentQuestionIndex = random.nextInt(10000) % questions.length;
    userAnswer = List<String>.filled(
        questions[currentQuestionIndex]['answer'].length, '',
        growable: false);
  }

  void _checkAnswer() {
    final answer = questions[currentQuestionIndex]['answer'] as List<String>;
    if (userAnswer.join(' ') == answer.join(' ')) {
      setState(() {
        _scoreManager.incrementScore(10); // Increment score by 10
        _confettiController.play(); // Play confetti on correct answer
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Correct!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Try again.')),
      );
    }
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    final equation = currentQuestion['equation'] as String;
    final words = currentQuestion['words'] as List<String>;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Equation to Words Game'),
        actions: [
          InstructionsWidget(
            instructions: 'Welcome to Equations To Words!\n\n'
                'Learn and play with equations.\n\n'
                'Drag and drop the given words into the correct order to match how an equation is read aloud. \n',
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ScoreDisplay(score: _scoreManager.score),
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/Background.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(equation,
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(userAnswer.length, (index) {
                    return DropTarget(
                      index: index,
                      label: userAnswer[index],
                      onAccept: (receivedItem) {
                        setState(() {
                          userAnswer[index] = receivedItem;
                        });
                      },
                    );
                  }),
                ),
                const SizedBox(height: 40),
                Wrap(
                  alignment: WrapAlignment.spaceEvenly,
                  spacing: 20,
                  runSpacing: 20,
                  children: words.map((word) {
                    return DraggableItem(
                      label: word,
                      data: word,
                    );
                  }).toList(),
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: _checkAnswer,
                  child: const Text('Check Answer'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _loadRandomQuestion();
                    });
                  },
                  child: const Text('Next Question'),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
          // Confetti widget to celebrate correct answers
          Align(
            alignment: Alignment.center,
            child: ConfettiWidget(
              confettiController: _confettiController,
              blastDirectionality: BlastDirectionality.explosive,
              shouldLoop: false,
              colors: const [
                Colors.green,
                Colors.blue,
                Colors.pink,
                Colors.yellow
              ],
              numberOfParticles: 10,
              emissionFrequency: 0.1,
              gravity: 0.1,
            ),
          ),
        ],
      ),
    );
  }

  void _showInstructions(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Instructions'),
          content: const Text(
              'Drag and drop the words to form the correct equation.'),
          actions: <Widget>[
            TextButton(
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

class DraggableItem extends StatelessWidget {
  final String label;
  final String data;

  const DraggableItem({
    Key? key,
    required this.label,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Draggable<String>(
      data: data,
      feedback: Material(
        child: Chip(
          label: Text(label,
              style: const TextStyle(color: Colors.white, fontSize: 18)),
          backgroundColor: Colors.blue,
        ),
        elevation: 4.0,
      ),
      childWhenDragging: Chip(
        label: Text(label,
            style: const TextStyle(color: Colors.grey, fontSize: 18)),
      ),
      child: Chip(label: Text(label, style: const TextStyle(fontSize: 18))),
    );
  }
}

class DropTarget extends StatelessWidget {
  final int index;
  final String label;
  final Function(String) onAccept;

  const DropTarget(
      {Key? key,
      required this.index,
      required this.label,
      required this.onAccept})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DragTarget<String>(
      onWillAccept: (data) => true,
      onAccept: onAccept,
      builder: (context, candidateData, rejectedData) {
        return Container(
          width: 70,
          height: 50,
          margin: const EdgeInsets.symmetric(horizontal: 5.0),
          decoration: BoxDecoration(
            color: Colors.grey[300],
            border: Border.all(color: Colors.blue),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              label.isEmpty ? '' : label,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: label.isEmpty ? Colors.black : Colors.blue),
            ),
          ),
        );
      },
    );
  }
}

class ScoreDisplay extends StatelessWidget {
  final int score;

  const ScoreDisplay({Key? key, required this.score}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Text(
        'Score: $score',
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}
