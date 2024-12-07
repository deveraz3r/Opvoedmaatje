import 'base_message_model.dart';

class ResponseModel extends BaseMessageModel {
  final String text;
  final int statusCode; // Example of additional data specific to a response
  // Add more fields here as needed, such as response time, metadata, etc.

  ResponseModel({
    required this.text,
    required this.statusCode,
    required DateTime timestamp,
  }) : super(type: 'response', timestamp: timestamp);
}
