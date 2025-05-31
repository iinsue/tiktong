import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class Avatar extends ConsumerWidget {
  final String name;
  const Avatar({super.key, required this.name});

  Future<void> _onAvatarTap() async {
    final xfile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 40, // 100 이 100%로 최대값
      maxHeight: 150,
      maxWidth: 150,
    );

    if (xfile != null) {
      final file = File(xfile.path);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: _onAvatarTap,
      child: CircleAvatar(
        radius: 50,
        foregroundColor: Colors.deepPurple,
        foregroundImage: NetworkImage(
          "https://avatars.githubusercontent.com/u/50567588?v=4",
        ),
        child: Text(name, style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
