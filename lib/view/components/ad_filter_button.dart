import 'package:flutter/material.dart';
import '../../res/strings.dart';

import '../../res/styles.dart';
import '../filter/filter.dart';

class AdFilterButton extends StatelessWidget {
  const AdFilterButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamedAndRemoveUntil(
            context,
            Filter.id,
            (route) => route.isFirst,
          );
        },
        child: Row(
          children: [
            const Icon(Icons.filter_alt_outlined),
            const SizedBox(width: 5),
            Text(
              Strings.kFilter,
              style: const TextStyle(
                color: Styles.principalColor,
                fontWeight: FontWeight.w600,
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
