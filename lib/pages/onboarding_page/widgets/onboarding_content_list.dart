import 'package:flutter/material.dart';
import 'package:tedikap_flutter_app/pages/onboarding_page/widgets/onboarding_content.dart';
import 'package:tedikap_flutter_app/utils/images.dart';

class OnBoardingContentList {
  final List<OnBoardingContent> list_on_board = [
     OnBoardingContent(
      title: 'Talk about life over your favorite tea',
      description: 'At Tedikap, we believe that tea chats are the best chats. Lets create unforgettable moments together.',
      image: Images.onboardlogo1,
    ),
    OnBoardingContent(
      title: 'Order tea in the palm of your hand',
      description: 'Order your favorite tea right from the app and enjoy fast delivery to your door.',
      image: Images.onboardlogo2,
    ),
    OnBoardingContent(
      title: 'Save your time in ordering with us',
      description: 'We value your precious time. In a few easy steps, you can order the tea of your choice hassle-free.',
      image: Images.onboardlogo3,
    ),
  ];
}