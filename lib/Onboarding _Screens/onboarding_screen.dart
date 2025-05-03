import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/ui/home/home_screen.dart';
import 'onboarding_data.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int currentIndex = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void nextPage() {
    if (currentIndex < contents.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void previousPage() {
    if (currentIndex > 0) {
      _controller.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff202020),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: contents.length,
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(10.h),
                  child: Expanded(
                    child: Column(
                      children: [
                        Spacer(),
                        Image.asset(
                          contents[index].image1,
                          height: 151.h,
                          width: 291.w,
                        ),
                        Spacer(),
                        Image.asset(
                          contents[index].image2,
                          height: 338.h,
                          width: 366.w,
                        ),
                        Spacer(),
                        Text(
                          contents[index].description,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w700,
                            color: Color(0xffE2BE7F),
                          ),
                        ),
                        Spacer(),
                        Text(
                          contents[index].additionalDescription,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                            color: Color(0xffE2BE7F),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Visibility(
                visible: currentIndex != 0,
                child: TextButton(
                  onPressed: previousPage,
                  child: Text(
                    'Back',
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: Color(0xffE2BE7F),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              DotsIndicator(
                dotsCount: contents.length,
                position: currentIndex.toDouble(),
                decorator: DotsDecorator(
                  activeColor: const Color(0xffE2BE7F),
                  color: Colors.grey,
                  activeSize: Size(20.w, 7.h),
                  size: Size(7.w, 7.h),
                  activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),

              TextButton(
                onPressed: () {
                  if (currentIndex == contents.length - 1) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  } else {
                    nextPage();
                  }
                },
                child: Text(
                  currentIndex == contents.length - 1 ? 'Start' : 'Next',
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: Color(0xffE2BE7F),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
