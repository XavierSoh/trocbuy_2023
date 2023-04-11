import 'package:flutter/material.dart';
import '../../res/styles.dart';

import '../../res/strings.dart';

class NoDataFoundWidget extends StatelessWidget {
  const NoDataFoundWidget({
    Key? key,this.premium=false
  }) : super(key: key);
final bool premium;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - 250,
      child: Center(
        child: Card(
          shadowColor: Styles.principalColor,
          elevation: 10,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(premium?Strings.kNoDataFoundPremium:
              Strings.kNoDataFound,
            ),
          ),
        ),
      ),
    );
  }
}
