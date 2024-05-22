import 'package:flutter/material.dart';

class PartsOfEquations extends StatelessWidget {
  const PartsOfEquations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Parts of Equations'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Parts of Equations',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Equations consist of various parts:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              '1. Coefficient: A numerical or constant quantity placed before and multiplying the variable in an algebraic expression (e.g., 4 in 4x).',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              '2. Variable: A symbol for a number we don’t know yet. It is usually a letter like x or y.',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              '3. Operator: Symbols that represent operations (e.g., +, -, *, /).',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              '4. Constant: A fixed value. In the equation 2x + 3 = 5, 3 and 5 are constants.',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
