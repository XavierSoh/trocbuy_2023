import 'package:flutter/material.dart';
import '../../../res/styles.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18.0,
        color: Styles.principalColor,
      ),
    );
  }
}
