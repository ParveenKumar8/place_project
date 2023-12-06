import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:place_project/common/app_colors.dart';
import 'package:place_project/common/app_images.dart';
import 'package:place_project/common/app_strings.dart';
import 'package:place_project/common/app_urls.dart';
import 'package:place_project/models/user_model.dart';
import 'package:place_project/routes/app_routes.dart';
import 'package:place_project/widgets/button_widget.dart';
import 'package:place_project/widgets/text_field_widget.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 18.0),
          child: Column(
            children: [
              const Spacer(),
              const Text(
                AppStrings.welcomeBackStr,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Text(
                AppStrings.loginToContinueStr,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              const Spacer(),
              TextFieldWidget(
                controller: emailController,
                hintText: AppStrings.emailStr,
              ),
              const SizedBox(
                height: 8.0,
              ),
              TextFieldWidget(
                controller: passwordController,
                hintText: AppStrings.passwordStr,
                isPassword: true,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    //Navigator.of(context).pushNamed('/bottom_nav');
                  },
                  child: const Text(
                    AppStrings.forgotPasswordStr,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              ButtonWidget(
                buttonName: AppStrings.logInStr,
                onPressed: () => {
                  doLogin()
                  //Navigator.of(context).popAndPushNamed(AppRoutes.bottomNav)

                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (context) => const HomePage(),
                  //   ),
                  // )
                },
              ),
              const Spacer(),
              const Text(
                AppStrings.signInWithStr,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              ButtonWidget(
                buttonName: AppStrings.logInWithGoogleStr,
                onPressed: () {},
                bgColor: AppColors.whiteColor,
                isSocialBtn: true,
                btnImg: AppImages.icGoogle,
                buttonWidth: 0.8,
              ),
              const SizedBox(
                height: 20.0,
              ),
              ButtonWidget(
                buttonName: AppStrings.logInWithFacebookStr,
                onPressed: () {},
                bgColor: AppColors.whiteColor,
                isSocialBtn: true,
                btnImg: AppImages.icFacebook,
                buttonWidth: 0.8,
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    AppStrings.dontHaveAccountStr,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      AppStrings.signUpStr,
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.primaryColor,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  )
                ],
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Future<UserModel> doLogin() async {
    final userName = emailController.text;
    final password = passwordController.text;
    final body = {
      "username": userName,
      "password": password,
    };
    debugPrint("URL is ${AppURL.signIn}");
    debugPrint('UserName && Password is $userName $password');
    final response = await http.post(
      Uri.parse(AppURL.signIn),
      body: jsonEncode(body),
    );
    debugPrint(response.body);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return json;
    } else {
      debugPrint("̀Error in webservice");
      throw Exception('Error');
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
