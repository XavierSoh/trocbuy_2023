import 'package:flutter/material.dart';

import '../../res/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.text, required this.onPressed})
      : super(key: key);
  final String text;
  final Function() onPressed;
  @override
  build(BuildContext context) {
    return MaterialButton(
      splashColor: Colors.white,
      shape: RoundedRectangleBorder(
        side: const BorderSide(
            color: Styles.principalColor, width: 1, style: BorderStyle.solid),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Styles.principalColor,

        ),
      ),
      onPressed: onPressed,
    );
  }
}
