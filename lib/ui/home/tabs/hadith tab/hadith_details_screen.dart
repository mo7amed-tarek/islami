import 'package:flutter/material.dart';
import 'package:islami/model/hadith_model.dart';
import 'package:islami/style/color_manager.dart';

class HadethDetailsScreen extends StatelessWidget {
  final HadethModel hadethModel;

  const HadethDetailsScreen({super.key, required this.hadethModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.blackColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        iconTheme: IconThemeData(color: ColorManager.primary),
        title: Text(
          "Hadith ${hadethModel.number}",
          style: TextStyle(
            color: ColorManager.primary,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 9, horizontal: 18),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        "assets/imeges/sura_details_border_left.png",
                        height: 88,
                        width: 88,
                      ),
                      Expanded(
                        child: Text(
                          hadethModel.name,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: ColorManager.primary,
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Image.asset(
                        "assets/imeges/sura_details_border_right.png",
                        height: 88,
                        width: 88,
                      ),
                    ],
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Text(
                        hadethModel.content,
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          color: ColorManager.primary,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
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
