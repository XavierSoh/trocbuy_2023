import 'package:flutter/material.dart';
import '../../../res/styles.dart';
import '../../../utils/utils.dart';
import '../../map/map_screen.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({Key? key}) : super(key: key);

  @override
  build(BuildContext context) {
    return FloatingActionButton(
      splashColor: Colors.blueGrey,
      backgroundColor: Styles.principalColor,
      child: Image.asset(Utils.homeMapImagePath, height: 32.0),
      onPressed: () {
        Navigator.pushNamedAndRemoveUntil(
          context,
          MapScreen.id,
          (route) => route.isFirst,
        );
      },
    );
  }
}
