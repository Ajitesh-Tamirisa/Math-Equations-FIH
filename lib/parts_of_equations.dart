import 'package:flutter/material.dart';

class PartsOfEquations extends StatelessWidget {
  const PartsOfEquations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Parts of Equations'),
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.all(16.0),
          elevation: 8,
          color: const Color(0xFFFEFFD2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Parts of Equations',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Equations consist of various parts:',
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    '1. Coefficient: A numerical or constant quantity placed before and multiplying the variable in an algebraic expression (e.g., 4 in 4x).',
                    style: TextStyle(fontSize: 18),
                  ),
                  const Text(
                    '2. Variable: A symbol for a number we don’t know yet. It is usually a letter like x or y.',
                    style: TextStyle(fontSize: 18),
                  ),
                  const Text(
                    '3. Operator: Symbols that represent operations (e.g., +, -, *, /).',
                    style: TextStyle(fontSize: 18),
                  ),
                  const Text(
                    '4. Constant: A fixed value. In the equation 2x + 3 = 5, 3 and 5 are constants.',
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: Image.asset(
                      'assets/images/PartsOfEquation.png',
                      height: 300, // Set the height of the image
                      width: MediaQuery.of(context).size.width *
                          0.8, // Set the width of the image
                      fit: BoxFit.contain,
                    ), // Change the path to your image asset
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
