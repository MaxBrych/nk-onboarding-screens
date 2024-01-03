import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IntroPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SvgPicture.asset(
                'assets/images/onboarding/1.svg',
                width: 300, // Adjust as needed
                // height is auto to maintain aspect ratio
              ),
            ),
          ),
          Flexible(
            child: Container(
              color: Colors.white,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 64),
                    Text(
                      'Täglich regionale Nachrichten', // Your heading text
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16), // Space between heading and body text
                    Text(
                      'TBekomme die neusten Nachrichten aus der Region um bestens Informiert', // Your body text
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
