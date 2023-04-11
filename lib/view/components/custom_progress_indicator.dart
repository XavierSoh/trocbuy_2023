import 'package:flutter/material.dart';
import 'package:progress_indicators/progress_indicators.dart';

class CustomProgressIndicator extends StatelessWidget {
  const CustomProgressIndicator({
    Key? key,
  }) : super(key: key);

  @override
  build(BuildContext context) {
    return Center(
      child: JumpingDotsProgressIndicator(
        fontSize: 40.0,
      ),
    );
  }
}
