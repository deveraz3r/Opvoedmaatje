import 'base_message_model.dart';

class ChatModel {
  final String title;
  final String chatId;
  final List<BaseMessageModel> messages;
  bool isFav;

  ChatModel({
    required this.title,
    required this.chatId,
    required this.messages,
    this.isFav = false,
  });
}
