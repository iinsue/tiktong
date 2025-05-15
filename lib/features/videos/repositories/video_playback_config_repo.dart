import 'package:shared_preferences/shared_preferences.dart';

class VideoPlaybackConfigRepository {
  // Key는 똑같은 값으로 읽어와야 합니다.
  static const String _autoplay = "autoplay";
  static const String _muted = "muted";

  final SharedPreferences _preferences;

  VideoPlaybackConfigRepository(this._preferences);

  // 기기 저장소에 음소거 세팅
  Future<void> setMuted(bool value) async {
    _preferences.setBool(_muted, value);
  }

  // 기기 저장소에 자동재생 세팅
  Future<void> setAutoplay(bool value) async {
    _preferences.setBool(_autoplay, value);
  }

  bool isMuted() {
    // 기기 저장소에 없으면 false로 처리
    return _preferences.getBool(_muted) ?? false;
  }

  bool isAutoplay() {
    // 기기 저장소에 없으면 false로 처리
    return _preferences.getBool(_autoplay) ?? false;
  }
}
