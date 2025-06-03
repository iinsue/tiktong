import 'dart:async';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktong/features/authentication/repositories/authentication_repo.dart';
import 'package:tiktong/features/videos/repositories/videos_repo.dart';

class UploadVideoViewModel extends AsyncNotifier<void> {
  late final VideosRepository _repository;

  @override
  FutureOr<void> build() {
    _repository = ref.read(videosRepo);
  }

  Future<void> uplaodVideo(File video) async {
    final user = ref.read(authRepo).user;

    state = AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final task = await _repository.uploadVideoFile(video, user!.uid);

      if (task.metadata != null) {
        await _repository.saveVideo();
      }
    });
  }
}
