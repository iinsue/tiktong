import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktong/constants/gaps.dart';
import 'package:tiktong/constants/sizes.dart';
import 'package:tiktong/features/users/widgets/user_summary_column.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
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
                Container(
                  decoration: BoxDecoration(
                    border: Border.symmetric(
                      horizontal: BorderSide(
                        color: Colors.grey.shade200,
                        width: 1,
                      ),
                    ),
                  ),
                  child: TabBar(
                    indicatorColor: Colors.black,
                    indicatorSize: TabBarIndicatorSize.label,
                    labelColor: Colors.black,
                    labelPadding: EdgeInsets.symmetric(vertical: Sizes.size10),
                    tabs: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: Sizes.size20),
                        child: Icon(Icons.grid_4x4_rounded),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: Sizes.size20),
                        child: FaIcon(FontAwesomeIcons.heart),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: TabBarView(
                    children: [
                      GridView.builder(
                        keyboardDismissBehavior:
                            ScrollViewKeyboardDismissBehavior.onDrag,
                        padding: const EdgeInsets.all(Sizes.size6),
                        itemCount: 20,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          // Column 개수
                          crossAxisCount: 2,

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
                                    borderRadius: BorderRadius.circular(
                                      Sizes.size4,
                                    ),
                                  ),
                                  child: AspectRatio(
                                    aspectRatio: 9 / 12,
                                    child: FadeInImage.assetNetwork(
                                      fit: BoxFit.cover,
                                      placeholder:
                                          "assets/images/placeholder.jpg",
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
                      Center(child: Text("Page Two")),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
