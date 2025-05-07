import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktong/constants/breakpoints.dart';
import 'package:tiktong/constants/gaps.dart';
import 'package:tiktong/constants/sizes.dart';

final tabs = ["Top", "Users", "Videos", "Sounds", "LIVE", "Shopping", "Brands"];

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  final TextEditingController _textEditingController = TextEditingController(
    text: "Initial Text",
  );

  // 검색 값이 변경될 때
  void _onSearchChanged(String value) {}

  // 검색 값이 제출될 때
  void _onSearchSubmitted(String value) {}

  // 상단 탭바 누르면 포커스 해제
  void _onTap(int index) {
    FocusScope.of(context).unfocus();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 화면 너비
    final width = MediaQuery.of(context).size.width;

    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 1,
          title: CupertinoSearchTextField(
            controller: _textEditingController,
            onChanged: _onSearchChanged,
            onSubmitted: _onSearchSubmitted,
          ),
          bottom: TabBar(
            // 클릭 애니메이션 제거
            splashFactory: NoSplash.splashFactory,

            // 탭바 정렬
            tabAlignment: TabAlignment.start,

            onTap: _onTap,
            padding: const EdgeInsets.symmetric(horizontal: Sizes.size16),
            isScrollable: true,
            labelStyle: TextStyle(
              fontSize: Sizes.size16,
              fontWeight: FontWeight.w600,
            ),
            indicatorColor: Colors.black,
            unselectedLabelColor: Colors.grey.shade500,
            labelColor: Colors.black,
            tabs: [for (var tab in tabs) Tab(text: tab)],
          ),
        ),
        body: TabBarView(
          children: [
            GridView.builder(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              padding: const EdgeInsets.all(Sizes.size6),
              itemCount: 20,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                // Column 개수
                crossAxisCount: width > Breakpoints.lg ? 5 : 2,

                // Grid 좌우 간격
                crossAxisSpacing: Sizes.size10,

                // Grid 상하 간격
                mainAxisSpacing: Sizes.size10,

                // Aspect Ratio
                childAspectRatio: 9 / 16,
              ),
              itemBuilder:
                  (context, index) => Column(
                    children: [
                      Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Sizes.size4),
                        ),
                        child: AspectRatio(
                          aspectRatio: 9 / 12,
                          child: FadeInImage.assetNetwork(
                            fit: BoxFit.cover,
                            placeholder: "assets/images/placeholder.jpg",
                            image:
                                "https://images.unsplash.com/photo-1745503262235-611b59926297?q=80&w=1970&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                          ),
                        ),
                      ),
                      Gaps.v10,
                      Text(
                        "This is a very long caption for may tiktok that im upload just now currently.",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: Sizes.size16 + Sizes.size2,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Gaps.v8,
                      DefaultTextStyle(
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.bold,
                        ),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 12,
                              backgroundImage: NetworkImage(
                                "https://avatars.githubusercontent.com/u/50567588?v=4",
                              ),
                            ),
                            Gaps.h4,
                            Expanded(
                              child: Text(
                                "My avatar is going to be very long.",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                            Gaps.h4,
                            FaIcon(
                              FontAwesomeIcons.heart,
                              size: Sizes.size14,
                              color: Colors.grey.shade600,
                            ),
                            Gaps.h2,
                            Text("2.5M"),
                          ],
                        ),
                      ),
                    ],
                  ),
            ),
            for (var tab in tabs.skip(1))
              Center(child: Text(tab, style: const TextStyle(fontSize: 28))),
          ],
        ),
      ),
    );
  }
}
