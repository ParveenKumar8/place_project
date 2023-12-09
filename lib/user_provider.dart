// import 'package:flutter/material.dart';
// import 'package:place_project/models/user_model.dart';

// class UserProvider extends InheritedWidget {
//   final Widget child;
//   final UserService userService;
//   const UserProvider({
//     super.key,
//     required this.child,
//     required this.userService,
//   }) : super(
//           child: child,
//         );

//   static UserService? of(BuildContext context) {
//     return context
//         .dependOnInheritedWidgetOfExactType<UserProvider>()
//         ?.userService;
//   }

//   @override
//   bool updateShouldNotify(covariant UserProvider oldWidget) {
//     return oldWidget.userService.user?.id != userService.user?.id;
//   }
// }

// class UserService {
//   UserModel? _userModel;

//   UserModel? get user => _userModel;

//   updateUser(UserModel userModel) {
//     _userModel = userModel;
//   }
// }
