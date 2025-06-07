import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktong/features/authentication/repositories/authentication_repo.dart';
import 'package:tiktong/features/inbox/models/message_model.dart';
import 'package:tiktong/features/inbox/repositories/messages_repo.dart';

class MessagesViewModel extends AsyncNotifier<void> {
  late final MessagesRepo _repo;

  @override
  FutureOr<void> build() {
    _repo = ref.read(messagesRepo);
  }

  Future<void> sendMessage(String text) async {
    final user = ref.read(authRepo).user;
    state = AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final message = MessageModel(text: text, userId: user!.uid);
      _repo.sendMessage(message);
    });
  }
}

final messagesProvider = AsyncNotifierProvider<MessagesViewModel, void>(
  () => MessagesViewModel(),
);
