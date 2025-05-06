import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktong/constants/gaps.dart';
import 'package:tiktong/constants/sizes.dart';
import 'package:tiktong/features/users/widgets/persistent_tabbar.dart';
import 'package:tiktong/features/users/widgets/user_summary_column.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                centerTitle: true,
                title: Text("인수"),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: FaIcon(FontAwesomeIcons.gear, size: Sizes.size20),
                  ),
                ],
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      foregroundColor: Colors.deepPurple,
                      foregroundImage: NetworkImage(
                        "https://avatars.githubusercontent.com/u/50567588?v=4",
                      ),
                      child: Text("인수", style: TextStyle(color: Colors.white)),
                    ),
                    Gaps.v20,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "@인수",
                          style: TextStyle(
                            fontSize: Sizes.size18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Gaps.h5,
                        FaIcon(
                          FontAwesomeIcons.solidCircleCheck,
                          size: Sizes.size18,
                          color: Colors.blue.shade500,
                        ),
                      ],
                    ),
                    Gaps.v24,
                    SizedBox(
                      height: Sizes.size48,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          UserSummaryColumn(value: "97", title: "Following"),
                          VerticalDivider(
                            width: Sizes.size32,
                            thickness: Sizes.size1,
                            color: Colors.grey.shade500,
                            indent: Sizes.size14,
                            endIndent: Sizes.size14,
                          ),
                          UserSummaryColumn(value: "10M", title: "Followers"),
                          VerticalDivider(
                            width: Sizes.size32,
                            thickness: Sizes.size1,
                            color: Colors.grey.shade500,
                            indent: Sizes.size14,
                            endIndent: Sizes.size14,
                          ),
                          UserSummaryColumn(value: "194.3M", title: "Likes"),
                        ],
                      ),
                    ),
                    Gaps.v14,
                    FractionallySizedBox(
                      widthFactor: 0.33,
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: Sizes.size12),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(Sizes.size4),
                          ),
                        ),
                        child: Text(
                          "Follow",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Gaps.v14,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: Sizes.size32),
                      child: Text(
                        "All hightlights and where to watch live matches on FIFA+",
                      ),
                    ),
                    Gaps.v14,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FaIcon(FontAwesomeIcons.link, size: Sizes.size12),
                        Gaps.h4,
                        Text(
                          "https://nomadcoders.co",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    Gaps.v20,
                  ],
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: PersistentTabbar(),
              ),
            ];
          },
          body: TabBarView(
            children: [
              GridView.builder(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                padding: EdgeInsets.zero,
                itemCount: 20,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  // Column 개수
                  crossAxisCount: 3,

                  // Grid 좌우 간격
                  crossAxisSpacing: Sizes.size2,

                  // Grid 상하 간격
                  mainAxisSpacing: Sizes.size2,

                  // Aspect Ratio
                  childAspectRatio: 9 / 14,
                ),
                itemBuilder:
                    (context, index) => Column(
                      children: [
                        AspectRatio(
                          aspectRatio: 9 / 14,
                          child: FadeInImage.assetNetwork(
                            fit: BoxFit.cover,
                            placeholder: "assets/images/placeholder.jpg",
                            image:
                                "https://images.unsplash.com/photo-1745503262235-611b59926297?q=80&w=1970&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                          ),
                        ),
                      ],
                    ),
              ),
              Center(child: Text("Page Two")),
            ],
          ),
        ),
      ),
    );
  }
}
