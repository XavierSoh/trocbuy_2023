import 'package:flutter/material.dart';

import '../../../res/strings.dart';
import '../../category/show_categories.dart';
import '../../components/custom_button.dart';
import '../../map/map_screen.dart';

class TopButtons extends StatelessWidget {
  const TopButtons({
    Key? key,
  }) : super(key: key);

  @override
  build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0, left: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomButton(
            text: Strings.kAdvancedResearch,
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, MapScreen.id, (route) => route.isFirst);
            },
          ),
          CustomButton(
            text: Strings.kAllCategories,
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                ShowCategories.id,
                (route) => route.isFirst,
              );
            },
          )
        ],
      ),
    );
  }
}
