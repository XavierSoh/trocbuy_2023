import 'package:flutter/material.dart';
import '../../../res/strings.dart';
import '../../../res/styles.dart';

class FavoriteError extends StatelessWidget {
  const FavoriteError({
    Key? key,
  }) : super(key: key);

  @override
  build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 150.0,
        child: Card(
          shadowColor: Styles.principalColor,
          elevation: 20.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Center(
            child: Wrap(
              direction: Axis.horizontal,
              alignment: WrapAlignment.center,
              children: [
                Text(
                  Strings.kFavoritesTextError1,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 16.0, color: Styles.principalColor),
                ),
                const Icon(
                  Icons.favorite_border,
                  color: Styles.principalColor,
                ),
                Text(
                  Strings.kFavoritesTextError2,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16.0),
                ),
                const Icon(
                  Icons.favorite,
                  color: Styles.principalColor,
                ),
                Text(
                  Strings.kFavoritesTextError3,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 16.0, color: Styles.principalColor),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
