import 'package:flutter/material.dart';
import 'package:islami/model/hadith_model.dart';
import 'package:islami/style/color_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HadethDetailsScreen extends StatefulWidget {
  final HadethModel hadethModel;

  const HadethDetailsScreen({super.key, required this.hadethModel});

  @override
  State<HadethDetailsScreen> createState() => _HadethDetailsScreenState();
}

class _HadethDetailsScreenState extends State<HadethDetailsScreen> {
  double fontSize = 20.sp;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.blackColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        iconTheme: IconThemeData(color: ColorManager.primary),
        title: Text(
          "Hadith ${widget.hadethModel.number}",
          style: TextStyle(
            color: ColorManager.primary,
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 9.h, horizontal: 18.w),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        "assets/imeges/sura_details_border_left.png",
                        height: 88.h,
                        width: 88.w,
                      ),
                      Expanded(
                        child: Text(
                          widget.hadethModel.name,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: ColorManager.primary,
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Image.asset(
                        "assets/imeges/sura_details_border_right.png",
                        height: 88.h,
                        width: 88.w,
                      ),
                    ],
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Text(
                        widget.hadethModel.content,
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          color: ColorManager.primary,
                          fontSize: fontSize,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 35.w,
                          height: 35.h,
                          child: FloatingActionButton(
                            heroTag: "zoom_in_hadith",
                            backgroundColor: ColorManager.primary,
                            mini: true,
                            onPressed: () {
                              setState(() {
                                if (fontSize < 40) {
                                  fontSize += 2;
                                }
                              });
                            },
                            child: Image.asset(
                              "assets/imeges/zoom_in.png",
                              height: 20.h,
                              width: 20.w,
                            ),
                          ),
                        ),
                        SizedBox(width: 20.w),
                        SizedBox(
                          width: 35.w,
                          height: 35.h,
                          child: FloatingActionButton(
                            heroTag: "zoom_out_hadith",
                            backgroundColor: ColorManager.primary,
                            mini: true,
                            onPressed: () {
                              setState(() {
                                if (fontSize > 20) {
                                  fontSize -= 2;
                                }
                              });
                            },
                            child: Image.asset(
                              "assets/imeges/zoom_out.png",
                              height: 20.h,
                              width: 20.w,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Image.asset("assets/imeges/Mosque-02.png"),
        ],
      ),
    );
  }
}
