import 'package:flutter/material.dart';
import 'package:tiktong/constants/sizes.dart';
import 'package:tiktong/utils.dart';

class FormButton extends StatelessWidget {
  const FormButton({super.key, required this.disabled, this.title = "Next"});

  final bool disabled;
  final String title;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        padding: const EdgeInsets.symmetric(vertical: Sizes.size16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Sizes.size5),
          color:
              disabled
                  ? isDarkMode(context)
                      ? Colors.grey.shade800
                      : Colors.grey.shade300
                  : Theme.of(context).colorScheme.primary,
        ),
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 500),
          style: TextStyle(
            color: disabled ? Colors.grey[400] : Colors.white,
            fontWeight: FontWeight.w600,
          ),
          child: Text(title, textAlign: TextAlign.center),
        ),
      ),
    );
  }
}
