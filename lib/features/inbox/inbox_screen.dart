import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktong/constants/sizes.dart';

class InBoxScreen extends StatelessWidget {
  const InBoxScreen({super.key});

  void _onDmPressed() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        shadowColor: Colors.grey.shade500,
        title: Text('Inbox'),
        actions: [
          IconButton(
            onPressed: _onDmPressed,
            icon: FaIcon(FontAwesomeIcons.paperPlane),
          ),
        ],
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text(
              "Activity",
              style: TextStyle(
                fontSize: Sizes.size16,
                fontWeight: FontWeight.w600,
              ),
            ),
            trailing: FaIcon(
              FontAwesomeIcons.chevronRight,
              size: Sizes.size14,
              color: Colors.black,
            ),
          ),
          Container(height: Sizes.size1, color: Colors.grey.shade300),
          ListTile(
            leading: Container(
              width: Sizes.size52,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
              ),
              child: Center(
                child: FaIcon(FontAwesomeIcons.users, color: Colors.white),
              ),
            ),
            title: Text(
              "New followers",
              style: TextStyle(
                fontSize: Sizes.size16,
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle: Text(
              "Messages from followers will appear here",
              style: TextStyle(fontSize: Sizes.size14),
            ),
            trailing: FaIcon(
              FontAwesomeIcons.chevronRight,
              size: Sizes.size14,
              color: Colors.black,
            ),
          ),
          Container(height: Sizes.size1, color: Colors.grey.shade300),
        ],
      ),
    );
  }
}
