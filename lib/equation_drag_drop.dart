import 'dart:async';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'instructions_widget.dart';
import 'score_manager.dart';
import 'analytics_engine.dart';

class EquationDragDrop extends StatefulWidget {
  const EquationDragDrop({Key? key}) : super(key: key);

  @override
  State<EquationDragDrop> createState() => _EquationDragDropState();
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
      child: Chip(label: Text(label, style: const TextStyle(fontSize: 18))),
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
    );
  }
}

class DropTarget extends StatefulWidget {
  final String label;
  final List<String> expectedData;
  final bool showResults;
  final List<String> acceptedLabels;
  final ValueChanged<List<String>> onAcceptedLabelsChanged;
  final VoidCallback onCorrectAnswer; // Add this callback

  const DropTarget({
    Key? key,
    required this.label,
    required this.expectedData,
    required this.showResults,
    required this.acceptedLabels,
    required this.onAcceptedLabelsChanged,
    required this.onCorrectAnswer, // Add this parameter
  }) : super(key: key);

  @override
  State<DropTarget> createState() => _DropTargetState();
}

class _DropTargetState extends State<DropTarget> {
  bool hasIncorrectItem = false;

  @override
  Widget build(BuildContext context) {
    Color targetColor = Colors.grey[300]!;
    if (widget.showResults) {
      if (widget.acceptedLabels.isEmpty) {
        targetColor = Colors.grey[300]!;
        hasIncorrectItem = false; // Reset the flag if no items are dropped
      } else if (widget.acceptedLabels
          .any((label) => widget.expectedData.contains(label))) {
        targetColor = Colors.green;
        hasIncorrectItem = false; // Reset the flag if all items are correct
        WidgetsBinding.instance.addPostFrameCallback((_) {
          widget.onCorrectAnswer(); // Call the callback when correct
        });
      } else {
        targetColor = Colors.red;
        hasIncorrectItem =
            true; // Set the flag if any incorrect item is dropped
      }
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        DragTarget<String>(
          onWillAccept: (data) => true,
          onAccept: (receivedItem) {
            setState(() {
              widget.acceptedLabels
                  .add(receivedItem); // Add the received item to the list
              widget.onAcceptedLabelsChanged(
                  widget.acceptedLabels); // Notify parent of changes
            });
          },
          builder: (context, candidateData, rejectedData) {
            return Container(
              width: 150,
              height: 50,
              decoration: BoxDecoration(
                color: hasIncorrectItem
                    ? Colors.red
                    : targetColor, // Use red color if any incorrect item is dropped
                border: Border.all(color: Colors.blue),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  widget.label, // Display the drop target label
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            widget.acceptedLabels
                .join(', '), // Display all accepted labels separated by commas
            style: const TextStyle(fontSize: 18, color: Colors.black),
          ),
        ),
      ],
    );
  }
}

class _EquationDragDropState extends State<EquationDragDrop> {
  bool _showResults = false;
  int _currentQuestionIndex = 0;
  int _questionsAnswered = 0; // Counter for the number of questions answered
  bool _gameCompleted = false; // Flag to check if the game is complete
  final ScoreManager _scoreManager = ScoreManager();
  final ConfettiController _confettiController =
      ConfettiController(duration: const Duration(seconds: 2));
  final ConfettiController _endGameConfettiController =
      ConfettiController(duration: const Duration(seconds: 3));
  bool _scoreUpdated = false; // Flag to ensure score increments only once

  final List<Map<String, dynamic>> _questions = [
    // Your questions here

    {
      'equation': '2x + 3 = 5',
      'draggables': ['2', 'x', '+', '3', '=', '5'],
      'targets': {
        'Coefficient': ['2'],
        'Variable': ['x'],
        'Operator': ['+', '='],
        'Constant': ['3', '5']
      }
    },
    {
      'equation': '3y - 7 = 11',
      'draggables': ['3', 'y', '-', '7', '=', '11'],
      'targets': {
        'Coefficient': ['3'],
        'Variable': ['y'],
        'Operator': ['-', '='],
        'Constant': ['7', '11']
      }
    },
    {
      'equation': '4a + 6 = 10',
      'draggables': ['4', 'a', '+', '6', '=', '10'],
      'targets': {
        'Coefficient': ['4'],
        'Variable': ['a'],
        'Operator': ['+', '='],
        'Constant': ['6', '10']
      }
    },
    {
      'equation': '5b - 8 = 2',
      'draggables': ['5', 'b', '-', '8', '=', '2'],
      'targets': {
        'Coefficient': ['5'],
        'Variable': ['b'],
        'Operator': ['-', '='],
        'Constant': ['8', '2']
      }
    },
    {
      'equation': '6c + 9 = 15',
      'draggables': ['6', 'c', '+', '9', '=', '15'],
      'targets': {
        'Coefficient': ['6'],
        'Variable': ['c'],
        'Operator': ['+', '='],
        'Constant': ['9', '15']
      }
    },
    {
      'equation': '7d - 4 = 3',
      'draggables': ['7', 'd', '-', '4', '=', '3'],
      'targets': {
        'Coefficient': ['7'],
        'Variable': ['d'],
        'Operator': ['-', '='],
        'Constant': ['4', '3']
      }
    },
    {
      'equation': '8e + 12 = 20',
      'draggables': ['8', 'e', '+', '12', '=', '20'],
      'targets': {
        'Coefficient': ['8'],
        'Variable': ['e'],
        'Operator': ['+', '='],
        'Constant': ['12', '20']
      }
    },
    {
      'equation': '9f - 5 = 4',
      'draggables': ['9', 'f', '-', '5', '=', '4'],
      'targets': {
        'Coefficient': ['9'],
        'Variable': ['f'],
        'Operator': ['-', '='],
        'Constant': ['5', '4']
      }
    },
    {
      'equation': '10g + 14 = 24',
      'draggables': ['10', 'g', '+', '14', '=', '24'],
      'targets': {
        'Coefficient': ['10'],
        'Variable': ['g'],
        'Operator': ['+', '='],
        'Constant': ['14', '24']
      }
    },
    {
      'equation': '11h - 9 = 2',
      'draggables': ['11', 'h', '-', '9', '=', '2'],
      'targets': {
        'Coefficient': ['11'],
        'Variable': ['h'],
        'Operator': ['-', '='],
        'Constant': ['9', '2']
      }
    }
  ];

  final Map<String, Map<String, String>> translations = {
    'en': {
      'coefficient': 'Coefficient',
      'variable': 'Variable',
      'operator': 'Operator',
      'constant': 'Constant',
      'check_answers': 'Check Answers',
      'next_question': 'Next Question',
      'game_over': 'Game Over',
      'congratulations': 'Congratulations! Your final score is ',
      'play_again': 'Play Again',
      'instructions':
          'Welcome to Parts of Equations!\n\nLearn and play with equations.\n\nDrag the part of the equation to the correct answer. Once you finish dragging all the parts into the correct boxes, click "Check Answers" button.\n',
    },
    'es': {
      'coefficient': 'Coeficiente',
      'variable': 'Variable',
      'operator': 'Operador',
      'constant': 'Constante',
      'check_answers': 'Verificar respuestas',
      'next_question': 'Siguiente pregunta',
      'game_over': 'Fin del juego',
      'congratulations': '¡Felicidades! Tu puntaje final es ',
      'play_again': 'Jugar de nuevo',
      'instructions':
          '¡Bienvenido a las Partes de Ecuaciones!\n\nAprende y juega con ecuaciones.\n\nArrastra la parte de la ecuación a la respuesta correcta. Una vez que termines de arrastrar todas las partes a las casillas correctas, haz clic en el botón "Verificar respuestas".\n',
    }
  };

  bool isSpanish = false; // Track the current language

  late List<Map<String, dynamic>> _shuffledQuestions;
  List<List<String>> _acceptedLabels = List.generate(4, (index) => []);

  @override
  void initState() {
    super.initState();
    _shuffledQuestions = List.from(_questions);
    _shuffleQuestions();
  }

  void _shuffleQuestions() {
    _shuffledQuestions.shuffle();
  }

  void _checkAnswers() {
    if (_scoreUpdated) return; // Prevent score from updating more than once

    bool allCorrect = true;
    for (int i = 0; i < _acceptedLabels.length; i++) {
      if (!_acceptedLabels[i].every((label) =>
          _shuffledQuestions[_currentQuestionIndex]['targets']
              .values
              .elementAt(i)
              .contains(label))) {
        allCorrect = false;
        break;
      }
    }

    if (allCorrect) {
      _scoreManager.incrementScore(
          10); // Increment the score by 10 if all answers are correct
      _scoreUpdated = true; // Set flag to true to prevent further score updates
      _confettiController.play(); // Play confetti animation

      // Stop confetti animation after a few seconds
      Timer(const Duration(seconds: 2), () {
        _confettiController.stop();
      });
    }

    setState(() {
      _showResults = true;
    });
  }

  void _nextQuestion() {
    setState(() {
      _showResults = false;
      _currentQuestionIndex =
          (_currentQuestionIndex + 1) % _shuffledQuestions.length;
      _resetDropTargets();
      _scoreUpdated = false; // Reset flag for the new question
      _questionsAnswered++;

      if (_questionsAnswered >= 10) {
        _gameCompleted = true; // Set flag to true if 10 questions are answered
        _endGameConfettiController
            .play(); // Play end-of-game confetti animation
      }
    });
  }

  void _resetDropTargets() {
    setState(() {
      _acceptedLabels = List.generate(4, (index) => []);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_gameCompleted) {
      return Scaffold(
        appBar: AppBar(
          title: Text(isSpanish
              ? translations['es']!['game_over']!
              : translations['en']!['game_over']!),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Congratulations! Your final score is ${_scoreManager.score}.',
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Restart the game or navigate to another screen
                  setState(() {
                    _questionsAnswered = 0;
                    _currentQuestionIndex = 0;
                    _gameCompleted = false;
                    _scoreManager.resetScore();
                    _shuffleQuestions();
                    _resetDropTargets();
                  });
                },
                child: Text(isSpanish
                    ? translations['es']!['play_again']!
                    : translations['en']!['play_again']!),
              ),
              const SizedBox(height: 20),
              ConfettiWidget(
                confettiController: _endGameConfettiController,
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
                child: Container(), // Placeholder widget
              ),
            ],
          ),
        ),
      );
    }

    var currentQuestion = _shuffledQuestions[_currentQuestionIndex];
    var equation = currentQuestion['equation'];
    var draggables = currentQuestion['draggables'] as List<String>;
    var targets = currentQuestion['targets'] as Map<String, List<String>>;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Parts of Equations'),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton.icon(
                icon: Icon(
                  IconData(0xe67b,
                      fontFamily:
                          'MaterialIcons'), // Custom icon for translation
                  color: isSpanish
                      ? Colors.blue
                      : Colors.red, // Change icon color based on language
                ),
                label: Text(
                  isSpanish ? 'Español' : 'English',
                  style: TextStyle(
                    color: isSpanish
                        ? Colors.blue
                        : Colors.red, // Change text color based on language
                  ),
                ),
                onPressed: () {
                  setState(() {
                    isSpanish = !isSpanish; // Toggle language
                  });
                  print('Button clicked');
                  AnalyticsEngine.logTranslateButtonClickPOE(
                      isSpanish ? 'Changed to Spanish' : 'Changed to English');
                },
              ),
            ],
          ),
          InstructionsWidget(
              instructions: isSpanish
                  ? translations['es']!['instructions']!
                  : translations['en']!['instructions']!),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ScoreDisplay(score: _scoreManager.score),
          ),
        ],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/Background.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(equation,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold)),
              ),
              Wrap(
                alignment: WrapAlignment.spaceEvenly,
                spacing: 20,
                runSpacing: 20,
                children: draggables
                    .map((label) => DraggableItem(label: label, data: label))
                    .toList(),
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DropTarget(
                    label: isSpanish
                        ? translations['es']!['coefficient']!
                        : translations['en']!['coefficient']!,
                    expectedData: targets['Coefficient']!,
                    showResults: _showResults,
                    acceptedLabels: _acceptedLabels[0],
                    onAcceptedLabelsChanged: (labels) {
                      setState(() {
                        _acceptedLabels[0] = labels;
                      });
                    },
                    onCorrectAnswer: _checkAnswers, // Pass the callback
                  ),
                  DropTarget(
                    label: isSpanish
                        ? translations['es']!['variable']!
                        : translations['en']!['variable']!,
                    expectedData: targets['Variable']!,
                    showResults: _showResults,
                    acceptedLabels: _acceptedLabels[1],
                    onAcceptedLabelsChanged: (labels) {
                      setState(() {
                        _acceptedLabels[1] = labels;
                      });
                    },
                    onCorrectAnswer: _checkAnswers, // Pass the callback
                  ),
                  DropTarget(
                    label: isSpanish
                        ? translations['es']!['operator']!
                        : translations['en']!['operator']!,
                    expectedData: targets['Operator']!,
                    showResults: _showResults,
                    acceptedLabels: _acceptedLabels[2],
                    onAcceptedLabelsChanged: (labels) {
                      setState(() {
                        _acceptedLabels[2] = labels;
                      });
                    },
                    onCorrectAnswer: _checkAnswers, // Pass the callback
                  ),
                  DropTarget(
                    label: isSpanish
                        ? translations['es']!['constant']!
                        : translations['en']!['constant']!,
                    expectedData: targets['Constant']!,
                    showResults: _showResults,
                    acceptedLabels: _acceptedLabels[3],
                    onAcceptedLabelsChanged: (labels) {
                      setState(() {
                        _acceptedLabels[3] = labels;
                      });
                    },
                    onCorrectAnswer: _checkAnswers, // Pass the callback
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _checkAnswers,
                child: Text(isSpanish
                    ? translations['es']!['check_answers']!
                    : translations['en']!['check_answers']!),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _nextQuestion,
                child: Text(isSpanish
                    ? translations['es']!['next_question']!
                    : translations['en']!['next_question']!),
              ),
            ],
          ),
          ConfettiWidget(
            confettiController: _confettiController,
            blastDirectionality: BlastDirectionality.explosive,
            shouldLoop: false,
            colors: const [
              Colors.green,
              Colors.blue,
              Colors.pink,
              Colors.yellow
            ],
            child: Container(), // Placeholder widget
          ),
        ],
      ),
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
