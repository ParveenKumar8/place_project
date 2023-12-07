import 'package:flutter/material.dart';
import 'package:place_project/models/user_model.dart';

class UserProvider extends InheritedWidget {
  final Widget child;
  final UserModel? userModel;
  const UserProvider({
    super.key,
    required this.child,
    this.userModel,
  }) : super(
          child: child,
        );

  static UserModel? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<UserProvider>()
        ?.userModel;
  }

  @override
  bool updateShouldNotify(covariant UserProvider oldWidget) {
    return oldWidget.userModel?.id != userModel?.id;
  }
}
