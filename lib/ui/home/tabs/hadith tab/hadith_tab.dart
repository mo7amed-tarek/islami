import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/model/hadith_model.dart';
import 'package:islami/style/color_manager.dart';
import 'package:islami/ui/home/tabs/hadith%20tab/hadith_item.dart';

class HadethTab extends StatefulWidget {
  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  late PageController controller;
  int selected = 0;
  List<HadethModel> allAhadeth = [];

  @override
  void initState() {
    super.initState();
    controller = PageController(viewportFraction: 0.8);
    loadFiles();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      color: ColorManager.blackColor,
      child: Stack(
        children: [
          Image.asset("assets/imeges/hadith_back.jpg"),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              children: [
                Image.asset(
                  "assets/imeges/islami.png",
                  width: 299,
                  height: 141,
                ),
                const SizedBox(height: 30),
                Expanded(
                  child:
                      allAhadeth.isEmpty
                          ? Center(
                            child: CircularProgressIndicator(
                              color: ColorManager.primary,
                            ),
                          )
                          : PageView.builder(
                            controller: controller,
                            onPageChanged: (index) {
                              setState(() {
                                selected = index;
                              });
                            },
                            itemBuilder:
                                (context, index) => HadethItem(
                                  selectedIndex: selected,
                                  index: index,
                                  hadethModel: allAhadeth[index],
                                ),
                            itemCount: allAhadeth.length,
                          ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> loadFiles() async {
    for (int i = 1; i <= 50; i++) {
      try {
        String hadeth = await rootBundle.loadString(
          "assets/files/Hadeeth/h$i.txt",
        );
        List<String> lines = hadeth.split("\n");
        String hadethName = lines[0];
        lines.removeAt(0);
        String hadethContent = lines.join(" ");
        allAhadeth.add(
          HadethModel(name: hadethName, content: hadethContent, number: i),
        );
      } catch (e) {
        print("Error loading hadith $i: $e");
      }
    }
    setState(() {});
  }
}
