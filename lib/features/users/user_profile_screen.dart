import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktong/constants/gaps.dart';
import 'package:tiktong/constants/sizes.dart';
import 'package:tiktong/features/settings/settings_screen.dart';
import 'package:tiktong/features/users/view_models/users_view_model.dart';
import 'package:tiktong/features/users/widgets/avatar.dart';
import 'package:tiktong/features/users/widgets/persistent_tabbar.dart';
import 'package:tiktong/features/users/widgets/user_summary_column.dart';

class UserProfileScreen extends ConsumerStatefulWidget {
  final String username;
  final String tab;

  const UserProfileScreen({
    super.key,
    required this.username,
    required this.tab,
  });

  @override
  ConsumerState<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends ConsumerState<UserProfileScreen> {
  void _onGearPressed() {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => const SettingsScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return ref
        .watch(usersProvider)
        .when(
          error: (error, stackTrace) => Center(child: Text(error.toString())),
          loading: () => Center(child: CircularProgressIndicator.adaptive()),
          data: (data) {
            return SafeArea(
              child: Material(
                child: DefaultTabController(
                  initialIndex: widget.tab == "likes" ? 1 : 0,
                  length: 2,
                  child: NestedScrollView(
                    headerSliverBuilder: (context, innerBoxIsScrolled) {
                      return [
                        SliverAppBar(
                          backgroundColor: Colors.transparent,
                          centerTitle: true,
                          title: Text(data.name),
                          actions: [
                            IconButton(
                              onPressed: _onGearPressed,
                              icon: FaIcon(
                                FontAwesomeIcons.gear,
                                size: Sizes.size20,
                              ),
                            ),
                          ],
                        ),
                        SliverToBoxAdapter(
                          child: Column(
                            children: [
                              Avatar(name: data.name),
                              Gaps.v20,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "@${data.name}",
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
                                    UserSummaryColumn(
                                      value: "97",
                                      title: "Following",
                                    ),
                                    VerticalDivider(
                                      width: Sizes.size32,
                                      thickness: Sizes.size1,
                                      color: Colors.grey.shade500,
                                      indent: Sizes.size14,
                                      endIndent: Sizes.size14,
                                    ),
                                    UserSummaryColumn(
                                      value: "10M",
                                      title: "Followers",
                                    ),
                                    VerticalDivider(
                                      width: Sizes.size32,
                                      thickness: Sizes.size1,
                                      color: Colors.grey.shade500,
                                      indent: Sizes.size14,
                                      endIndent: Sizes.size14,
                                    ),
                                    UserSummaryColumn(
                                      value: "194.3M",
                                      title: "Likes",
                                    ),
                                  ],
                                ),
                              ),
                              Gaps.v14,
                              FractionallySizedBox(
                                widthFactor: 0.6,
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                          vertical: Sizes.size12,
                                        ),
                                        decoration: BoxDecoration(
                                          color:
                                              Theme.of(
                                                context,
                                              ).colorScheme.primary,
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
                                    Gaps.h10,
                                    Container(
                                      width: 48,
                                      height: 48,
                                      padding: EdgeInsets.all(Sizes.size8),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.grey.shade300,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(Sizes.size4),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          FaIcon(FontAwesomeIcons.youtube),
                                        ],
                                      ),
                                    ),
                                    Gaps.h10,
                                    Container(
                                      width: Sizes.size48,
                                      height: Sizes.size48,
                                      padding: EdgeInsets.all(Sizes.size10),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.grey.shade300,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(Sizes.size4),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          FaIcon(
                                            FontAwesomeIcons.caretDown,
                                            size: Sizes.size20,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              Gaps.v14,
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: Sizes.size32,
                                ),
                                child: Text(
                                  "All hightlights and where to watch live matches on FIFA+",
                                ),
                              ),
                              Gaps.v14,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FaIcon(
                                    FontAwesomeIcons.link,
                                    size: Sizes.size12,
                                  ),
                                  Gaps.h4,
                                  Text(
                                    "https://nomadcoders.co",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
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
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
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
                              (context, index) => AspectRatio(
                                aspectRatio: 9 / 14,
                                child: Stack(
                                  children: [
                                    FadeInImage.assetNetwork(
                                      width: double.infinity,
                                      height: double.infinity,
                                      fit: BoxFit.cover,
                                      placeholder:
                                          "assets/images/placeholder.jpg",
                                      image:
                                          "https://images.unsplash.com/photo-1745503262235-611b59926297?q=80&w=1970&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                                    ),
                                    Positioned(
                                      left: 2,
                                      bottom: 4,
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.play_arrow_outlined,
                                            color: Colors.white,
                                            size: Sizes.size24,
                                          ),
                                          Gaps.h3,
                                          Text(
                                            "4.1M",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: Sizes.size16,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                        ),
                        Center(child: Text("Page Two")),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
  }
}
