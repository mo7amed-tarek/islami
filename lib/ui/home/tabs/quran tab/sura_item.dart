import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami/model/sura_model.dart';
import 'package:islami/style/methods.dart';
import 'package:islami/ui/home/tabs/quran%20tab/quran_detels_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class SuraItem extends StatelessWidget {
  SuraModel suraModel;
  void Function() onPress;
  SuraItem({required this.suraModel, required this.onPress});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        onPress();
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => QuranDetailsScreen(suraModel: suraModel),
          ),
        );
      },
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SvgPicture.asset(
                "assets/imeges/hexagonal.svg",
                height: calculateHeight(64, screenHeight),
                width: calculateWidth(64, screenWidth),
              ),
              Text(
                suraModel.suraNumber.toString(),
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(width: 24.w),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  suraModel.suraNameEn,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  "${suraModel.versesNumber} Verses",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          Text(
            suraModel.suraNameAr,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
