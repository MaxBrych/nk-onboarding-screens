import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'onboarding.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Lottie.asset(
                  'assets/animations/hero-lottie-animation.json',
                  reverse: false,
                  repeat: true,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Flexible(
            child: Container(
              padding: EdgeInsets.all(32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(height: 32),
                  Text(
                    'Willkommen in unserer App!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 32, fontWeight: FontWeight.bold, height: 1.2),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod ',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                  Spacer(),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).primaryColor,
                      onPrimary: Colors.white,
                      minimumSize: Size(double.infinity, 48),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OnBoardingScreen()),
                      );
                    },
                    child: Text(
                      'Beginnen',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextButton(
                    onPressed: () {
                      // Define what happens when this button is pressed
                    },
                    style: TextButton.styleFrom(
                      primary: Color(0xFF006689),
                      minimumSize: Size(double.infinity, 48),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    child: Text(
                      'Überspringen',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF006689),
                      ),
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
