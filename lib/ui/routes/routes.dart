import 'package:ambulance/ui/widgets/main_screen.dart';
import 'package:ambulance/ui/widgets/main_screens/doctors/doctors.dart';
import 'package:ambulance/ui/widgets/main_screens/profile/profile.dart';
import 'package:ambulance/ui/widgets/main_screens/profile/singin_phone/singin_phone_number.dart';

abstract class MainNavigationRouteName {
  static const String mainScreen = '/';
  static const String profileScreen = '/profile';
  static const String singinPhoneRegist = '/profile/phoneregist';
  static const String singinChekCod = '/profile/phoneregist/phoneChek';
  static const String doctors = '/doctors';
}

class MainNavigation {
  final initialRoute = MainNavigationRouteName.mainScreen;
  final routes = {
    MainNavigationRouteName.mainScreen: (context) => const MainScreen(),
    MainNavigationRouteName.doctors: (context) => const Doctors(),
    MainNavigationRouteName.profileScreen: (context) => const Profile(),
    MainNavigationRouteName.singinPhoneRegist: (context) =>
        const SinginPhoneRegist(),
    // MainNavigationRouteName.singinChekCod: (context) =>
    //     const SinginConfirmationCode(),
  };
}
