// 파일이름의 vm은 view model의 이니셜입니다.

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktong/features/videos/models/playback_config_model.dart';
import 'package:tiktong/features/videos/repositories/video_playback_config_repo.dart';

class PlaybackConfigViewModel extends Notifier<PlaybackConfigModel> {
  final VideoPlaybackConfigRepository _repository;

  PlaybackConfigViewModel(this._repository);

  void setMuted(bool value) {
    _repository.setMuted(value);
    state = PlaybackConfigModel(muted: value, autoplay: state.autoplay);
  }

  void setAutplay(bool value) {
    _repository.setAutoplay(value);
    state = PlaybackConfigModel(muted: state.muted, autoplay: value);
  }

  @override
  PlaybackConfigModel build() {
    return PlaybackConfigModel(
      muted: _repository.isMuted(),
      autoplay: _repository.isAutoplay(),
    );
  }
}

final playbackConfigProvider =
    NotifierProvider<PlaybackConfigViewModel, PlaybackConfigModel>(
      () => throw UnimplementedError(),
    );
