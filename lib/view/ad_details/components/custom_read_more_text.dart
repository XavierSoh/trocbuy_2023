import 'package:flutter/material.dart';

import '../../../res/strings.dart';

class CustomReadMoreText extends StatefulWidget {
  final String text;
  final Color? expandingButtonColor;
  const CustomReadMoreText(this.text, {Key? key, this.expandingButtonColor})
      : super(key: key);

  @override
  _CustomReadMoreTextState createState() => _CustomReadMoreTextState();
}

class _CustomReadMoreTextState extends State<CustomReadMoreText>
    with TickerProviderStateMixin<CustomReadMoreText> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final expandingButtonColor = widget.expandingButtonColor ?? Colors.black;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        AnimatedSize(
          duration: const Duration(milliseconds: 500),
          child: ConstrainedBox(
            constraints: isExpanded
                ? const BoxConstraints()
                : const BoxConstraints(maxHeight: 100.0),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                widget.text,
                softWrap: true,
                overflow: TextOverflow.fade,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: TextButton.icon(
            label: Icon(
              isExpanded ? Icons.expand_less : Icons.expand_more,
              color: expandingButtonColor,
            ),
            icon: Text(
              isExpanded ? Strings.kReadLess : Strings.kReadMore,
              style: TextStyle(color: expandingButtonColor),
            ),
            onPressed: () => setState(
              () => isExpanded = !isExpanded,
            ),
          ),
        )
      ],
    );
  }
}
