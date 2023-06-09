/*
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';

class BuildStickers extends StatelessWidget {
  final void Function(Category?, Emoji)? onpressed;

  const BuildStickers({super.key, required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: EmojiPicker(
        config: const Config(
          noRecents: Text(''),
          columns: 7,
          buttonMode: ButtonMode.CUPERTINO,
          initCategory: Category.RECENT,
          showRecentsTab: true,
        ),
        onEmojiSelected: onpressed,
      ),
    );
  }
}
*/
