import 'package:flutter/material.dart';
import 'package:islami/model/sura_model.dart';
import 'package:islami/style/color_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class RecentlyItem extends StatelessWidget {
  SuraModel suraModel;
  RecentlyItem(this.suraModel);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 7.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: ColorManager.primary,
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Spacer(),
              Text(
                suraModel.suraNameEn,
                style: TextStyle(
                  fontSize: 23.sp,
                  fontWeight: FontWeight.w700,
                  color: ColorManager.blackColor,
                ),
              ),
              Spacer(),
              Text(
                suraModel.suraNameAr,
                style: TextStyle(
                  fontSize: 23.sp,
                  fontWeight: FontWeight.w700,
                  color: ColorManager.blackColor,
                ),
              ),
              Spacer(),
              Text(
                "${suraModel.versesNumber} Verses  ",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                  color: ColorManager.blackColor,
                ),
              ),
              Spacer(),
            ],
          ),

          Image.asset("assets/imeges/recent.png", width: 151.w, height: 136.h),
        ],
      ),
    );
  }
}
