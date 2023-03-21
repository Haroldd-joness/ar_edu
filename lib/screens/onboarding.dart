import 'package:ar_edu/screens/sign_up.dart';
import 'package:ar_edu/widgets/on_boarding_contents.dart';
import 'package:flutter/material.dart';

import 'package:ar_edu/constants /constants.dart';

import '../widgets/page_indicator.dart';
import '/widgets/button.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int currentPageIndex = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    int lastPageIndex = contents.length - 1;

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            PageView.builder(
              itemCount: contents.length,
              itemBuilder: (context, int index) {
                OnBoardContents i = contents[index];
                bool isLastPage = index == lastPageIndex;

                return Center(
                  child: SizedBox(
                    height: height,
                    width: width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Image.asset(
                          i.image,
                          width: 300,
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Text(
                          i.title,
                          style: kOnBoardHead,
                        ),
                        Container(
                          padding: const EdgeInsets.all(20),
                          child: Text(
                            i.description,
                            style: kOnBoardText,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                contents.length,
                                    (index) => buildDot(index, currentPageIndex),
                              ),
                            ),
                          ),
                        ),
                        if (!isLastPage)
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 40),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    if (index == lastPageIndex - 1) {
                                      _pageController.jumpToPage(lastPageIndex);
                                    } else {
                                      _pageController.nextPage(
                                          duration:
                                          const Duration(milliseconds: 300),
                                          curve: Curves.easeInOut);
                                    }
                                  },
                                  child: Text(
                                    index == lastPageIndex - 1 ? 'Skip' : 'Skip ',
                                    style: kButtonText.copyWith(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w100),
                                  ),
                                ),
                                InkWell(
                                  onTap: () => _pageController.nextPage(
                                      duration: const Duration(milliseconds: 300),
                                      curve: Curves.easeInOut),
                                  child: Row(
                                    children: [
                                      Text(
                                        index == lastPageIndex - 1
                                            ? 'Next'
                                            : 'Next',
                                        style: kButtonText.copyWith(
                                          color: Colors.grey,
                                        ),
                                      ),
                                      const Icon(
                                        Icons.arrow_forward,
                                        color: kSecondaryColor,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        if (isLastPage)
                          GestureDetector(
                            onTap: () => Navigator.pushReplacementNamed(context, '/login'),
                            child: Padding(
                              padding: const EdgeInsets.all(30),
                              child: GetStarted(
                                title: "Get Started",
                                width: MediaQuery.of(context).size.width,
                                height: 54,
                                color: kSecondaryColor,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                );
              },
              onPageChanged: (index) {
                setState(() {
                  currentPageIndex = index;
                });
              },
              controller: _pageController,
            ),
          ],
        ),
      ),
    );
  }
}
