import 'package:place_project/pages/edit_profile_page.dart';
import 'package:place_project/pages/home_page.dart';
import 'package:place_project/pages/login_page.dart';
import 'package:place_project/pages/near_by_place_page.dart';
import 'package:place_project/provider/login_provider.dart';
import 'package:place_project/widgets/bottom_nav_bar.dart';
import 'package:provider/provider.dart';

class AppRoutes {
  static const login = "/";
  static const home = "/home";
  static const bottomNav = "/bottom_nav";
  static const editProfile = "/edit_profile";
  static const nearByPlace = "/near_by_place";

  static final pages = {
    login: (context) => ChangeNotifierProvider(
          create: (context) => LoginProvider(),
          child: const LoginPage(),
        ),
    home: (context) => const HomePage(),
    bottomNav: (context) => const BottomNavBar(),
    editProfile: (context) => const EditProfilePage(),
    nearByPlace: (context) => const NearByPlacePage(),
  };
}
