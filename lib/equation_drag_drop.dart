import 'package:flutter/material.dart';

class EquationDragDrop extends StatefulWidget {
  const EquationDragDrop({Key? key}) : super(key: key);

  @override
  State<EquationDragDrop> createState() => _EquationDragDropState();
}

class _EquationDragDropState extends State<EquationDragDrop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                children: const [
                  DropTarget(label: 'Coefficient', expectedData: ['2']),
                  DropTarget(label: 'Variable', expectedData: ['x']),
                  DropTarget(label: 'Operator', expectedData: ['+', '=']),
                  DropTarget(label: 'Constant', expectedData: ['3', '5']),
                ],
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

  const DropTarget({Key? key, required this.label, required this.expectedData})
      : super(key: key);

  @override
  State<DropTarget> createState() => _DropTargetState();
}

class _DropTargetState extends State<DropTarget> {
  List<String> acceptedLabels = []; // List to store all accepted labels

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        DragTarget<String>(
          onWillAccept: (data) => widget.expectedData.contains(data),
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
                color:
                    acceptedLabels.isNotEmpty ? Colors.green : Colors.grey[300],
                border: Border.all(color: Colors.blue),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  widget.label, // Display the drop target label
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
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
