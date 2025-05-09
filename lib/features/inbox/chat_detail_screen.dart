import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktong/constants/gaps.dart';
import 'package:tiktong/constants/sizes.dart';

class ChatDetailScreen extends StatefulWidget {
  const ChatDetailScreen({super.key});

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          contentPadding: EdgeInsets.zero,
          horizontalTitleGap: Sizes.size8,
          leading: Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              const CircleAvatar(
                radius: Sizes.size24,
                foregroundImage: NetworkImage(
                  "https://avatars.githubusercontent.com/u/50567588?v=4",
                ),
              ),
              Positioned(
                bottom: -Sizes.size4,
                right: -Sizes.size4,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.green,
                    border: Border.all(color: Colors.white, width: Sizes.size4),
                  ),
                  width: Sizes.size20,
                  height: Sizes.size20,
                ),
              ),
            ],
          ),
          title: Text("인수", style: TextStyle(fontWeight: FontWeight.w600)),
          subtitle: Text("Active now"),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              FaIcon(
                FontAwesomeIcons.flag,
                color: Colors.black,
                size: Sizes.size20,
              ),
              Gaps.h32,
              FaIcon(
                FontAwesomeIcons.ellipsis,
                color: Colors.black,
                size: Sizes.size20,
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          ListView.separated(
            itemCount: 10,
            separatorBuilder: (context, index) => Gaps.v10,
            padding: EdgeInsets.symmetric(
              horizontal: Sizes.size20,
              vertical: Sizes.size14,
            ),
            itemBuilder: (context, index) {
              final isMine = index % 2 == 0;
              return Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment:
                    isMine ? MainAxisAlignment.end : MainAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(Sizes.size14),
                    decoration: BoxDecoration(
                      color:
                          isMine
                              ? Colors.blue
                              : Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Sizes.size20),
                        topRight: Radius.circular(Sizes.size20),
                        bottomLeft: Radius.circular(
                          isMine ? Sizes.size20 : Sizes.size5,
                        ),
                        bottomRight: Radius.circular(
                          !isMine ? Sizes.size20 : Sizes.size5,
                        ),
                      ),
                    ),
                    child: const Text(
                      "this is a message!",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: Sizes.size16,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          Positioned(
            bottom: 0,
            width: MediaQuery.of(context).size.width,
            child: BottomAppBar(
              color: Colors.grey.shade100,
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: Sizes.size10),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Send a message...",
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(Sizes.size20),
                            borderSide: BorderSide.none,
                          ),
                          suffixIcon: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [FaIcon(FontAwesomeIcons.faceSmile)],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Gaps.h20,
                  Container(
                    padding: EdgeInsets.all(Sizes.size14),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey.shade400,
                    ),
                    child: const FaIcon(
                      FontAwesomeIcons.paperPlane,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
