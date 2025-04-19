import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami/style/color_manager.dart';
import 'package:islami/ui/home/tabs/hadith%20tab/hadith_tab.dart';
import 'package:islami/ui/home/tabs/quran%20tab/quran_tab.dart';
import 'package:islami/ui/home/tabs/radio_tab.dart';
import 'package:islami/ui/home/tabs/sebha_tab.dart';
import 'package:islami/ui/home/tabs/time_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selected = 0;
  List<Widget> tabs = [
    QuranTab(),
    HadethTab(),
    SebhaTab(),
    RadioTab(),
    TimeTab(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        selectedIndex: selected,
        onDestinationSelected: (index) {
          setState(() {
            selected = index;
          });
        },
        backgroundColor: ColorManager.primary,
        indicatorColor: ColorManager.blackColor.withOpacity(0.6),
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        destinations: [
          NavigationDestination(
            icon: SvgPicture.asset('assets/imeges/quran.svg'),
            selectedIcon: SvgPicture.asset('assets/imeges/quran_selected.svg'),
            label: 'Quran',
          ),
          NavigationDestination(
            icon: SvgPicture.asset('assets/imeges/hadith.svg'),
            selectedIcon: SvgPicture.asset('assets/imeges/Hadith_selected.svg'),
            label: 'Hadith',
          ),
          NavigationDestination(
            icon: SvgPicture.asset('assets/imeges/necklace.svg'),
            selectedIcon: SvgPicture.asset(
              'assets/imeges/necklace_selected.svg',
            ),
            label: 'Sebha',
          ),
          NavigationDestination(
            icon: SvgPicture.asset('assets/imeges/radio.svg'),
            selectedIcon: SvgPicture.asset('assets/imeges/radio_selected.svg'),
            label: 'Radio',
          ),
          NavigationDestination(
            icon: SvgPicture.asset('assets/imeges/time.svg'),
            selectedIcon: SvgPicture.asset('assets/imeges/time_selected.svg'),
            label: 'Time',
          ),
        ],
      ),
      body: tabs[selected],
    );
  }
}
