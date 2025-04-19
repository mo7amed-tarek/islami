import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/model/sura_model.dart';
import 'package:islami/style/color_manager.dart';

class QuranDetailsScreen extends StatefulWidget {
  final SuraModel suraModel;

  const QuranDetailsScreen({super.key, required this.suraModel});

  @override
  State<QuranDetailsScreen> createState() => _QuranDetailsScreenState();
}

class _QuranDetailsScreenState extends State<QuranDetailsScreen> {
  @override
  void initState() {
    loadFile(widget.suraModel.suraNumber);
    // non blocking
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.blackColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        iconTheme: IconThemeData(color: ColorManager.primary),
        title: Text(
          widget.suraModel.suraNameEn,
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
                        width: 88,
                        height: 88,
                      ),
                      Text(
                        widget.suraModel.suraNameAr,
                        style: TextStyle(
                          color: ColorManager.primary,
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Image.asset(
                        "assets/imeges/sura_details_border_right.png",
                        width: 88,
                        height: 88,
                      ),
                    ],
                  ),
                  Expanded(
                    child:
                        verses.isEmpty
                            ? Center(
                              child: CircularProgressIndicator(
                                color: ColorManager.primary,
                              ),
                            )
                            : SingleChildScrollView(
                              child: Text(
                                verses,
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

  String verses = "";

  loadFile(int suraNumber) async {
    String sura = await rootBundle.loadString(
      "assets/files/Suras/$suraNumber.txt",
    ); // non blocking
    List<String> suraLines = sura.split("\n");

    for (int i = 0; i < suraLines.length; i++) {
      verses = verses + suraLines[i];
      verses += "(${i + 1})";
    }
    print(verses);
    setState(() {});
  }
}
