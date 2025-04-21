import 'package:flutter/material.dart';

class TimeTab extends StatelessWidget {
  const TimeTab({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/imeges/time_back.jpg"),
        ),
      ),
    );
  }
}
