import 'package:flutter/material.dart';
import 'ad_filter_button.dart';
import 'ad_sort_button.dart';
import 'ads_view_type_button.dart';

class AdsTopButtons extends StatelessWidget {
  const AdsTopButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 0.045;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: SizedBox(
        height: height,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const AdSortButton(),
            Row(
              children: const [
                AdsViewTypeButton(),
                AdFilterButton(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
