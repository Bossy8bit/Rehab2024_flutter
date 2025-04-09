import 'package:flutter/material.dart';
import 'CustomScaffold.dart';

class BasicScaffold extends StatelessWidget {
  final Function(Locale) changeLanguage;

  const BasicScaffold({super.key, required this.changeLanguage});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      changeLanguage: changeLanguage,
      appBar: AppBar(
        title: const Text('Exercise List'),
        backgroundColor: Colors.blue,
      ),
      body: const Column()
    );
  }
}
