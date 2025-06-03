import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktong/features/videos/models/video_model.dart';

class TimelineViewModel extends AsyncNotifier<List<VideoModel>> {
  //List<VideoModel> _list = [VideoModel(title: "First video")];
  List<VideoModel> _list = [];

  void uploadVideo() async {
    // timeline view model을 다시 loading state로 변경
    state = AsyncValue.loading();

    // 2초 딜레이
    await Future.delayed(const Duration(seconds: 2));

    //final newVideo = VideoModel(title: "${DateTime.now()}");
    //_list = [..._list, newVideo];
    _list = [..._list];
    state = AsyncValue.data(_list);
  }

  @override
  FutureOr<List<VideoModel>> build() async {
    // 5초 딜레이
    await Future.delayed(Duration(seconds: 5));

    // 에러출력 테스트
    // throw Exception("OMG cant fetch");

    return _list;
  }
}

// AsyncNotifierProvider<expose할 Notifier, 화면에 전달할 데이터>(View Model을 초기화 해줄 function);
final timelineProvider =
    AsyncNotifierProvider<TimelineViewModel, List<VideoModel>>(
      () => TimelineViewModel(),
    );
