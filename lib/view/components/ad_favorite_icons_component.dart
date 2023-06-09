import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:trocbuy/model/ad.dart';

import '../../model/database_helper.dart';
import '../favorite/provider/provider_favorite.dart';

class AdFavoriteIconsComponent extends StatefulWidget {
  final Ad ad;

  AdFavoriteIconsComponent({required this.ad});

  @override
  _AdFavoriteIconsComponentState createState() =>
      _AdFavoriteIconsComponentState();
}

class _AdFavoriteIconsComponentState extends State<AdFavoriteIconsComponent> {
  bool typeButton = false;
  @override
  void initState() {
    checkFavoritePresence();
    super.initState();
  }

  Future checkFavoritePresence() async {
    if (Provider.of<FavoriteFunctions>(context, listen: false)
        .adFavorites
        .isNotEmpty) {
      for (var row in Provider.of<FavoriteFunctions>(context, listen: false)
          .adFavorites) {
        if (widget.ad == row) {
          setState(() {
            typeButton = true;
          });
        }
      }
    } else {
      typeButton = false;
    }
  }

  @override
  build(BuildContext context) {
    return Positioned(
      bottom: -4,
      right: -16,
      child: TextButton(
        child: Icon(
          typeButton ? Icons.favorite : Icons.favorite_border,
          color: Colors.deepOrange,
        ),
        onPressed: () async {
          if (typeButton == false) {
            await Provider.of<FavoriteFunctions>(context, listen: false)
                .setListFavorite(context, widget.ad);

            await DatabaseHelper.instance
                .insert(widget.ad.toJson())
                .then((value) {
              Fluttertoast.showToast(
                msg: "Annonce ajoutée aux favoris",
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                fontSize: 16.0,
              );
            });
          } else {
            await Provider.of<FavoriteFunctions>(context, listen: false)
                .deleteFavorite(context, widget.ad);

            await DatabaseHelper.instance.delete(widget.ad).then((value) {
              Fluttertoast.showToast(
                msg: "Annonce retirée des favoris",
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                fontSize: 16.0,
              );
            });
          }

          setState(() {
            typeButton = !typeButton;
          });
        },
      ),
    );
  }
}
