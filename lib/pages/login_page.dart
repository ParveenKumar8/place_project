import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:place_project/common/app_colors.dart';
import 'package:place_project/common/app_images.dart';
import 'package:place_project/common/app_strings.dart';
import 'package:place_project/common/app_urls.dart';
import 'package:place_project/models/user_model.dart';
import 'package:place_project/provider/app_repo.dart';
import 'package:place_project/provider/login_provider.dart';
import 'package:place_project/routes/app_routes.dart';
import 'package:place_project/user_provider.dart';
import 'package:place_project/widgets/bottom_nav_bar.dart';
import 'package:place_project/widgets/button_widget.dart';
import 'package:place_project/widgets/text_field_widget.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

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
                onChanged: (value) => Provider.of<LoginProvider>(
                  context,
                  listen: false,
                ).username = value,
                hintText: AppStrings.emailStr,
              ),
              const SizedBox(
                height: 8.0,
              ),
              TextFieldWidget(
                onChanged: (value) => Provider.of<LoginProvider>(
                  context,
                  listen: false,
                ).password = value,
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
                onPressed: () {
                  Provider.of<LoginProvider>(
                    context,
                    listen: false,
                  ).login().then((value) {
                    print(
                        "After getting reponse from server ${value.user.name} ${value.token}");
                    Provider.of<AppRepo>(
                      context,
                      listen: false,
                    ).user = value.user;
                    Provider.of<AppRepo>(
                      context,
                      listen: false,
                    ).token = value.token;

                    Navigator.of(context)
                        .pushReplacementNamed(AppRoutes.bottomNav);
                  });
                  // if (!context.mounted) return;
                  // UserProvider.of(context)?.updateUser(user!);

                  //Navigator.of(context).popAndPushNamed(AppRoutes.bottomNav);

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
}
