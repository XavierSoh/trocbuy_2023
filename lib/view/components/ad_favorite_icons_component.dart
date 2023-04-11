import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../../model/database_helper.dart';
import '../favorite/provider/provider_favorite.dart';

class AdFavoriteIconsComponent extends StatefulWidget {
  final String idAd;

  const AdFavoriteIconsComponent({required this.idAd});

  @override
  _AdFavoriteIconsComponentState createState() => _AdFavoriteIconsComponentState();
}

class _AdFavoriteIconsComponentState extends State<AdFavoriteIconsComponent> {
  bool typeButton = false;

  Future checkFavoitePresence() async {
    if (Provider.of<FavoriteFunctions>(context).adFavorites.isNotEmpty) {
      for (var row in Provider.of<FavoriteFunctions>(context).adFavorites) {
        if (widget.idAd == row) {
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
    checkFavoitePresence();
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
                .setListFavorite(context, widget.idAd);

            int i = await DatabaseHelper.instance.insert({DatabaseHelper.columnName: widget.idAd});
            setState(() {
              typeButton = true;
            });
            Fluttertoast.showToast(
                msg: "Annonce ajoutée aux favoris",
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                fontSize: 16.0);
          } else {
            await Provider.of<FavoriteFunctions>(context, listen: false)
                .deleteFavorite(context, widget.idAd);
            int rowsEffected = await DatabaseHelper.instance.delete(widget.idAd);
            setState(() {
              typeButton = false;
            });
            Fluttertoast.showToast(
              msg: "Annonce ajoutée aux favoris",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              fontSize: 16.0,
            );
          }
        },
      ),
    );
  }
}
