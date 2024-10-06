import '../../../models/message.dart';

class ChatStates {}

class ChatSuccess extends ChatStates {
  final List<Message> messageList;

  ChatSuccess({required this.messageList});
}
