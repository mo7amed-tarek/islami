import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami/style/app_constants.dart';
import 'package:islami/style/color_manager.dart';
import 'package:islami/style/methods.dart';
import 'package:islami/ui/home/tabs/quran%20tab/recently_item.dart';
import 'package:islami/ui/home/tabs/quran%20tab/sura_item.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

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
            Image.asset("assets/imeges/islami.png", width: 299, height: 141),
            SizedBox(height: 21),
            TextField(
              cursorColor: ColorManager.primary,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 16,
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
                  fontSize: 16,
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
            SizedBox(height: 20),
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                "Most Recently ",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: calculateHeight(150, screenHeight),
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => RecentlyItem(),
                separatorBuilder: (context, index) => SizedBox(width: 10),
                itemCount: 10,
              ),
            ),
            SizedBox(height: 10),
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                "Suras List",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.separated(
                itemBuilder:
                    (context, index) => SuraItem(AppConstants.surasList[index]),
                separatorBuilder:
                    (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 44),
                      child: Divider(color: Colors.white),
                    ),
                itemCount: AppConstants.surasList.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
