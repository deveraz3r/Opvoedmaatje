import 'base_message_model.dart';

class RequestModel extends BaseMessageModel {
  final String text;
  // Add more fields here as needed, such as metadata, headers, etc.

  RequestModel({
    required this.text,
    required DateTime timestamp,
  }) : super(type: 'request', timestamp: timestamp);
}
