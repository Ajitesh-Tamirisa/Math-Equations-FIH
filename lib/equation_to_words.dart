import 'package:flutter/material.dart';

class EquationToWordsScreen extends StatefulWidget {
  const EquationToWordsScreen({Key? key}) : super(key: key);

  @override
  State<EquationToWordsScreen> createState() => _EquationToWordsScreenState();
}

class _EquationToWordsScreenState extends State<EquationToWordsScreen> {
  final List<String> words = [
    'x',
    'four',
    'times',
    'equals',
    'two',
    'eight',
    'plus'
  ];
  final List<String> answer = [
    'two',
    'times',
    'x',
    'plus',
    'four',
    'equals',
    'eight'
  ];
  List<String> userAnswer = List<String>.filled(7, '', growable: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Equation to Words Game'),
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
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text('2x + 4 = 8',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(7, (index) {
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
          ],
        ),
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
