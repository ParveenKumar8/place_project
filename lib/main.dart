import 'package:flutter/material.dart';
import 'package:place_project/common/app_colors.dart';
import 'package:place_project/provider/app_repo.dart';
import 'package:place_project/provider/post_provider.dart';
import 'package:place_project/provider/user_provider.dart';
import 'package:place_project/routes/app_routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<AppRepo>(
        create: (context) => AppRepo(),
      ),
      ChangeNotifierProvider<PostProvider>(
        create: (context) => PostProvider(),
      ),
      ChangeNotifierProvider<UserProvider>(
        create: (context) => UserProvider(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
    );
  }
}
