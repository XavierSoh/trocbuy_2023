import 'package:flutter/material.dart';
import '../../res/strings.dart';
import '../../res/styles.dart';

class ImagePendingText extends StatelessWidget {
  const ImagePendingText({Key? key}) : super(key: key);

  @override
  build(BuildContext context) {
    return Center(
      child: Text(
        Strings.kImagePendingText,
        style: const TextStyle(
          fontSize: 16.0,
        ),
      ),
    );
  }
}
