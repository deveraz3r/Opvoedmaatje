import 'package:get/get.dart';
import '../model/chat_model.dart';
import '../model/request_model.dart';
import '../model/response_model.dart';

class HistoryViewmodel extends GetxController {

  // Making chatHistory an observable list using RxList
  RxList<ChatModel> chatHistory = <ChatModel>[
    ChatModel(
      chatId: 'chat_004',
      title: 'Weather Updates',
      messages: [
        RequestModel(text: 'What is the weather today?', timestamp: DateTime(2024, 12, 1, 8, 30)),
        ResponseModel(text: 'It’s sunny and 25°C.', statusCode: 200, timestamp: DateTime(2024, 12, 1, 8, 31)),
        RequestModel(text: 'Will it rain tomorrow?', timestamp: DateTime(2024, 12, 1, 8, 35)),
        ResponseModel(text: 'There is a 40% chance of rain.', statusCode: 200, timestamp: DateTime(2024, 12, 1, 8, 36)),
      ],
      isFav: true,
    ),
    ChatModel(
      chatId: 'chat_005',
      title: 'Travel Plans',
      messages: [
        RequestModel(text: 'What is the best time to visit Japan?', timestamp: DateTime(2024, 12, 2, 10, 0)),
        ResponseModel(
          text: 'Spring (March to May) and Autumn (September to November) are the best times to visit.',
          statusCode: 200,
          timestamp: DateTime(2024, 12, 2, 10, 2),
        ),
        RequestModel(text: 'How long is the flight from New York?', timestamp: DateTime(2024, 12, 2, 10, 5)),
        ResponseModel(text: 'Approximately 14 hours.', statusCode: 200, timestamp: DateTime(2024, 12, 2, 10, 6)),
      ],
      isFav: false,
    ),
    // More chat models...
  ].obs;

  // Method to add a new chat to the history
  void addChat(ChatModel chat) {
    chatHistory.add(chat);
  }

  // Method to toggle the favorite status of a chat
  void toggleFavorite(String chatId) {
    final chat = chatHistory.firstWhere((chat) => chat.chatId == chatId);
    chat.isFav = !chat.isFav;
  }

  // Method to remove a chat from the history
  void removeChat(String chatId) {
    chatHistory.removeWhere((chat) => chat.chatId == chatId);
  }
}
