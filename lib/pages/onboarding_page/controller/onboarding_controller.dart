import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tedikap_flutter_app/utils/images.dart';

class OnBoardingController extends GetxController {
  final PageController pageController = PageController();
  final RxInt currentPage = 0.obs;

  final List<OnboardingItem> onboardingItems = [
    OnboardingItem(
      title: 'Talk about life over your favorite tea',
      subtitle: 'At Tedikap, we believe that tea chats are the best chats. Lets create unforgettable moments together.',
      image: Images.onboardlogo1,
    ),
    OnboardingItem(
      title: 'Tea in the palm of your hand',
      subtitle: 'Order your favorite tea right from the app and enjoy fast delivery to your door.',
      image: Images.onboardlogo2,
    ),
    OnboardingItem(
      title: 'Save your time in ordering with us.',
      subtitle: 'We value your precious time. In a few easy steps, you can order the tea of your choice hassle-free.',
      image: Images.onboardlogo3,
    ),

  ];

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}

class OnboardingItem {
  final String title;
  final String subtitle;
  final String image;

  OnboardingItem({required this.title, required this.subtitle, required this.image});
}
