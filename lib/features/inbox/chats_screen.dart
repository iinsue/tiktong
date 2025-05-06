import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktong/constants/sizes.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 1,
        shadowColor: Colors.grey.shade500,
        actions: [
          IconButton(onPressed: () {}, icon: FaIcon(FontAwesomeIcons.plus)),
        ],
        title: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("Direct messages")],
        ),
      ),

      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: Sizes.size10),
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.deepPurple,
              radius: 30,
              foregroundImage: NetworkImage(
                "https://avatars.githubusercontent.com/u/50567588?v=4",
              ),
              child: Text("인수", style: TextStyle(color: Colors.white)),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("Nico", style: TextStyle(fontWeight: FontWeight.w600)),
                Text(
                  "2:16 PM",
                  style: TextStyle(
                    fontSize: Sizes.size12,
                    color: Colors.grey.shade500,
                  ),
                ),
              ],
            ),
            subtitle: Text("Don't forget to make video"),
          ),
        ],
      ),
    );
  }
}
