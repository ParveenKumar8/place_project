import 'package:flutter/material.dart';
import 'package:place_project/widgets/app_bar_widget.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarWidget(pageTitle: "Favorite"),
      body: Center(
        child: Text("Favorite Page"),
      ),
    );
  }
}
