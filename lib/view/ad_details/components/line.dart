import 'package:flutter/material.dart';
import '../../../res/styles.dart';

class Line extends StatelessWidget {
  const Line({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        height: 0.4,
        width: MediaQuery.of(context).size.width,
        color: Styles.principalColor,
      ),
    );
  }
}
