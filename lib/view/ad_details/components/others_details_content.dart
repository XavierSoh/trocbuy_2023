import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../res/strings.dart';
import '../../../res/styles.dart';

import '../../../providers/selected_ad.dart';
import 'comment_button.dart';
import 'description.dart';

class OthersDetailsContent extends StatelessWidget {
  const OthersDetailsContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentAd = context.read<SelectedAd>().ad;
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
      child: Wrap(direction: Axis.horizontal, children: <Widget>[
        const Description(),

        const CommentButton(),

        const Divider(color: Styles.principalColor),
        Padding(
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
                currentAd!.visitNum.toString(),
                style: const TextStyle(
                  fontSize: 16.0,
                  color: Styles.principalColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),

        //DERNIERE VISITE
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0, left: 8),
          child: Text(
            '${Strings.kLastvisit}:  ${currentAd.lastVisit}',
            style: const TextStyle(
              fontSize: 14.0,
            ),
          ),
        ),

        //REFERENCE
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0, left: 8),
          child: Text(
            '${Strings.kReference}:  ${currentAd.idAd}',
            style: const TextStyle(
              fontSize: 14.0,
            ),
          ),
        )
      ]),
    );
  }
}
