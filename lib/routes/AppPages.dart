import 'package:get/get.dart';
import 'package:tedikap_flutter_app/pages/cart_page/binding/cart_binding.dart';
import 'package:tedikap_flutter_app/pages/cart_page/view/cart_page.dart';
import 'package:tedikap_flutter_app/pages/detail_product_page/binding/detail_binding.dart';
import 'package:tedikap_flutter_app/pages/detail_product_page/view/detail_product_page.dart';
import 'package:tedikap_flutter_app/pages/detail_product_page/view/detail_snacks_page.dart';
import 'package:tedikap_flutter_app/pages/detail_profile_page/binding/detail_profile_binding.dart';
import 'package:tedikap_flutter_app/pages/detail_profile_page/view/detail_profile_page.dart';
import 'package:tedikap_flutter_app/pages/history_page/binding/history_binding.dart';
import 'package:tedikap_flutter_app/pages/history_page/view/history_page.dart';
import 'package:tedikap_flutter_app/pages/home_page/binding/home_binding.dart';
import 'package:tedikap_flutter_app/pages/login_page/binding/login_binding.dart';
import 'package:tedikap_flutter_app/pages/login_page/view/login_page.dart';
import 'package:tedikap_flutter_app/pages/onboarding_page/binding/onboarding_binding.dart';
import 'package:tedikap_flutter_app/pages/onboarding_page/view/onboarding_page.dart';
import 'package:tedikap_flutter_app/pages/processing_page/binding/processing_binding.dart';
import 'package:tedikap_flutter_app/pages/processing_page/view/processing_page.dart';
import 'package:tedikap_flutter_app/pages/profile_page/binding/profile_binding.dart';
import 'package:tedikap_flutter_app/pages/profile_page/view/profile_page.dart';
import 'package:tedikap_flutter_app/pages/register_page/binding/register_binding.dart';
import 'package:tedikap_flutter_app/pages/register_page/view/register_page.dart';
import 'package:tedikap_flutter_app/pages/search_page/binding/search_binding.dart';
import 'package:tedikap_flutter_app/pages/search_page/view/search_page.dart';
import 'package:tedikap_flutter_app/pages/splash_page/view/splash_page.dart';
import 'package:tedikap_flutter_app/pages/struck_page/view/struck_page.dart';
import '../pages/home_page/view/home_page.dart';
import '../pages/navigator_page/view/navbar.dart';
import '../pages/qris_page/view/qris_page.dart';
part 'AppRoutes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_PAGE;

  static final routes = [
    GetPage(
        name: _Paths.BOTTOM_NAVBAR,
        page: () => BottomNavBar(),
        
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 500)),
    GetPage(
        name: _Paths.HOME_PAGE,
        page: () => HomePage(),
        binding: HomePageBinding(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 500)),
    GetPage(
        name: _Paths.REGISTER_PAGE,
        page: () => RegisterPage(),
        binding: RegisterBinding(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 500)),
    GetPage(
        name: _Paths.LOGIN_PAGE,
        page: () => LoginPage(),
        binding: LoginBinding(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 1500)),
    GetPage(
        name: _Paths.ONBOARDING_PAGE,
        page: () => OnBoarding(),
        binding: OnBoardingBinding(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 1500)),
    GetPage(
        name: _Paths.SEARCH_PAGE,
        page: () => SearchPage(),
        binding: SearchBinding(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 500)),
    GetPage(
        name: _Paths.HISTORY_PAGE,
        page: () => HistoryPage(),
        binding: HistoryBinding(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 500)),
    GetPage(
        name: _Paths.PROFILE_PAGE,
        page: () => ProfilePage(),
        binding: ProfileBinding(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 500)),
    GetPage(
        name: _Paths.DETAIL_PROFILE_PAGE,
        page: () => DetailProfile(),
        binding: DetailProfileBinding(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 500)),
    GetPage(
        name: _Paths.DETAIL_PRODUCT_PAGE,
        page: () => DetailProduct(),
        binding: DetailProductBinding(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 500)),
        GetPage(
        name: _Paths.DETAIL_SNACK_PAGE,
        page: () => DetailSnack(),
        binding: DetailProductBinding(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 500)),
    GetPage(
        name: _Paths.CART_PAGE,
        page: () => CartPage(),
        binding: CartBinding(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 500)),
    GetPage(
        name: _Paths.PROCESSING_PAGE,
        page: () => ProcessingPage(),
        binding: ProcessingBinding(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 500)),
    GetPage(
        name: _Paths.STRUCK_PAGE,
        page: () => StruckPage(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 500)),
    GetPage(
        name: _Paths.QRIS_PAGE,
        page: () => QrisPage(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 1500)),
    GetPage(
        name: _Paths.SPLASH_PAGE,
        page: () => SplashPage(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 1500)),
    GetPage(
        name: _Paths.ONBOARDING_PAGE,
        page: () => OnBoarding(),
        binding: OnBoardingBinding(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 1500)),
  ];
}
