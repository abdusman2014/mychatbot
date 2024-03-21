import 'package:flutter/material.dart';

class ExternalSigninButton extends StatelessWidget {
  const ExternalSigninButton(
      {super.key,
      required this.imagePath,
      required this.label,
      required this.onPress});
  final String label;
  final String imagePath;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        // height: 50,
        // width: 100,
        padding:const EdgeInsets.all(16),
      //  alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imagePath),
            const SizedBox(
              width: 8,
            ),
            Text(
              label,
              style: const TextStyle(
                fontSize: 16,
              ),
            )
          ],
        ),
      ),
    );
  }
}
