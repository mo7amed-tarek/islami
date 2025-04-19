import 'package:flutter/material.dart';
import 'package:islami/style/color_manager.dart';

class RecentlyItem extends StatelessWidget {
  const RecentlyItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 7, horizontal: 9),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: ColorManager.primary,
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Al-Anbiya",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: ColorManager.blackColor,
                ),
              ),
              Text(
                "الأنبياء",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: ColorManager.blackColor,
                ),
              ),
              Text(
                "112 Verses  ",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: ColorManager.blackColor,
                ),
              ),
            ],
          ),
          Image.asset("assets/imeges/recent.png"),
        ],
      ),
    );
  }
}
