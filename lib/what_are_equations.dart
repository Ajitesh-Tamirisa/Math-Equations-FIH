import 'package:flutter/material.dart';

class WhatAreEquations extends StatelessWidget {
  const WhatAreEquations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('What are Equations?'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'What are Equations?',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'An equation is a mathematical statement that asserts the equality of two expressions. '
              'It consists of two expressions, one on each side of an equal sign (=).',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              'Example:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              '2x + 3 = 5',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              'In this example, 2x + 3 and 5 are expressions, and the equation states that they are equal.',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
