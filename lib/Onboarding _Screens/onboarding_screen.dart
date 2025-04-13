import 'package:flutter/material.dart';
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
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      SizedBox(height: 25),
                      Image.asset(
                        contents[index].image1,
                        height: 151,
                        width: 291,
                      ),
                      const SizedBox(height: 50),
                      Image.asset(
                        contents[index].image2,
                        height: 338,
                        width: 366,
                      ),
                      const SizedBox(height: 50),
                      Text(
                        contents[index].description,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: Color(0xffE2BE7F),
                        ),
                      ),
                      const SizedBox(height: 40),
                      Text(
                        contents[index].additionalDescription,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Color(0xffE2BE7F),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              contents.length,
              (index) => AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 5),
                height: 7,
                width: currentIndex == index ? 20 : 7,
                decoration: BoxDecoration(
                  color:
                      currentIndex == index ? Color(0xffE2BE7F) : Colors.grey,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Visibility(
                visible: currentIndex != 0,
                child: ElevatedButton(
                  onPressed: previousPage,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff202020),
                    foregroundColor: Color(0xffE2BE7F),
                  ),
                  child: const Text('Back'),
                ),
              ),

              ElevatedButton(
                onPressed: () {
                  if (currentIndex == contents.length - 1) {
                    print("Go to login or home page");
                  } else {
                    nextPage();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff202020),
                  foregroundColor: Color(0xffE2BE7F),
                ),
                child: Text(
                  currentIndex == contents.length - 1 ? 'Start' : 'Next',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
