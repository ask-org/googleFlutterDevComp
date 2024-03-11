import 'package:ant_new/router.dart';
import 'package:ant_new/scout/player.dart';
import 'package:ant_new/style/my_button.dart';
import 'package:ant_new/style/palette.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ChoosePlayerPage extends StatefulWidget {
  const ChoosePlayerPage({super.key});

  @override
  State<ChoosePlayerPage> createState() => _ChoosePlayerPageState();
}

class _ChoosePlayerPageState extends State<ChoosePlayerPage> {
  List<String> list = <String>['Scout', 'Medic', 'Warrior', 'Player'];
  String dropdownValue = "Scout";
  String dropdownValue1 = "Warrior";
  String dropdownValue2 = "Player";
  String dropdownValue3 = "Medic";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: palette.backgroundPlaySession,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Center(
            child: Text(
              'Choose Player',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Permanent Marker',
                fontSize: 55,
                height: 1,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                backgroundColor: palette.backgroundSettings,
                radius: 40,
                child: Image.asset("assets/images/scout.png"),
              ),
              DropdownButton(
                items: list.map((String value) {
                  return DropdownMenuItem(value: value, child: Text(value));
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    dropdownValue = value!;
                  });
                },
                iconSize: 40,
                value: dropdownValue,
                style: TextStyle(
                  color: palette.ink,
                  fontSize: 20,
                  fontFamily: 'Permanent Marker',
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                backgroundColor: palette.backgroundLevelSelection,
                radius: 40,
                child: Image.asset("assets/images/warrior.png"),
              ),
              DropdownButton(
                items: list.map((String value) {
                  return DropdownMenuItem(value: value, child: Text(value));
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    dropdownValue1 = value!;
                  });
                },
                iconSize: 40,
                value: dropdownValue1,
                style: TextStyle(
                  color: palette.ink,
                  fontSize: 20,
                  fontFamily: 'Permanent Marker',
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                backgroundColor: palette.backgroundLevelSelection,
                radius: 40,
                child: Image.asset("assets/images/player.png"),
              ),
              DropdownButton(
                items: list.map((String value) {
                  return DropdownMenuItem(value: value, child: Text(value));
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    dropdownValue2 = value!;
                  });
                },
                iconSize: 40,
                value: dropdownValue2,
                style: TextStyle(
                  color: palette.ink,
                  fontSize: 20,
                  fontFamily: 'Permanent Marker',
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                backgroundColor: palette.backgroundLevelSelection,
                radius: 40,
                child: Image.asset("assets/images/medic.png"),
              ),
              DropdownButton(
                items: list.map((String value) {
                  return DropdownMenuItem(value: value, child: Text(value));
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    dropdownValue3 = value!;
                  });
                },
                iconSize: 40,
                value: dropdownValue3,
                style: TextStyle(
                  color: palette.ink,
                  fontSize: 20,
                  fontFamily: 'Permanent Marker',
                ),
              )
            ],
          ),
          MyButton(
            onPressed: () {
              GoRouter.of(context).push('/dungeon');
            },
            child: const Text('Enter'),
          ),
        ],
      ),
    );
  }
}
