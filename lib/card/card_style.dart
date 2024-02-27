import 'package:flutter/material.dart';

class CardStyle extends StatelessWidget {
  final String title;
  final String description;

  const CardStyle({Key? key, required this.title, required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(title, style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 8),
            Text(description, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
