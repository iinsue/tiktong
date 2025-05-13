import 'package:flutter/widgets.dart';

class VideoConfig extends InheritedWidget {
  const VideoConfig({super.key, required super.child});

  final bool autoMute = false;

  static VideoConfig of(BuildContext context) {
    // VideoConfig라는 타입의 InheritedWidget을 가져오라고 context에 명령
    return context.dependOnInheritedWidgetOfExactType<VideoConfig>()!;
  }

  // 위젯을 rebuild 할지 말지를 정할 수 있게 도와줌
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}
