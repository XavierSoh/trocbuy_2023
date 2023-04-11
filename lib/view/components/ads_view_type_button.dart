import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../res/strings.dart';
import '../../res/styles.dart';

import '../../providers/ads_view_type_provider.dart';

class AdsViewTypeButton extends StatelessWidget {
  const AdsViewTypeButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isGrid = context.watch<AdsViewTypeProvider>().isGrid;
    final change = context.read<AdsViewTypeProvider>();
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: TextButton.icon(
        icon: Text(
          Strings.kView,
          style: Styles.googleStyle.copyWith(
            color: Styles.principalColor,
          ),
        ),
        label: Icon(
          isGrid ? Icons.grid_view_outlined : Icons.list_outlined,
          color: Styles.principalColor,
        ),
        onPressed: () => change.changeAdViewType(),
      ),
    );
  }
}
