import 'package:flutter/material.dart';
import 'dart:math';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotation;

  int counter = 0;
  int currentTasbeehIndex = 0;

  final List<String> tasbeehList = [
    'سبحان الله',
    'الحمد لله',
    'لا إله إلا الله',
    'الله أكبر',
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 600),
      vsync: this,
    );

    _rotation = Tween<double>(begin: 0, end: 2 * pi).animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reset();
      }
    });
  }

  void _rotateSebhaAndCount() {
    _controller.forward();
    setState(() {
      counter++;
      if (counter >= 30) {
        counter = 0;
        currentTasbeehIndex = (currentTasbeehIndex + 1) % tasbeehList.length;
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/imeges/sebha_back.jpg"),
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: 30),
          Image.asset("assets/imeges/islami.png"),
          SizedBox(height: 15),
          Text(
            "سَبِّحِ اسْمَ رَبِّكَ الأعلى ",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 36,
            ),
          ),
          SizedBox(height: 20),
          Image.asset("assets/imeges/head_sebha.png", height: 86, width: 145),

          GestureDetector(
            onTap: _rotateSebhaAndCount,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Transform.rotate(
                  angle: _rotation.value,
                  child: Image.asset(
                    "assets/imeges/SebhaBody.png",
                    height: 370,
                    width: 370,
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      tasbeehList[currentTasbeehIndex],
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 8),
                    Text(
                      "$counter ",
                      style: TextStyle(
                        fontSize: 36,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
