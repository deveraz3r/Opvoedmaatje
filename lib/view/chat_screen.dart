import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opvoedmaatje/resources/app_colors.dart';
import 'package:opvoedmaatje/resources/components/reusable_app_bar.dart';
import '../model/request_model.dart';
import '../model/response_model.dart';
import '../view_model/chat_viewmodel.dart';

class ChatScreen extends StatelessWidget {
  final ChatViewmodel _chatViewModel = Get.put(ChatViewmodel()); // Using GetX to access the ViewModel

  ChatScreen({super.key});

  final FirebaseAuth _auth = FirebaseAuth.instance;
  // User? user = _auth.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusableAppBar(
        titleText: (_chatViewModel.chat?.value.title ?? "New Chat"), // Use non-nullable value
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              _auth.signOut();
              Navigator.pushReplacementNamed(context, '/sign-in');
            },
          )
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          // Chat messages area
          Expanded(
            child: Obx(() {
              // Using Obx to automatically rebuild the widget when the chat state changes
              return ListView.builder(
                itemCount: _chatViewModel.chat?.value.messages.length, // Using .value to access the Rx value
                itemBuilder: (context, index) {
                  final message = _chatViewModel.chat?.value.messages[index];
                  return _buildChatMessage(message);
                },
              );
            }),
          ),

          // Message input field and send button
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _chatViewModel.messageController, // TextController from ViewModel
                    decoration: InputDecoration(
                      hintText: 'Type a message',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    // Send message when pressed
                    _chatViewModel.sendMessage(_chatViewModel.messageController.text);
                  },
                  icon: const Icon(Icons.send),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Function to build each chat message
  Widget _buildChatMessage(dynamic message) {
    if (message is RequestModel) {
      return Align(
        alignment: Alignment.centerRight,
        child: Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.only(bottom: 8, right: 16, left: 50),
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            message.text,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      );
    } else if (message is ResponseModel) {
      return Align(
        alignment: Alignment.centerLeft,
        child: Container(
          padding: EdgeInsets.all(12),
          margin: EdgeInsets.only(bottom: 8, left: 16, right: 50),
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            message.text,
            style: TextStyle(color: Colors.black),
          ),
        ),
      );
    }
    return SizedBox.shrink();
  }
}