import 'package:flutter/material.dart';
class DayList extends StatefulWidget {
  final Color backGroundColor;
  const DayList({super.key, required this.backGroundColor});

  @override
  State<DayList> createState() => _DayListState();
}

class _DayListState extends State<DayList> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(
              width: 1.0, color: Colors.deepPurple,
            ),
          ),
          width: 10.0,
          height: 60,
        )
      ],
    );
  }
}