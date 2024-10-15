// import 'dart:math';
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
  final List<Map<String, dynamic>> easyQuestions = [
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
    {
      'equation': '4a + 7 = 19',
      'words': ['a', 'four', 'plus', 'equals', 'seven', 'nineteen'],
      'answer': ['four', 'a', 'plus', 'seven', 'equals', 'nineteen']
    },
    {
      'equation': '5b - 2 = 13',
      'words': ['b', 'five', 'minus', 'equals', 'two', 'thirteen'],
      'answer': ['five', 'b', 'minus', 'two', 'equals', 'thirteen']
    },
    {
      'equation': '6c + 3 = 21',
      'words': ['c', 'six', 'plus', 'equals', 'three', 'twenty-one'],
      'answer': ['six', 'c', 'plus', 'three', 'equals', 'twenty-one']
    },
  ];

  final List<Map<String, dynamic>> mediumQuestions = [
    {
      'equation': '7d - 4 = 17',
      'words': ['d', 'seven', 'minus', 'equals', 'four', 'seventeen'],
      'answer': ['seven', 'd', 'minus', 'four', 'equals', 'seventeen']
    },
    {
      'equation': '8e + 2 = 18',
      'words': ['e', 'eight', 'plus', 'equals', 'two', 'eighteen'],
      'answer': ['eight', 'e', 'plus', 'two', 'equals', 'eighteen']
    },
    {
      'equation': '2x + 3y = 14',
      'words': ['x', 'y', 'two', 'three', 'plus', 'equals', 'fourteen'],
      'answer': ['two', 'x', 'plus', 'three', 'y', 'equals', 'fourteen']
    },
    {
      'equation': '4a - 5b = 12',
      'words': ['a', 'b', 'four', 'five', 'minus', 'equals', 'twelve'],
      'answer': ['four', 'a', 'minus', 'five', 'b', 'equals', 'twelve']
    },
    {
      'equation': '6c + 7d = 29',
      'words': ['c', 'd', 'six', 'seven', 'plus', 'equals', 'twenty-nine'],
      'answer': ['six', 'c', 'plus', 'seven', 'd', 'equals', 'twenty-nine']
    },
  ];

  final List<Map<String, dynamic>> hardQuestions = [
    {
      'equation': '5x + 4y - 3z = 10',
      'words': [
        'x',
        'y',
        'z',
        'five',
        'four',
        'three',
        'plus',
        'minus',
        'equals',
        'ten'
      ],
      'answer': [
        'five',
        'x',
        'plus',
        'four',
        'y',
        'minus',
        'three',
        'z',
        'equals',
        'ten'
      ]
    },
    {
      'equation': '7p + 2q - r = 15',
      'words': [
        'p',
        'q',
        'r',
        'seven',
        'two',
        'one',
        'plus',
        'minus',
        'equals',
        'fifteen'
      ],
      'answer': [
        'seven',
        'p',
        'plus',
        'two',
        'q',
        'minus',
        'one',
        'r',
        'equals',
        'fifteen'
      ]
    },
    {
      'equation': '3m - 2n + 4o = 9',
      'words': [
        'm',
        'n',
        'o',
        'three',
        'two',
        'four',
        'plus',
        'minus',
        'equals',
        'nine'
      ],
      'answer': [
        'three',
        'm',
        'minus',
        'two',
        'n',
        'plus',
        'four',
        'o',
        'equals',
        'nine'
      ]
    },
    {
      'equation': '9k + 3l - 6m = 18',
      'words': [
        'k',
        'l',
        'm',
        'nine',
        'three',
        'six',
        'plus',
        'minus',
        'equals',
        'eighteen'
      ],
      'answer': [
        'nine',
        'k',
        'plus',
        'three',
        'l',
        'minus',
        'six',
        'm',
        'equals',
        'eighteen'
      ]
    },
    {
      'equation': '10u - 5v + 2w = 13',
      'words': [
        'u',
        'v',
        'w',
        'ten',
        'five',
        'two',
        'plus',
        'minus',
        'equals',
        'thirteen'
      ],
      'answer': [
        'ten',
        'u',
        'minus',
        'five',
        'v',
        'plus',
        'two',
        'w',
        'equals',
        'thirteen'
      ]
    },
  ];

  int currentQuestionIndex = 0;
  List<String> userAnswer = [];
  final ScoreManager _scoreManager = ScoreManager();
  final ConfettiController _confettiController =
      ConfettiController(duration: const Duration(seconds: 2));
  int currentLevel = 1;
  int totalQuestionsAnswered = 0;
  List<Map<String, dynamic>> currentLevelQuestions = [];

  @override
  void initState() {
    super.initState();
    _loadLevelQuestions();
    _loadRandomQuestion();
  }

  void _loadLevelQuestions() {
    // Load questions based on the current level
    if (currentLevel == 1) {
      currentLevelQuestions = List.from(easyQuestions)..shuffle();
    } else if (currentLevel == 2) {
      currentLevelQuestions = List.from(mediumQuestions)..shuffle();
    } else if (currentLevel == 3) {
      currentLevelQuestions = List.from(hardQuestions)..shuffle();
    }
  }

  void _loadRandomQuestion() {
    currentQuestionIndex =
        totalQuestionsAnswered % currentLevelQuestions.length;
    userAnswer = List<String>.filled(
        currentLevelQuestions[currentQuestionIndex]['answer'].length, '',
        growable: false);
  }

  void _checkAnswer() {
    final answer =
        currentLevelQuestions[currentQuestionIndex]['answer'] as List<String>;
    if (userAnswer.join(' ') == answer.join(' ')) {
      setState(() {
        _scoreManager.incrementScore(10); // Increment score by 10
        _confettiController.play(); // Play confetti on correct answer
        totalQuestionsAnswered++;
        if (totalQuestionsAnswered % currentLevelQuestions.length == 0) {
          _showLevelCompleteDialog(); // Show level complete dialog
        } else {
          _loadRandomQuestion(); // Load next question
        }
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

  void _showLevelCompleteDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Level Complete!'),
          content: Text(
              'Congratulations! You\'ve completed Level $currentLevel.\nYour score is: ${_scoreManager.score}.'),
          actions: <Widget>[
            TextButton(
              child: const Text('Next Level'),
              onPressed: () {
                setState(() {
                  currentLevel++;
                  if (currentLevel > 3) {
                    _showFinalScoreDialog(); // End the game after Level 3
                  } else {
                    totalQuestionsAnswered = 0;
                    _loadLevelQuestions(); // Load questions for the new level
                    _loadRandomQuestion(); // Load the first question of the new level
                  }
                });
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }

  void _showFinalScoreDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Game Complete!'),
          content: Text(
              'You\'ve completed all levels! Your final score is: ${_scoreManager.score}.'),
          actions: <Widget>[
            TextButton(
              child: const Text('Restart Game'),
              onPressed: () {
                setState(() {
                  currentLevel = 1;
                  totalQuestionsAnswered = 0;
                  _scoreManager.resetScore();
                  _loadLevelQuestions();
                  _loadRandomQuestion();
                });
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = currentLevelQuestions[currentQuestionIndex];
    final equation = currentQuestion['equation'] as String;
    final words = currentQuestion['words'] as List<String>;

    return Scaffold(
      appBar: AppBar(
        title: Text('Level $currentLevel'),
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
