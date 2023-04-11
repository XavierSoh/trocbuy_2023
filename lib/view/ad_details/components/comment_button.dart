import 'package:flutter/material.dart';
import '../../../res/styles.dart';

import '../../../res/strings.dart';
import '../../comments/comment.dart';

class CommentButton extends StatelessWidget {
  const CommentButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
              side: const BorderSide(
                  color: Styles.principalColor,
                  width: 1,
                  style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(50)),
          foregroundColor: Colors.blueGrey,
        ),
        child: Text(
          Strings.kComments,
          style: const TextStyle(fontSize: 15.0, color: Styles.principalColor),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Comment(),
            ),
          );
        },
      ),
    );
  }
}
