import 'package:flutter/material.dart';
import '../arround_me_ads.dart';

import '../../../res/strings.dart';

class LocationDisabledMessage extends StatelessWidget {
  const LocationDisabledMessage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 2,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    Strings.kLocationDisabledText,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  ElevatedButton.icon(
                    label: Text(
                      Strings.kReload,
                    ),
                    onPressed: () {
                      // AroundMeFunctions().setLocationState();
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        AroundMeAds.id,
                        (route) => route.isFirst,
                      );
                    },
                    icon: const Icon(Icons.refresh),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
