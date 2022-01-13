import 'package:ambulance/ui/widgets/main_screens/doctors/doctors.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'colors/my_colors.dart';
import 'main_screens/profile/profile.dart';

class MainScreen extends StatefulWidget {
  final BuildContext? menuScreenContext;
  const MainScreen({Key? key, this.menuScreenContext}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PersistentTabController? _controller;
  bool? _hideNavBar;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 4);
    _hideNavBar = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Colors.white,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        navBarHeight: MediaQuery.of(context).viewInsets.bottom > 0
            ? 0.0
            : kBottomNavigationBarHeight,
        hideNavigationBarWhenKeyboardShows: true,
        margin: const EdgeInsets.all(0.0),
        popActionScreens: PopActionScreensType.all,

        onWillPop: (context) async {
          await showDialog(
            context: context!,
            useSafeArea: true,
            builder: (context) => Container(
              height: 50.0,
              width: 50.0,
              color: Colors.white,
              child: ElevatedButton(
                child: const Text("Close"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          );
          return false;
        },
        // selectedTabScreenContext: (context) {
        //   testContext = context;
        // },
        hideNavigationBar: _hideNavBar,
        decoration: NavBarDecoration(
            colorBehindNavBar: Colors.indigo,
            borderRadius: BorderRadius.circular(0.0)),
        popAllScreensOnTapOfSelectedTab: true,
        itemAnimationProperties: const ItemAnimationProperties(
          duration: Duration(milliseconds: 400),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle:
            NavBarStyle.style16, // Choose the nav bar style with this property
      ),
    );
  }
}

List<Widget> _buildScreens() {
  return const [
    Doctors(),
    Center(child: Text('1')),
    Center(child: Text('1')),
    Center(child: Text('1')),
    Profile(),
  ];
}

List<PersistentBottomNavBarItem> _navBarsItems() {
  return [
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.person_add_alt_1_outlined),
      title: "Доктора",
      activeColorPrimary: MyColors.navyBlue,
      inactiveColorPrimary: MyColors.grey,
      inactiveColorSecondary: MyColors.navyBlue,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.article_outlined),
      title: ("Статьи"),
      activeColorPrimary: MyColors.navyBlue,
      inactiveColorPrimary: MyColors.grey,
    ),
    PersistentBottomNavBarItem(
      icon: Column(
        children: [
          Image.asset('assets/images/ambulanceCar.png'),
          const Text('Call',
              style: TextStyle(
                color: MyColors.white,
              )),
        ],
      ),
      activeColorPrimary: MyColors.navyBlue,
      activeColorSecondary: MyColors.white,
      inactiveColorPrimary: MyColors.white,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.bookmark_border),
      title: ('Мои доктора'),
      activeColorPrimary: MyColors.navyBlue,
      inactiveColorPrimary: MyColors.grey,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.person_outline),
      title: ("Профиль"),
      activeColorPrimary: MyColors.navyBlue,
      inactiveColorPrimary: MyColors.grey,
    ),
  ];
}
