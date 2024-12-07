import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opvoedmaatje/resources/components/reusable_app_bar.dart';
import 'package:opvoedmaatje/view_model/chat_viewmodel.dart';
import '../view_model/history_viewmodel.dart';
import '../view_model/home_viewmodel.dart';

class HistoryScreen extends StatelessWidget {
  // Instantiate the HistoryViewmodel
  final HistoryViewmodel historyViewmodel = Get.put(HistoryViewmodel());
  final HomeScreenViewModel _homeScreenViewModel = Get.find();
  final ChatViewmodel _chatViewmodel = Get.find();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusableAppBar(
        titleText: ('Chat History'),
      ),
      body: Obx(
            () {
          // Observable list of chatHistory
          if (historyViewmodel.chatHistory.isEmpty) {
            return Center(child: Text('No chats available.'));
          }
          return ListView.builder(
            itemCount: historyViewmodel.chatHistory.length,
            itemBuilder: (context, index) {
              final chat = historyViewmodel.chatHistory[index];
              return ListTile(
                title: Text(chat.title),
                onTap: () {
                  moveToChat(chat.chatId);
                },
              );
            },
          );
        },
      ),
    );
  }

  // Placeholder function for moving to a chat screen
  void moveToChat(String chatId) {
    _homeScreenViewModel.currentIndex.value=0;
    _chatViewmodel.chat = historyViewmodel.chatHistory.firstWhere((chat) => chat.chatId == chatId).obs;
  }
}
