import 'package:flutter/material.dart';

class ScoutPage extends StatefulWidget {
  const ScoutPage({super.key});

  @override
  State<ScoutPage> createState() => _ScoutPageState();
}

class _ScoutPageState extends State<ScoutPage> {
  String movement = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
                // grid
                ),
          ),
          Wrap(
            children: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.abc_sharp)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.abc_sharp)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.abc_sharp)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.abc_sharp)),
            ],
          ),
        ],
      ),
    );
  }
}
