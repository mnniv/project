import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:test/views/onbording/intro1.dart';
import 'package:test/views/onbording/intro2.dart';
import 'package:test/views/onbording/intro3.dart';

class Onbording extends StatefulWidget {
  const Onbording({super.key});

  @override
  State<Onbording> createState() => _OnbordingState();
}

class _OnbordingState extends State<Onbording> {
  final controller = PageController();
  bool onlastpage = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(children: [
        PageView(
          onPageChanged: (value) {
            setState(() {
              onlastpage = (value == 2);
            });
          },
          controller: controller,
          children: [
            Intro1(),
            Intro2(),
            Intro3(),
          ],
        ),
        Container(
          alignment: Alignment(0, 0.85),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              
              TextButton(
                onPressed: () => controller.jumpToPage(2),
                child: Text(
                  'SKIP',
                  style: TextStyle(
                    color: onlastpage? Theme.of(context).scaffoldBackgroundColor : Colors.black,
                     fontSize: 20,
                          fontWeight: FontWeight.bold
                  ),
                ),
              ),
              SmoothPageIndicator(
                controller: controller,
                count: 3,
                effect: WormEffect(
                  spacing: 16,
                  dotColor: Theme.of(context).primaryColor,
                  activeDotColor: Theme.of(context).scaffoldBackgroundColor,
                ),
              ),
              onlastpage
                  ? TextButton(
                      child: Text(
                        'Done',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/Signup');
                      })
                  : TextButton(
                      child: Text(
                        'Next',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                           fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      onPressed: () => controller.nextPage(
                          curve: Curves.easeIn,
                          duration: Duration(
                            milliseconds: 500,
                          )),
                    )
            ],
          ),
        ),
      ]),
    ));
  }
}
