import 'package:ambulance/ui/widgets/main_screen.dart';
import 'package:ambulance/ui/widgets/main_screens/profile/profile.dart';
import 'package:ambulance/ui/widgets/main_screens/profile/singin_phone/singin_phone_number.dart';

abstract class MainNavigationRouteName {
  static const String mainScreen = '/';
  static const String profileScreen = '/profile';
  static const String singinPhoneRegist = '/profile/phoneregist';
  static const String singinChekCod = '/profile/phoneregist/phoneChek';
}

class MainNavigation {
  final initialRoute = MainNavigationRouteName.mainScreen;
  final routes = {
    MainNavigationRouteName.mainScreen: (context) => const MainScreen(),
    MainNavigationRouteName.profileScreen: (context) => const Profile(),
    MainNavigationRouteName.singinPhoneRegist: (context) =>
        const SinginPhoneRegist(),
    // MainNavigationRouteName.singinChekCod: (context) =>
    //     const SinginConfirmationCode(),
  };
}
