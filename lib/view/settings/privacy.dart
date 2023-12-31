import 'package:flutter/material.dart';

class Privacy extends StatelessWidget {
  const Privacy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 1, 56, 86),
        centerTitle: true,
        title: const Text("PRIVACY AND SECURITY"),
      ),
    );
  }
}