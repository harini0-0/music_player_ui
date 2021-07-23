import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'figmaComponents/bBallClippers.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class LoadingScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff22272B),
        body: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: 90),
              alignment: Alignment.topCenter,
              child: DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 50,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                  shadows: [
                    Shadow(
                      blurRadius: 5.0,
                      color: Colors.deepOrangeAccent,
                      offset: Offset(2, 3),
                    ),
                  ],
                ),
                child: AnimatedTextKit(
                  repeatForever: true,
                  animatedTexts: [
                    FlickerAnimatedText("Dribble Music !"),
                  ],
                  onTap: () {
                    print("Tap Event");
                  },
                ),
              ),
            ),
            Positioned(
              top: 300,
              left: 30,
              child: ClipPath(
                clipper: TopLeftDribble(),
                child: Container(
                  width: width * 0.6 *1.5,
                  height: height * 0.54 *1.5,
                  color: Colors.red,
                ),
              ),
            ),
            Positioned(
              top: 280,
              left: 123,
              child: ClipPath(
                clipper: TopRightDribble(),
                child: Container(
                  width: width * 0.6 *1.5,
                  height: height * 0.54 *1.5,
                  color: Colors.red,
                ),
              ),
            ),
            Positioned(
              top: 398,
              left: 25,
              child: ClipPath(
                clipper: MiddleLeftDribble(),
                child: Container(
                  width: width * 0.58 *1.5,
                  height: height * 0.54 *1.5,
                  color: Colors.red,
                ),
              ),
            ),
            Positioned(
              top: 334,
              left: 195,
              child: ClipPath(
                clipper: MiddleRightDribble(),
                child: Container(
                  width: width * 0.6 *1.5,
                  height: height * 0.54 *1.5,
                  color: Colors.red,
                ),
              ),
            ),
            Positioned(
              top: 437,
              left: 90,
              child: ClipPath(
                clipper: BottomLeftDribble(),
                child: Container(
                  width: width * 0.6 *1.5,
                  height: height * 0.54 *1.5,
                  color: Colors.red,
                ),
              ),
            ),
            Positioned(
              top: 425,
              left: 210,
              child: ClipPath(
                clipper: BottomRightDribble(),
                child: Container(
                  width: width * 0.6 *1.5,
                  height: height * 0.54 *1.5,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
