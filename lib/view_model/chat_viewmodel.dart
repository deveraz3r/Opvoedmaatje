import 'package:flutter/cupertino.dart';
import '../model/chat_model.dart';
import '../model/request_model.dart';
import '../model/response_model.dart';
import 'package:get/get.dart';

class ChatViewmodel extends GetxController {
  Rx<ChatModel>? chat = ChatModel(
    chatId: 'chat_004',
    title: 'Weather Updates',
    messages: [
      RequestModel(text: 'What is the weather today?', timestamp: DateTime(2024, 12, 1, 8, 30)),
      ResponseModel(text: 'It’s sunny and 25°C.', statusCode: 200, timestamp: DateTime(2024, 12, 1, 8, 31)),
      RequestModel(text: 'Will it rain tomorrow?', timestamp: DateTime(2024, 12, 1, 8, 35)),
      ResponseModel(text: 'There is a 40% chance of rain.', statusCode: 200, timestamp: DateTime(2024, 12, 1, 8, 36)),
    ],
    isFav: true,
  ).obs; // Initialize chat with an empty model

  // TextController to handle message input
  TextEditingController messageController = TextEditingController();

  void sendMessage(String text) {
    // TODO: add send/receive message logic here
  }
}
