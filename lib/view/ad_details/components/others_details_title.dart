import 'package:flutter/material.dart';
import '../../../res/strings.dart';

class OthersDetailsTitle extends StatelessWidget {
  const OthersDetailsTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
      child: Text(
        Strings.kDetails,
        textAlign: TextAlign.justify,
        style: const TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
