import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami/model/sura_model.dart';
import 'package:islami/style/app_constants.dart';
import 'package:islami/style/color_manager.dart';
import 'package:islami/style/methods.dart';
import 'package:islami/style/prefs_manager.dart';
import 'package:islami/ui/home/tabs/quran%20tab/quran_detels_screen.dart';
import 'package:islami/ui/home/tabs/quran%20tab/recently_item.dart';
import 'package:islami/ui/home/tabs/quran%20tab/sura_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuranTab extends StatefulWidget {
  const QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  String searchText = "";
  List<SuraModel> searchSurasList = [];
  List<SuraModel> mostRecently = [];
  @override
  void initState() {
    super.initState();
    mostRecently = PrefsManager.getMostRecently();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    print(screenHeight);
    print(screenWidth);
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/imeges/quranBack.jpg"),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 30.h),
            Image.asset(
              "assets/imeges/islami.png",
              width: 299.w,
              height: 141.h,
            ),
            SizedBox(height: 21.h),
            TextField(
              cursorColor: ColorManager.primary,
              onChanged: (value) {
                setState(() {
                  searchText = value;
                  searchSura();
                });
              },
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 16.sp,
              ),
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SvgPicture.asset(
                    "assets/imeges/quran.svg",
                    colorFilter: ColorFilter.mode(
                      ColorManager.primary,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                hintText: "Sura name",
                hintStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 16.sp,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: ColorManager.primary),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: ColorManager.primary),
                ),
              ),
            ),
            Visibility(
              visible: searchText.isEmpty,
              child: Column(
                children: [
                  SizedBox(height: 20.h),
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                      "Most Recently ",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Container(
                    height: calculateHeight(150, screenHeight),
                    child:
                        mostRecently.isEmpty
                            ? Center(
                              child: Text(
                                "No Recently items",
                                style: TextStyle(
                                  color: ColorManager.primary,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            )
                            : ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder:
                                  (context, index) => GestureDetector(
                                    onTap: () {
                                      SuraModel clickedSura =
                                          mostRecently[index];
                                      if (!mostRecently.contains(clickedSura)) {
                                        mostRecently.insert(0, clickedSura);
                                      } else {
                                        mostRecently.remove(clickedSura);
                                        mostRecently.insert(0, clickedSura);
                                      }
                                      PrefsManager.saveMostRecently(
                                        mostRecently,
                                      );

                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder:
                                              (context) => QuranDetailsScreen(
                                                suraModel: clickedSura,
                                              ),
                                        ),
                                      );
                                    },
                                    child: RecentlyItem(mostRecently[index]),
                                  ),
                              separatorBuilder:
                                  (context, index) => SizedBox(width: 10.w),
                              itemCount: mostRecently.length,
                            ),
                  ),
                  SizedBox(height: 10.h),
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                      "Suras List",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            Expanded(
              child: ListView.separated(
                itemBuilder:
                    (context, index) => SuraItem(
                      suraModel:
                          searchText.isNotEmpty
                              ? searchSurasList[index]
                              : AppConstants.surasList[index],
                      onPress: () {
                        SuraModel newSura =
                            searchText.isNotEmpty
                                ? searchSurasList[index]
                                : AppConstants.surasList[index];
                        if (!mostRecently.contains(newSura)) {
                          mostRecently.insert(0, newSura);
                        } else {
                          mostRecently.remove(newSura);
                          mostRecently.insert(0, newSura);
                        }
                        PrefsManager.saveMostRecently(mostRecently);
                        setState(() {});
                      },
                    ),
                separatorBuilder:
                    (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 44),
                      child: Divider(color: Colors.white),
                    ),
                itemCount:
                    searchText.isNotEmpty
                        ? searchSurasList.length
                        : AppConstants.surasList.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  searchSura() {
    if (searchText.isNotEmpty) {
      searchSurasList = [];
      for (int i = 0; i < AppConstants.surasList.length; i++) {
        if (AppConstants.surasList[i].suraNameAr.contains(searchText) ||
            AppConstants.surasList[i].suraNameEn.contains(searchText)) {
          searchSurasList.add(AppConstants.surasList[i]);
        }
      }
    }
  }
}
