import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktong/features/videos/view_models/timeline_view_model.dart';
import 'package:tiktong/features/videos/views/widgets/video_post.dart';

class VideoTimelineScreen extends ConsumerStatefulWidget {
  const VideoTimelineScreen({super.key});

  @override
  VideoTimelineScreenState createState() => VideoTimelineScreenState();
}

class VideoTimelineScreenState extends ConsumerState<VideoTimelineScreen> {
  int _itemCount = 4;

  final PageController _pageController = PageController();

  final Duration _scrollDuration = const Duration(milliseconds: 250);
  final Curve _scrollCurve = Curves.linear;

  void _onPageChanged(int page) {
    if (page == _itemCount - 1) {
      _pageController.animateToPage(
        page,
        duration: _scrollDuration,
        curve: _scrollCurve,
      );
      _itemCount = _itemCount + 4;

      setState(() {});
    }
  }

  void _onVideoFinished() {
    return;

    // 영상이 끝나면 다음 영상으로 전환
    //_pageController.nextPage(duration: _scrollDuration, curve: _scrollCurve);
  }

  Future<void> _onRefresh() {
    return Future.delayed(Duration(seconds: 5));
  }

  @override
  Widget build(BuildContext context) {
    return ref
        .watch(timelineProvider)
        .when(
          loading: () => Center(child: CircularProgressIndicator()),
          error:
              (error, stackTrace) => Center(
                child: Text(
                  "Could not load videos: $error",
                  style: const TextStyle(color: Colors.white),
                ),
              ),
          data:
              (videos) => RefreshIndicator(
                onRefresh: _onRefresh,
                edgeOffset: 20,
                displacement: 50,
                child: PageView.builder(
                  controller: _pageController,
                  scrollDirection: Axis.vertical,
                  onPageChanged: _onPageChanged,
                  itemCount: videos.length,
                  itemBuilder: (context, index) {
                    final videoData = videos[index];

                    return VideoPost(
                      onVideoFinished: _onVideoFinished,
                      index: index,
                      videoData: videoData,
                    );
                  },
                ),
              ),
        );
  }
}
