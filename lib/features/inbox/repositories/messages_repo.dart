import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktong/features/inbox/models/message_model.dart';

class MessagesRepo {
  static const String chatRoomId = "HD6g1RjmoxwiPMnAAZUV";
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> sendMessage(MessageModel message) async {
    _db
        .collection("chat_rooms")
        .doc(chatRoomId)
        .collection("text")
        .add(message.toJson());
  }
}

final messagesRepo = Provider((ref) => MessagesRepo());
