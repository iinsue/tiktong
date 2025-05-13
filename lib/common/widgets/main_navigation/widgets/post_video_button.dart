import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktong/constants/sizes.dart';

class PostVideoButton extends StatelessWidget {
  const PostVideoButton({super.key, required this.inverted});

  final bool inverted;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          right: 20,
          child: Container(
            height: 34,
            width: 26,
            padding: EdgeInsets.symmetric(horizontal: Sizes.size8),
            decoration: BoxDecoration(
              color: const Color(0xff61D4F0),
              borderRadius: BorderRadius.circular(Sizes.size10),
            ),
          ),
        ),

        Positioned(
          left: 20,
          child: Container(
            height: 34,
            width: 26,
            padding: EdgeInsets.symmetric(horizontal: Sizes.size8),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(Sizes.size10),
            ),
          ),
        ),

        Container(
          height: 34,
          padding: EdgeInsets.symmetric(horizontal: Sizes.size12),
          decoration: BoxDecoration(
            color: !inverted ? Colors.white : Colors.black,
            borderRadius: BorderRadius.circular(Sizes.size10),
          ),
          child: Center(
            child: FaIcon(
              FontAwesomeIcons.plus,
              color: !inverted ? Colors.black : Colors.white,
              size: 18,
            ),
          ),
        ),
      ],
    );
  }
}
