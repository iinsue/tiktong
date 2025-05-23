import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktong/constants/gaps.dart';
import 'package:tiktong/constants/sizes.dart';
import 'package:tiktong/generated/l10n.dart';
import 'package:tiktong/utils.dart';

class VideoComments extends StatefulWidget {
  const VideoComments({super.key});

  @override
  State<VideoComments> createState() => _VideoCommentsState();
}

class _VideoCommentsState extends State<VideoComments> {
  bool _isWriting = false;

  final ScrollController _scrollController = ScrollController();

  void _onClosePressed() {
    Navigator.of(context).pop();
  }

  void _stopWriting() {
    FocusScope.of(context).unfocus();
    setState(() {
      _isWriting = false;
    });
  }

  void _onStartWriting() {
    setState(() {
      _isWriting = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDark = isDarkMode(context);

    return Container(
      height: size.height * 0.7,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Sizes.size14),
      ),
      child: Scaffold(
        backgroundColor: isDark ? null : Colors.grey.shade50,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: isDark ? null : Colors.grey.shade50,
          automaticallyImplyLeading: false,
          title: Text(S.of(context).commentTitle(22796, 22796)),
          actions: [
            IconButton(
              onPressed: _onClosePressed,
              icon: FaIcon(FontAwesomeIcons.xmark),
            ),
          ],
        ),
        body: GestureDetector(
          onTap: _stopWriting,
          child: Stack(
            children: [
              Scrollbar(
                controller: _scrollController,
                child: ListView.separated(
                  controller: _scrollController,
                  padding: const EdgeInsets.only(
                    top: Sizes.size10,
                    left: Sizes.size16,
                    right: Sizes.size16,
                    bottom: Sizes.size96 + Sizes.size20,
                  ),
                  separatorBuilder: (context, index) => Gaps.v20,
                  itemCount: 10,
                  itemBuilder:
                      (context, index) => Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.deepPurple,
                            foregroundColor: Colors.white,
                            child: Text("인수"),
                          ),
                          Gaps.h10,
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "인수",
                                  style: TextStyle(
                                    fontSize: Sizes.size14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey.shade500,
                                  ),
                                ),
                                Gaps.v3,
                                const Text(
                                  "That's not it I've seen the same thing but also in a cave.",
                                ),
                              ],
                            ),
                          ),
                          Gaps.h10,
                          Column(
                            children: [
                              FaIcon(
                                FontAwesomeIcons.heart,
                                size: Sizes.size20,
                                color: Colors.grey.shade500,
                              ),
                              Gaps.v2,
                              Text(
                                "52.2K",
                                style: TextStyle(color: Colors.grey.shade500),
                              ),
                            ],
                          ),
                        ],
                      ),
                ),
              ),
              Positioned(
                bottom: 0,
                width: size.width,
                child: BottomAppBar(
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.deepPurple,
                        foregroundColor: Colors.white,
                        child: const Text("인수"),
                      ),
                      Gaps.h10,
                      Expanded(
                        child: SizedBox(
                          height: Sizes.size44,
                          child: TextField(
                            onTap: _onStartWriting,
                            expands: true,
                            minLines: null,
                            maxLines: null,
                            textInputAction: TextInputAction.newline,
                            decoration: InputDecoration(
                              hintText: "Write a comment...",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  Sizes.size12,
                                ),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor:
                                  isDark
                                      ? Colors.grey.shade800
                                      : Colors.grey.shade200,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: Sizes.size10,
                              ),
                              suffixIcon: Padding(
                                padding: EdgeInsets.only(right: Sizes.size14),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    FaIcon(
                                      FontAwesomeIcons.at,
                                      color:
                                          isDark
                                              ? Colors.grey.shade500
                                              : Colors.grey.shade900,
                                    ),
                                    Gaps.h14,
                                    FaIcon(
                                      FontAwesomeIcons.gift,
                                      color:
                                          isDark
                                              ? Colors.grey.shade500
                                              : Colors.grey.shade900,
                                    ),
                                    Gaps.h14,
                                    FaIcon(
                                      FontAwesomeIcons.faceSmile,
                                      color:
                                          isDark
                                              ? Colors.grey.shade500
                                              : Colors.grey.shade900,
                                    ),
                                    Gaps.h14,
                                    if (_isWriting)
                                      GestureDetector(
                                        onTap: _stopWriting,
                                        child: FaIcon(
                                          FontAwesomeIcons.circleArrowUp,
                                          color:
                                              Theme.of(
                                                context,
                                              ).colorScheme.primary,
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
