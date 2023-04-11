import 'package:flutter/cupertino.dart';
import '../../../res/styles.dart';

class TitleVotreAnnonce extends StatelessWidget {
  final String title;
  const TitleVotreAnnonce({Key? key, this.title = "Votre annonce"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0.0),
      child: Text(
        title,
        textAlign: TextAlign.center,
      ),
    );
  }
}
