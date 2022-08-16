import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:sapyangyuen/intro_screens/intro_page1.dart';
import 'package:sapyangyuen/intro_screens/intro_page2.dart';
import 'package:sapyangyuen/pages/home_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroductionScreens extends StatefulWidget {
  const IntroductionScreens({Key? key}) : super(key: key);

  @override
  State<IntroductionScreens> createState() => _IntroductionScreensState();
}

class _IntroductionScreensState extends State<IntroductionScreens> {
  PageController _controller = PageController();
  bool onLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 1);
              });
            },
            children: [
              intropage1(),
              intropage2(),
            ],
          ),
          Container(
            alignment: Alignment(0, 0.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    _controller.jumpToPage(1);
                  },
                  child: Text(
                    'ข้าม',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                SmoothPageIndicator(
                  controller: _controller,
                  count: 2,
                  effect: SlideEffect(
                    dotColor: Color.fromARGB(255, 203, 203, 203),
                    activeDotColor: Color.fromARGB(255, 218, 165, 32),
                  ),
                ),
                onLastPage
                    ? GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return homepage();
                          }));
                        },
                        child: Text(
                          'เริ่ม',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ))
                    : GestureDetector(
                        onTap: () {
                          _controller.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeIn,
                          );
                        },
                        child: Text(
                          'ถัดไป',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
