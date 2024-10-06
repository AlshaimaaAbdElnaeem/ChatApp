import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholar_chat/models/message.dart';
import 'package:scholar_chat/pages/cubits/chat_cubit/chat_states.dart';

import '../../../constants.dart';

class ChatCubit extends Cubit<ChatStates> {
  ChatCubit(ChatStates initialState) : super(initialState);
  List<Message> messagesList = [];
  CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessagesCollections);
  void sentMessages({required String message, required String email}) {
    messages.add({kMessage: message, kCreatedAt: DateTime.now(), 'id': email});
  }

  void getMessages() {
    messages.orderBy(kCreatedAt, descending: true).snapshots().listen((event) {
      for (var doc in event.docs) {
        messagesList.add(Message.fromJson(doc));
      }
    });
    emit(ChatSuccess(messageList: messagesList));
  }
}
