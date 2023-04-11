import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../providers/selected_ad.dart';
import '../../../res/strings.dart';
import '../../../res/styles.dart';

import 'comment_button.dart';
import 'description.dart';

class ViewLastRef extends StatelessWidget {
  const ViewLastRef({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentAd = context.read<SelectedAd>().ad;
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
      child: Wrap(direction: Axis.horizontal, children: <Widget>[
        const Description(),
        const CommentButton(),
        const Divider(
          color: Styles.principalColor,
        ),
        const ViewsNumber(),
        SimpleText(
          text: '${Strings.kLastvisit}:  ${currentAd?.lastVisit}',
        ),
        SimpleText(
          text: '${Strings.kReference}:  ${currentAd?.idAd}',
        ),
      ]),
    );
  }
}

class ViewsNumber extends StatelessWidget {
  const ViewsNumber({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentAd = context.read<SelectedAd>().ad;
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, left: 8),
      child: Row(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Icon(
              Icons.remove_red_eye,
              color: Styles.principalColor,
              size: 22,
            ),
          ),
          Text(
            " " + currentAd!.visitNum.toString(),
            style: const TextStyle(
              fontSize: 16.0,
              color: Styles.principalColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class SimpleText extends StatelessWidget {
  const SimpleText({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, left: 8),
      child: Text(text,
          style: const TextStyle(
            fontSize: 14.0,
          )),
    );
  }
}
