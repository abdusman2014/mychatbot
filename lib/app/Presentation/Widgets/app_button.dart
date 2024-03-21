import 'dart:io';

import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton(
      {super.key,
      required this.onPress,
      required this.text,
      this.isSecondaryButton = false});
  final String text;
  final VoidCallback onPress;
  final bool isSecondaryButton;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: Platform.isWindows
            ? MediaQuery.of(context).size.width / 2
            : MediaQuery.of(context).size.width * 3.5 / 4,
        margin: const EdgeInsets.only(top: 4, bottom: 4),
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
            color: isSecondaryButton ? Colors.white : Colors.green,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
                color: isSecondaryButton
                    ? Colors.grey.shade300
                    : Colors.green)),
        child: Center(
            child: Text(
          text,
          style: TextStyle(
              color: isSecondaryButton ? Colors.black : Colors.black,
              fontWeight: FontWeight.w500),
        )),
      ),
    );
  }
}
