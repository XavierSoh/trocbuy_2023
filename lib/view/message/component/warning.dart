import 'package:flutter/material.dart';
import '../../../res/strings.dart';

class Warning extends StatelessWidget {
  const Warning({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow[100],
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          Strings.kWarning,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
