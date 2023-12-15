import 'package:flutter/material.dart';
import 'package:place_project/provider/app_repo.dart';
import 'package:place_project/widgets/app_bar_widget.dart';
import 'package:place_project/widgets/chat_receiver_widget.dart';
import 'package:place_project/widgets/chat_sender_widget.dart';
import 'package:provider/provider.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appRepoProvider = context.watch<AppRepo>();
    return Scaffold(
      appBar: const AppBarWidget(pageTitle: "Chat"),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final chat = appRepoProvider.chatList[index];
          print('Chat user id ${chat.user.id}');
          print('Current user id ${appRepoProvider.user.id}');
          if (chat.user.id == appRepoProvider.user.id) {
            return ChatSenderWidget(chat: chat);
          }
          return ChatReceiverWidget(chat: chat);
        },
        itemCount: appRepoProvider.chatList.length,
      ),
    );
  }
}
