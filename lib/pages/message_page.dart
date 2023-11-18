import 'package:flutter/material.dart';
import 'package:place_project/widgets/app_bar_widget.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarWidget(pageTitle: "Messages"),
      body: Center(
        child: Text("Message Page"),
      ),
    );
  }
}
