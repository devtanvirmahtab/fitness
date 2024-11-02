import 'package:get/get.dart';

import '../modules/nav/explore/bindings/explore_binding.dart';
import '../modules/nav/explore/views/explore_view.dart';
import '../modules/nav/home/bindings/home_binding.dart';
import '../modules/nav/home/views/home_view.dart';
import '../modules/nav/main_nav/bindings/main_nav_binding.dart';
import '../modules/nav/main_nav/views/main_nav_view.dart';
import '../modules/onboarding/bindings/onboarding_binding.dart';
import '../modules/onboarding/views/onboarding_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/workout/bindings/workout_binding.dart';
import '../modules/workout/views/workout_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: _Paths.EXPLORE,
      page: () => const ExploreView(),
      binding: ExploreBinding(),
    ),
    GetPage(
      name: _Paths.WORKOUT,
      page: () => const WorkoutView(),
      binding: WorkoutBinding(),
    ),
    GetPage(
      name: _Paths.MAIN_NAV,
      page: () => const MainNavView(),
      binding: MainNavBinding(),
    ),
  ];
}
