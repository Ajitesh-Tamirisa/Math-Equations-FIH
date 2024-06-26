import 'package:flutter/material.dart';

class RealWorldApplications extends StatelessWidget {
  const RealWorldApplications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Real-world Applications of Equations'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 8,
          color: const Color(0xFFFFEFD2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Equations are used across many fields such as physics, engineering, and economics to model and solve real-world issues, from designing bridges to developing financial models.',
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Some specific applications include:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                _buildApplicationText('Physics',
                    'Newton\'s laws of motion, Maxwell\'s equations, Einstein\'s equations'),
                _buildApplicationText('Economics',
                    'Modeling economic systems, analyzing market trends, financial predictions'),
                _buildApplicationText('Computer Science',
                    'Algorithms, data analysis, cryptography'),
                _buildApplicationText('Statistics',
                    'Statistical analysis, probability theory, data-based decisions'),
                _buildApplicationText('Biology',
                    'Modeling biological systems, understanding genetics, ecological analysis'),
                _buildApplicationText('Finance',
                    'Pricing financial instruments, risk management, financial analysis'),
                _buildApplicationText('Medicine',
                    'Medical imaging, pharmacokinetics, disease modeling'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildApplicationText(String field, String applications) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          field,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        Text(
          applications,
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
