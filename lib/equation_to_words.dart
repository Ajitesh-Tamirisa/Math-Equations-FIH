import 'dart:math';
import 'package:flutter/material.dart';
import 'instructions_widget.dart';

class EquationToWordsScreen extends StatefulWidget {
  const EquationToWordsScreen({Key? key}) : super(key: key);

  @override
  State<EquationToWordsScreen> createState() => _EquationToWordsScreenState();
}

class _EquationToWordsScreenState extends State<EquationToWordsScreen> {
  final List<Map<String, dynamic>> questions = [
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
      'equation': '9f - 3 = 24',
      'words': ['f', 'nine', 'minus', 'equals', 'three', 'twenty-four'],
      'answer': ['nine', 'f', 'minus', 'three', 'equals', 'twenty-four']
    },
    {
      'equation': '10g + 5 = 35',
      'words': ['g', 'ten', 'plus', 'equals', 'five', 'thirty-five'],
      'answer': ['ten', 'g', 'plus', 'five', 'equals', 'thirty-five']
    },
    {
      'equation': '11h - 6 = 28',
      'words': ['h', 'eleven', 'minus', 'equals', 'six', 'twenty-eight'],
      'answer': ['eleven', 'h', 'minus', 'six', 'equals', 'twenty-eight']
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
    {
      'equation': '8e - 3f = 17',
      'words': ['e', 'f', 'eight', 'three', 'minus', 'equals', 'seventeen'],
      'answer': ['eight', 'e', 'minus', 'three', 'f', 'equals', 'seventeen']
    },
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
    {
      'equation': '4s + 6t - 3u = 20',
      'words': [
        's',
        't',
        'u',
        'four',
        'six',
        'three',
        'plus',
        'minus',
        'equals',
        'twenty'
      ],
      'answer': [
        'four',
        's',
        'plus',
        'six',
        't',
        'minus',
        'three',
        'u',
        'equals',
        'twenty'
      ]
    },
    {
      'equation': '5v - 2w + 4x = 7',
      'words': [
        'v',
        'w',
        'x',
        'five',
        'two',
        'four',
        'plus',
        'minus',
        'equals',
        'seven'
      ],
      'answer': [
        'five',
        'v',
        'minus',
        'two',
        'w',
        'plus',
        'four',
        'x',
        'equals',
        'seven'
      ]
    },
  ];

  int currentQuestionIndex = 0;
  List<String> userAnswer = [];

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

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    final equation = currentQuestion['equation'] as String;
    final words = currentQuestion['words'] as List<String>;
    final answer = currentQuestion['answer'] as List<String>;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Equation to Words Game'),
        actions: [
          InstructionsWidget(
            instructions: 'Welcome to Equations To Words!\n\n'
                'Learn and play with equations.\n\n'
                'Drag and drop the given words into the correct order to match how an equation is read aloud. \n',
          )
        ],
      ),
      body: Container(
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
              children: List.generate(answer.length, (index) {
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
              onPressed: () {
                if (userAnswer.join(' ') == answer.join(' ')) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Correct!')),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Try again.')),
                  );
                }
              },
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
          ],
        ),
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
