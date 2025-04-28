import 'package:flutter/material.dart';
import 'package:islami/model/hadith_model.dart';
import 'package:islami/style/color_manager.dart';

class HadethDetailsScreen extends StatefulWidget {
  final HadethModel hadethModel;

  const HadethDetailsScreen({super.key, required this.hadethModel});

  @override
  State<HadethDetailsScreen> createState() => _HadethDetailsScreenState();
}

class _HadethDetailsScreenState extends State<HadethDetailsScreen> {
  double fontSize = 20; // متغير حجم الخط الابتدائي

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
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 18),
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
                          widget.hadethModel.name,
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
                        widget.hadethModel.content,
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          color: ColorManager.primary,
                          fontSize: fontSize, // ← هنا بنستخدم الحجم المتغير
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 30,
                          height: 30,
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
                            child: const Icon(
                              Icons.add,
                              size: 20,
                              color: ColorManager.blackColor,
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        SizedBox(
                          width: 30,
                          height: 30,
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
                            child: const Icon(
                              Icons.remove,
                              size: 20,
                              color: ColorManager.blackColor,
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
