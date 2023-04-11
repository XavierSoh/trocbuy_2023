import 'package:flutter/material.dart';

import '../../../res/styles.dart';

class ChatTextWidgtet extends StatelessWidget {
  const ChatTextWidgtet({
    Key? key,
    required this.myTextController,
  }) : super(key: key);

  final TextEditingController myTextController;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 5,
      child: Container(
        height: 65.0,
        padding: const EdgeInsets.symmetric(vertical: 1.0),
        child: TextFormField(
          maxLines: null,
          keyboardType: TextInputType.text,
          controller: myTextController,
          style: const TextStyle(color: Styles.principalColor, fontSize: 14.0),
          decoration: InputDecoration(
            hintText: 'Votre message...',
            hintStyle: const TextStyle(
              color: Styles.principalColor,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: Styles.principalColor, width: 2.0),
              borderRadius: BorderRadius.circular(5.0),
            ),
            border: const OutlineInputBorder(),
          ),
        ),
      ),
    );
  }
}
