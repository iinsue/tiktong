import 'package:flutter/widgets.dart';

class VideoConfig extends ChangeNotifier {
  bool autoMute = false;

  void toggleAuthMute() {
    autoMute = !autoMute;
    notifyListeners();
  }
}

final videoConfig = VideoConfig();
