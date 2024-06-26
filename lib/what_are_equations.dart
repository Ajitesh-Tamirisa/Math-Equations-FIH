import 'package:flutter/material.dart';
import 'what_are_equations_detail.dart';
import 'importance_of_equations.dart';
import 'real_world_applications.dart';

class WhatAreEquations extends StatelessWidget {
  const WhatAreEquations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('What are Equations?'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const WhatAreEquationsDetail())),
              child: const Text('What Are Equations'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ImportanceOfEquations())),
              child: const Text('Importance of Equations in Mathematics'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RealWorldApplications())),
              child: const Text('Real-world Applications of Equations'),
            ),
          ],
        ),
      ),
    );
  }
}
