import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../model/date_helper.dart';
import '../../../providers/selected_ad.dart';

class TitleAndDate extends StatelessWidget {
  const TitleAndDate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentAd = context.read<SelectedAd>().ad;
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 0.0),
      child: Wrap(
        direction: Axis.vertical,
        children: <Widget>[
          SizedBox(
            width: MediaQuery.of(context).size.width * 98 / 100,
            child: Text(
              currentAd!.title ?? "",
              maxLines: 2,
              style:
                  const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            DateHelper(date: currentAd.calendarDate!, hour: currentAd.hour!)
                .getDate(),
            style: const TextStyle(fontSize: 16.0),
          ),
        ],
      ),
    );
  }
}
