import 'package:flutter/material.dart';
import 'package:islami/model/hadith_model.dart';
import 'package:islami/style/color_manager.dart';
import 'package:islami/ui/home/tabs/hadith%20tab/hadith_details_screen.dart';

class HadethItem extends StatelessWidget {
  final int index;
  final int selectedIndex;
  final HadethModel hadethModel;

  const HadethItem({
    super.key,
    required this.index,
    required this.selectedIndex,
    required this.hadethModel,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HadethDetailsScreen(hadethModel: hadethModel),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(
          right: 16,
          top: index != selectedIndex ? 20 : 0,
          bottom: index != selectedIndex ? 20 : 0,
        ),
        decoration: BoxDecoration(
          color: ColorManager.primary,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(6),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          "assets/imeges/hadith_details_border_left.png",
                          height: 88,
                          width: 88,
                        ),
                        Expanded(
                          child: Text(
                            hadethModel.name,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: ColorManager.blackColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Image.asset(
                          "assets/imeges/hadith_details_border_right.png",
                          height: 88,
                          width: 88,
                        ),
                      ],
                    ),
                    Expanded(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset(
                            "assets/imeges/HadithCardBackGround 1.png",
                          ),
                          Text(
                            hadethModel.content,
                            textAlign: TextAlign.center,
                            maxLines: 12,
                            textDirection: TextDirection.rtl,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: ColorManager.blackColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Image.asset("assets/imeges/Mosque_hadith.png"),
          ],
        ),
      ),
    );
  }
}
