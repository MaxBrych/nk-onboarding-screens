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
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Skip or Back button
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        if (onLastPage) {
                          _controller
                              .jumpToPage(0); // Jump back to the first page
                        } else {
                          _controller.jumpToPage(3); // Jump to the last page
                        }
                      },
                      child: Text(onLastPage ? 'Zurück' : 'Überspringen',
                          style: TextStyle(color: Color(0xFF006689))),
                    ),
                  ),

                  SizedBox(
                    width: 32,
                  ),

                  // Dot indicator with fixed position
                  SmoothPageIndicator(
                    controller: _controller,
                    count: 4,
                    effect: WormEffect(
                      dotHeight: 8,
                      dotWidth: 8,
                      activeDotColor: Color(0xFF006689),
                    ),
                  ),
                  SizedBox(
                    width: 32,
                  ),
                  // Next or Anmelden button
                  Expanded(
                    child: onLastPage
                        ? ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EndFlowScreen()),
                              );
                            },
                            child: Text('Abschließen'),
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xFF006689),
                              onPrimary: Colors.white,
                            ),
                          )
                        : TextButton(
                            onPressed: () {
                              _controller.nextPage(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.easeIn,
                              );
                            },
                            child: Text('Weiter',
                                style: TextStyle(color: Color(0xFF006689))),
                          ),
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
