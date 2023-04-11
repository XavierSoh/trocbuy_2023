import 'package:flutter/material.dart';

class AdTitleComponent extends StatelessWidget {
  final String title;
  const AdTitleComponent({Key? key, required this.title}) : super(key: key);

  @override
  build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 2.0, right: 2.0, top: 2.0),
        child: Text(
          title,
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          softWrap: true,
        ),
      ),
    );
  }
}
