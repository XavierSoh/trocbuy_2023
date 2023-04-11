import 'package:flutter/material.dart';

import '../../../res/styles.dart';
import 'author.dart';
import 'location_details.dart';

class AuthorAndLocation extends StatelessWidget {
  const AuthorAndLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: Styles.principalColor,
            width: 0.3,
          ),
        ),
        child: Column(
          children: const [
            LocationDetails(),
            Author(),
          ],
        ),
      ),
    );
  }
}
