import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tedikap_flutter_app/pages/onboarding_page/widgets/button_onboard.dart';
import 'package:tedikap_flutter_app/pages/onboarding_page/widgets/dot_indicator.dart';
import 'package:tedikap_flutter_app/pages/onboarding_page/widgets/onboarding_content.dart';
import 'package:tedikap_flutter_app/pages/onboarding_page/widgets/onboarding_content_list.dart';
import 'package:tedikap_flutter_app/utils/dimensions.dart';
import '../controller/onboarding_controller.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  OnBoardingController onBoardController = OnBoardingController();
  PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void onPageChanged(int value) {
    setState(() {
      _currentPage = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    OnBoardingContentList contentList = OnBoardingContentList();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: onPageChanged,
                itemCount: contentList.list_on_board.length,
                itemBuilder: (context, index) => OnBoardingContent(
                  image: contentList.list_on_board[index].image,
                  title: contentList.list_on_board[index].title,
                  description: contentList.list_on_board[index].description,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  right: screenWidth * 0.0606,
                  left: screenWidth * 0.0606,
                  bottom: screenHeight * 0.0898),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ...List.generate(
                        contentList.list_on_board.length,
                        (index) => Padding(
                          padding: EdgeInsets.only(right: screenWidth * 0.0097),
                          child: DotIndicator(
                            isActive: index == _currentPage,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: Dimensions.marginSizeOnboardSuperLarge,
                  ),
                  _currentPage == contentList.list_on_board.length - 1
                      ? GestureDetector(
                          onTap: () =>
                              onBoardController.navigateToStart(),
                          child: const ButtonOnBoard(text: 'Let`s Start'))
                      : GestureDetector(
                          onTap: () {
                            onBoardController
                                .navigateToNextPage(_pageController);
                          },
                          child: const ButtonOnBoard(text: 'Continue'),
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
