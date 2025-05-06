import 'package:flutter/material.dart';
import 'package:tiktong/constants/gaps.dart';
import 'package:tiktong/constants/sizes.dart';

class UserSummaryColumn extends StatelessWidget {
  final String value;
  final String title;

  const UserSummaryColumn({
    super.key,
    required this.value,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: Sizes.size18),
        ),
        Gaps.v2,
        Text(title, style: TextStyle(color: Colors.grey.shade500)),
      ],
    );
  }
}
