abstract class BaseMessageModel {
  final String type; // "request" or "response"
  final DateTime timestamp;

  BaseMessageModel({required this.type, required this.timestamp});
}
