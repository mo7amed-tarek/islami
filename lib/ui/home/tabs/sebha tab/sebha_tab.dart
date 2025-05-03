import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/style/color_manager.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;
  int currentTasbeehIndex = 0;
  double _rotationAngle = 0;

  final List<String> tasbeehList = [
    'سبحان الله',
    'الحمد لله',
    'لا إله إلا الله',
    'الله أكبر',
  ];

  void _rotateSebhaAndCount() {
    setState(() {
      counter++;
      _rotationAngle += pi / 10;
      if (counter >= 30) {
        counter = 0;
        currentTasbeehIndex = (currentTasbeehIndex + 1) % tasbeehList.length;
      }
    });
  }

  void _resetSebha() {
    setState(() {
      counter = 0;
      currentTasbeehIndex = 0;
      _rotationAngle = 0;
    });
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
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            SizedBox(height: 30.h),
            Image.asset(
              "assets/imeges/islami.png",
              width: 299.h,
              height: 141.w,
            ),
            Spacer(),
            Text(
              "سَبِّحِ اسْمَ رَبِّكَ الأعلى ",
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 36.sp,
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: _rotateSebhaAndCount,
              child: SizedBox(
                width: 500.w,
                height: 500.h,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Positioned(
                      top: 55.h,
                      child: Transform.rotate(
                        angle: _rotationAngle,
                        child: Image.asset(
                          "assets/imeges/SebhaBody.png",
                          height: 380.h,
                          width: 385.w,
                        ),
                      ),
                    ),

                    Image.asset(
                      "assets/imeges/head_sebha.png",
                      height: 75.h,
                      width: 145.w,
                    ),

                    // Text and Counter
                    Positioned.fill(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            tasbeehList[currentTasbeehIndex],
                            style: TextStyle(
                              fontSize: 36.sp,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            "$counter",
                            style: TextStyle(
                              fontSize: 36.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            ElevatedButton(
              onPressed: _resetSebha,
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorManager.primary,
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              child: Text(
                'إعادة',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
