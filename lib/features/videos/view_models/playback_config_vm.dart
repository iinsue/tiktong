// 파일이름의 vm은 view model의 이니셜입니다.

import 'package:flutter/widgets.dart';
import 'package:tiktong/features/videos/models/playback_config_model.dart';
import 'package:tiktong/features/videos/repositories/video_playback_config_repo.dart';

class PlaybackConfigViewModel extends ChangeNotifier {
  final VideoPlaybackConfigRepository _repository;

  late final PlaybackConfigModel _model = PlaybackConfigModel(
    muted: _repository.isMuted(),
    autoplay: _repository.isAutoplay(),
  );

  PlaybackConfigViewModel(this._repository);

  bool get muted => _model.muted;

  bool get autoplay => _model.autoplay;

  void setMuted(bool value) {
    // 기기 저장소에 저장
    _repository.setMuted(value);

    // 데이터 수정
    _model.muted = value;

    notifyListeners();
  }

  void setAutplay(bool value) {
    // 기기 저장소에 저장
    _repository.setAutoplay(value);

    // 데이터 수정
    _model.autoplay = value;

    notifyListeners();
  }
}
