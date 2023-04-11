import 'package:flutter/material.dart';

import '../../../res/strings.dart';

class LoadingError extends StatelessWidget {
  const LoadingError({
    Key? key,
  }) : super(key: key);

  @override
  build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(32.0),
      child: Center(
        child: Text(Strings.kLoadingError),
      ),
    );
  }
}
