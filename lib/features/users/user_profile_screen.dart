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
    return CustomScrollView(
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
            ],
          ),
        ),
      ],
    );
  }
}
