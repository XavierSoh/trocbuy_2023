import 'package:flutter/material.dart';
import '../../../res/styles.dart';

class IconsChatButton extends StatelessWidget {
  final Function()? onpressed;
  final Widget? icon;
  const IconsChatButton({Key? key, this.onpressed, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: Material(
          child: IconButton(
              onPressed: onpressed, icon: icon!, color: Styles.principalColor),
          color: Colors.white),
    );
  }
}
