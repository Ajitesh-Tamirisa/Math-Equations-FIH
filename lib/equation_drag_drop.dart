import 'package:flutter/material.dart';

class EquationDragDrop extends StatefulWidget {
  const EquationDragDrop({Key? key}) : super(key: key);

  @override
  State<EquationDragDrop> createState() => _EquationDragDropState();
}

class _EquationDragDropState extends State<EquationDragDrop> {
  bool _showResults = false;

  void _checkAnswers() {
    setState(() {
      _showResults = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Equation Drag Drop'),
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
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text('2x + 3 = 5',
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              ),
              Wrap(
                alignment: WrapAlignment.spaceEvenly,
                spacing: 20,
                runSpacing: 20,
                children: const [
                  DraggableItem(label: '2', data: '2'),
                  DraggableItem(label: 'x', data: 'x'),
                  DraggableItem(label: '+', data: '+'),
                  DraggableItem(label: '3', data: '3'),
                  DraggableItem(label: '=', data: '='),
                  DraggableItem(label: '5', data: '5'),
                ],
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DropTarget(
                      label: 'Coefficient',
                      expectedData: ['2'],
                      showResults: _showResults),
                  DropTarget(
                      label: 'Variable',
                      expectedData: ['x'],
                      showResults: _showResults),
                  DropTarget(
                      label: 'Operator',
                      expectedData: ['+', '='],
                      showResults: _showResults),
                  DropTarget(
                      label: 'Constant',
                      expectedData: ['3', '5'],
                      showResults: _showResults),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _checkAnswers,
                child: const Text('Check Answers'),
              ),
            ],
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

  const DropTarget({
    Key? key,
    required this.label,
    required this.expectedData,
    required this.showResults,
  }) : super(key: key);

  @override
  State<DropTarget> createState() => _DropTargetState();
}

class _DropTargetState extends State<DropTarget> {
  List<String> acceptedLabels = []; // List to store all accepted labels
  bool hasIncorrectItem =
      false; // Flag to track if any incorrect item has been dropped

  @override
  Widget build(BuildContext context) {
    Color targetColor = Colors.grey[300]!;
    if (widget.showResults) {
      if (acceptedLabels.isEmpty) {
        targetColor = Colors.grey[300]!;
        hasIncorrectItem = false; // Reset the flag if no items are dropped
      } else if (acceptedLabels
          .any((label) => widget.expectedData.contains(label))) {
        targetColor = Colors.green;
        hasIncorrectItem = false; // Reset the flag if all items are correct
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
              acceptedLabels
                  .add(receivedItem); // Add the received item to the list
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
            acceptedLabels
                .join(', '), // Display all accepted labels separated by commas
            style: const TextStyle(fontSize: 18, color: Colors.black),
          ),
        ),
      ],
    );
  }
}
