import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/selected_ad.dart';
import 'custom_read_more_text.dart';

class Description extends StatelessWidget {
  const Description({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentAd = context.read<SelectedAd>().ad;
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 8.0, 0.0, 16.0),
      child: CustomReadMoreText(
        currentAd!.text ?? "",
        expandingButtonColor: Colors.green,
      ),
    );
  }
}
