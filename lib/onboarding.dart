import 'package:flutter/material.dart';
import 'package:onboarding/end_flow.dart';
import 'package:onboarding/intro_screens/intro_page_1.dart';
import 'package:onboarding/intro_screens/intro_page_2.dart';
import 'package:onboarding/intro_screens/intro_page_3.dart';
import 'package:onboarding/intro_screens/intro_page_4.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnBoardingScreen> {
  // Controller to keep track of which page
  PageController _controller = PageController();

  // Keep track of if we are on the last page or not
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Page view
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 3);
              });
            },
            children: [
              IntroPage1(),
              IntroPage2(),
              IntroPage3(),
              IntroPage4(),
            ],
          ),

          // Bottom controls with padding
          Positioned(
            bottom: 32,
            left: 16,
            right: 16,
            child: Padding(
              padding: EdgeInsets.all(16.0), // Added padding
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Skip button
                  GestureDetector(
                    onTap: () {
                      _controller.jumpToPage(3); // Jump to the last page
                    },
                    child: Text('Skip'),
                  ),

                  // Dot indicator with customizations
                  SmoothPageIndicator(
                    controller: _controller,
                    count: 4,
                    effect: WormEffect(
                      dotHeight: 10, // Smaller dot size
                      dotWidth: 10,
                      activeDotColor: Color(0xFF006689), // Primary dot color
                    ),
                  ),

                  // Next or Anmelden button
                  onLastPage
                      ? ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EndFlowScreen()),
                            );
                          },
                          child: Text('Anmelden'),
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFF006689), // Button color
                            onPrimary: Colors.white, // Text color
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            _controller.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeIn,
                            );
                          },
                          child: Text('Weiter'),
                        ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
