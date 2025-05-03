import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/model/sura_model.dart';
import 'package:islami/style/color_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuranDetailsScreen extends StatefulWidget {
  final SuraModel suraModel;

  const QuranDetailsScreen({super.key, required this.suraModel});

  @override
  State<QuranDetailsScreen> createState() => _QuranDetailsScreenState();
}

class _QuranDetailsScreenState extends State<QuranDetailsScreen> {
  String verses = "";
  double fontSize = 20.sp;
  @override
  void initState() {
    super.initState();
    loadFile(widget.suraModel.suraNumber);
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
            fontSize: 20.sp,
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
                        width: 88.w,
                        height: 88.h,
                      ),
                      Text(
                        widget.suraModel.suraNameAr,
                        style: TextStyle(
                          color: ColorManager.primary,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Image.asset(
                        "assets/imeges/sura_details_border_right.png",
                        width: 88.w,
                        height: 88.h,
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  Expanded(
                    child:
                        verses.isEmpty
                            ? Center(
                              child: CircularProgressIndicator(
                                color: ColorManager.primary,
                              ),
                            )
                            : SingleChildScrollView(
                              child: InteractiveViewer(
                                panEnabled: false,
                                scaleEnabled: false,
                                boundaryMargin: const EdgeInsets.all(20),
                                minScale: 1,
                                maxScale: 4,
                                child: Text(
                                  verses,
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
                  ),
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 35.h,
                  width: 35.w,
                  child: FloatingActionButton(
                    heroTag: "zoom_in",
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
                  height: 35.h,
                  width: 35.w,
                  child: FloatingActionButton(
                    heroTag: "zoom_out",
                    backgroundColor: ColorManager.primary,
                    mini: true,
                    onPressed: () {
                      setState(() {
                        if (fontSize > 20) fontSize -= 2;
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
          Image.asset("assets/imeges/Mosque-02.png"),
        ],
      ),
    );
  }

  Future<void> loadFile(int suraNumber) async {
    String sura = await rootBundle.loadString(
      "assets/files/Suras/$suraNumber.txt",
    );

    List<String> suraLines = sura.split("\n");

    verses = "";
    for (int i = 0; i < suraLines.length; i++) {
      verses += suraLines[i];
      verses += "(${i + 1}) ";
    }

    setState(() {});
  }
}
