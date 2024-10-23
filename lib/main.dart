// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Drag and Drop Equation',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const Scaffold(
//         body: EquationDragDrop(),
//       ),
//     );
//   }
// }

// class EquationDragDrop extends StatefulWidget {
//   const EquationDragDrop({Key? key}) : super(key: key);

//   @override
//   State<EquationDragDrop> createState() => _EquationDragDropState();
// }

// class _EquationDragDropState extends State<EquationDragDrop> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//         const Padding(
//           padding: EdgeInsets.all(20.0),
//           child: Text('2x + 3 = 5',
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
//         ),
//         Wrap(
//           alignment: WrapAlignment.spaceEvenly,
//           spacing: 20,
//           runSpacing: 20,
//           children: const [
//             DraggableItem(label: '2', data: '2'),
//             DraggableItem(label: 'x', data: 'x'),
//             DraggableItem(label: '+', data: '+'),
//             DraggableItem(label: '3', data: '3'),
//             DraggableItem(label: '=', data: '='),
//             DraggableItem(label: '5', data: '5'),
//           ],
//         ),
//         const SizedBox(height: 40),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: const [
//             DropTarget(label: 'Coefficient', expectedData: ['2']),
//             DropTarget(label: 'Variable', expectedData: ['x']),
//             DropTarget(label: 'Operator', expectedData: ['+', '=']),
//             DropTarget(label: 'Constant', expectedData: ['3', '5']),
//           ],
//         ),
//       ],
//     );
//   }
// }

// class DraggableItem extends StatelessWidget {
//   final String label;
//   final String data;

//   const DraggableItem({
//     Key? key,
//     required this.label,
//     required this.data,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Draggable<String>(
//       data: data,
//       child: Chip(label: Text(label, style: const TextStyle(fontSize: 18))),
//       feedback: Material(
//         child: Chip(
//           label: Text(label,
//               style: const TextStyle(color: Colors.white, fontSize: 18)),
//           backgroundColor: Colors.blue,
//         ),
//         elevation: 4.0,
//       ),
//       childWhenDragging: Chip(
//         label: Text(label,
//             style: const TextStyle(color: Colors.grey, fontSize: 18)),
//       ),
//     );
//   }
// }

// class DropTarget extends StatefulWidget {
//   final String label;
//   final List<String> expectedData;

//   const DropTarget({Key? key, required this.label, required this.expectedData})
//       : super(key: key);

//   @override
//   State<DropTarget> createState() => _DropTargetState();
// }

// class _DropTargetState extends State<DropTarget> {
//   List<String> acceptedLabels = []; // List to store all accepted labels

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         DragTarget<String>(
//           onWillAccept: (data) => widget.expectedData.contains(data),
//           onAccept: (receivedItem) {
//             setState(() {
//               acceptedLabels
//                   .add(receivedItem); // Add the received item to the list
//             });
//           },
//           builder: (context, candidateData, rejectedData) {
//             return Container(
//               width: 150,
//               height: 50,
//               decoration: BoxDecoration(
//                 color:
//                     acceptedLabels.isNotEmpty ? Colors.green : Colors.grey[300],
//                 border: Border.all(color: Colors.blue),
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Center(
//                 child: Text(
//                   widget.label, // Display the drop target label
//                   style: const TextStyle(
//                       fontSize: 20, fontWeight: FontWeight.bold),
//                 ),
//               ),
//             );
//           },
//         ),
//         Padding(
//           padding: const EdgeInsets.only(top: 8.0),
//           child: Text(
//             acceptedLabels
//                 .join(', '), // Display all accepted labels separated by commas
//             style: const TextStyle(fontSize: 18, color: Colors.black),
//           ),
//         ),
//       ],
//     );
//   }
// }

//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
// import 'package:flutter/material.dart';

// void main() {
//   runApp(MathEquationsApp());
// }

// class MathEquationsApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Math Equations',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: HomePage(),
//     );
//   }
// }

// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image:
//                 AssetImage('assets/images/background.png'), // Your image path
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text(
//                 'Learn\nEquations',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontSize: 32,
//                   fontWeight: FontWeight.bold,
//                   color: Colors
//                       .black, // Ensure text is visible over the background
//                 ),
//               ),
//               SizedBox(height: 50),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => WhatAreEquationsPage()),
//                   );
//                 },
//                 child: Text('What are equations ?'),
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => PartsOfEquationsPage()),
//                   );
//                 },
//                 child: Text('Parts of Equations'),
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => LinearEquationsPage()),
//                   );
//                 },
//                 child: Text('Linear Equations'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class WhatAreEquationsPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('What are equations?'),
//       ),
//       body: Center(
//         child: Text(
//           'Content about what equations are...',
//           style: TextStyle(fontSize: 24),
//         ),
//       ),
//     );
//   }
// }

// class PartsOfEquationsPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Parts of Equations'),
//       ),
//       body: Center(
//         child: Text(
//           'Content about parts of equations...',
//           style: TextStyle(fontSize: 24),
//         ),
//       ),
//     );
//   }
// }

// class LinearEquationsPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Linear Equations'),
//       ),
//       body: Center(
//         child: Text(
//           'Content about linear equations...',
//           style: TextStyle(fontSize: 24),
//         ),
//       ),
//     );
//   }
// }
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
import 'package:flutter/material.dart';
import 'main_menu.dart';
import 'play_menu.dart';
import 'learn_menu.dart';
import 'equation_drag_drop.dart';
import 'what_are_equations.dart';
import 'parts_of_equations.dart';
import 'equation_to_words.dart';
import 'what_are_equations_detail.dart';
import 'importance_of_equations.dart';
import 'real_world_applications.dart';
import 'analytics_engine.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await AnalyticsEngine.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Math Equations',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MainMenu(),
        '/learn': (context) => const LearnMenu(),
        '/play': (context) => const PlayMenu(),
        '/partsOfEquation': (context) => const EquationDragDrop(),
        '/equationToWords': (context) => const EquationToWordsScreen(),
        '/whatAreEquations': (context) => const WhatAreEquations(),
        '/partsOfEquations': (context) => const PartsOfEquations(),
        '/whatAreEquationsDetail': (context) => const WhatAreEquationsDetail(),
        '/importanceOfEquations': (context) => const ImportanceOfEquations(),
        '/realWorldApplications': (context) => const RealWorldApplications(),
      },
    );
  }
}
