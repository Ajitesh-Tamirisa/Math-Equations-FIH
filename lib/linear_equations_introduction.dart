import 'package:flutter/material.dart';

class LinearEquationsContent extends StatelessWidget {
  const LinearEquationsContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Linear Equations'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const SectionTitle(title: 'Definition of Linear Equations'),
            const SectionText(
              text:
                  'Linear equations are algebraic equations that describe a straight line relationship between variables. They are called "linear" because the highest power of the variable is 1. In general, a linear equation takes the form: Ax + By + C = 0, where A, B, and C are constants, and x and y are variables.',
            ),
            const SectionTitle(title: 'Standard Form (Ax + B = C)'),
            const SectionText(
              text:
                  'The standard form of a linear equation is Ax + By = C, where A, B, and C are constants, and A and B are not both zero. This form is useful for graphing linear equations and finding their intercepts.',
            ),
            const SectionTitle(title: 'Slope-Intercept Form (y = mx + b)'),
            const SectionText(
              text:
                  'The slope-intercept form of a linear equation is y = mx + b, where m is the slope of the line and b is the y-intercept (the point where the line crosses the y-axis). This form is convenient for graphing linear equations and determining the slope and y-intercept.',
            ),
            const SectionTitle(title: 'Examples of Linear Equations'),
            const SectionText(
              text:
                  '1. 2x + 3y = 7\n2. -5x + 4y = -12\n3. 3x - 6y = 18\n4. 4x + y = 10\n5. -2x - 5y = -15\n...',
            ),
          ],
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class SectionText extends StatelessWidget {
  final String text;

  const SectionText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
