import 'package:flutter/material.dart';
import 'package:place_project/common/app_colors.dart';
import 'package:place_project/pages/edit_profile_page.dart';
import 'package:place_project/pages/home_page.dart';
import 'package:place_project/pages/login_page.dart';
import 'package:place_project/routes/app_routes.dart';
import 'package:place_project/user_provider.dart';
import 'package:place_project/widgets/bottom_nav_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return UserProvider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Urbanist',
          scaffoldBackgroundColor: AppColors.backgroundColor,
          brightness: Brightness.dark,
          // colorScheme: ColorScheme.fromSeed(
          //     seedColor: Colors.deepPurple, background: const Color(0xFF1A2947)),
          useMaterial3: true,
        ),
        initialRoute: AppRoutes.login,
        routes: AppRoutes.pages,

        // floatingActionButton: FloatingActionButton(onPressed: () {}),
        // floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      ),
    );
  }
}
