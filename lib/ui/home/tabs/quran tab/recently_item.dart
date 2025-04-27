import 'package:flutter/material.dart';
import 'package:islami/model/sura_model.dart';
import 'package:islami/style/color_manager.dart';

// ignore: must_be_immutable
class RecentlyItem extends StatelessWidget {
  SuraModel suraModel;
  RecentlyItem(this.suraModel);
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
                suraModel.suraNameEn,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: ColorManager.blackColor,
                ),
              ),
              Text(
                suraModel.suraNameAr,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: ColorManager.blackColor,
                ),
              ),
              Text(
                "${suraModel.versesNumber} Verses  ",
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
