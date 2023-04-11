import 'package:flutter/material.dart';

import 'around_me_button.dart';
import 'france_button.dart';

class AllFranceAndAroundMe extends StatelessWidget {
  const AllFranceAndAroundMe({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FranceButton(
                withPrincipalColor: false,
              ),
              const AroundMeButton(
                withPrincipalColor: false,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
