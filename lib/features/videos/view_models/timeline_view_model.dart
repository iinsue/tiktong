import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktong/features/videos/models/video_model.dart';
import 'package:tiktong/features/videos/repositories/videos_repo.dart';

class TimelineViewModel extends AsyncNotifier<List<VideoModel>> {
  late final VideosRepository _repository;
  List<VideoModel> _list = [];

  @override
  FutureOr<List<VideoModel>> build() async {
    _repository = ref.read(videosRepo);
    final result = await _repository.fetchVideos();
    final newList = result.docs.map((doc) => VideoModel.fromJson(doc.data()));

    _list = newList.toList(); // 이터러블을 리스트로 전환

    return _list;
  }
}

// AsyncNotifierProvider<expose할 Notifier, 화면에 전달할 데이터>(View Model을 초기화 해줄 function);
final timelineProvider =
    AsyncNotifierProvider<TimelineViewModel, List<VideoModel>>(
      () => TimelineViewModel(),
    );
