import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../res/styles.dart';

class AdTitle extends StatelessWidget {
  final String title;
  final Color color;
  const AdTitle({Key? key, required this.title, required this.color})
      : super(key: key);

  @override
  build(BuildContext context) {
    return Card(
      shadowColor: Styles.principalColor,
      elevation: 8.0,
      color: color,
      child: Align(
        alignment: Alignment.topLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 4.0, bottom: 4.0, left: 4.0),
              child: AutoSizeText(
                title,
                style: Styles.googleStyle.copyWith(
                  color: Styles.principalColor,
                ),
              ),
            ),
            Row(
              children: const [
                Icon(Icons.keyboard_arrow_up, color: Styles.principalColor),
                Icon(Icons.keyboard_arrow_down, color: Styles.principalColor),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
