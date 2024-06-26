import 'package:flutter/material.dart';

class ImportanceOfEquations extends StatelessWidget {
  const ImportanceOfEquations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Importance of Equations in Mathematics'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 8,
          color: const Color(0xFFD2FFEC),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Equations are fundamental in mathematics for defining relationships between variables. They are crucial in fields like algebra, where they help solve problems and model situations.',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 16),
                Text(
                  'Importance of Equations:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  '- Foundation of Mathematics: Equations are a fundamental part of mathematics, forming the basis for more complex concepts and calculations.',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 8),
                Text(
                  '- Problem-Solving Skills: Learning to solve equations enhances your problem-solving abilities, allowing you to tackle various types of mathematical problems.',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 8),
                Text(
                  '- Real-World Applications: Equations are used in everyday life, from calculating distances and expenses to understanding scientific phenomena.',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 8),
                Text(
                  '- Logical Thinking: Working with equations helps develop logical thinking and reasoning skills, which are valuable in many aspects of life and other subjects.',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 8),
                Text(
                  '- Predictive Power: Equations enable us to predict outcomes and understand relationships between different variables, which is essential in science and engineering.',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 8),
                Text(
                  '- Critical for Higher Education: Mastering equations is crucial for success in higher-level math courses and STEM (Science, Technology, Engineering, and Mathematics) fields.',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 8),
                Text(
                  '- Boosts Confidence: Successfully solving equations boosts your confidence and encourages a positive attitude towards learning mathematics.',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
