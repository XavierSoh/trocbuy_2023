import 'package:flutter/material.dart';

import '../../../res/styles.dart';
import 'others_details_title.dart';
import 'view_last_ref.dart';

class OtherDetails extends StatelessWidget {
  const OtherDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 8.0, top: 8.0, right: 8.0, bottom: 0.0),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: Styles.principalColor,
            width: 0.3,
          ),
        ),
        child: Wrap(
          children: const <Widget>[
            OthersDetailsTitle(),
            ViewLastRef(),
          ],
        ),
      ),
    );
  }
}
