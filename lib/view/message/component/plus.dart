import 'package:flutter/material.dart';
import '../../../res/strings.dart';

class Plus extends StatelessWidget {
  final Function()? onpressed;
  const Plus({Key? key, this.onpressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Center(
        child: TextButton(
          child: Text(
            Strings.kPlus,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          onPressed: onpressed,
        ),
      ),
    );
  }
}
