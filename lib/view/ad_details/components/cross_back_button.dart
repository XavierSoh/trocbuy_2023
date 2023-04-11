import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../main.dart';
import '../../../res/styles.dart';

class CrossBackbutton extends StatelessWidget {
  const CrossBackbutton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height * 77 / 100),
      child: SizedBox(
        height: 28,
        width: 28,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const Trocbuy(),
              ),
              (route) => route.isFirst,
            );
          },
          backgroundColor: Styles.principalColor,
          isExtended: false,
          child: const Icon(
            Icons.close,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
