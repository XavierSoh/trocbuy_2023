import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../res/styles.dart';
import '../functions/ad_details_functions.dart';

import '../../../providers/selected_ad.dart';

class ContactDialogContent extends StatelessWidget {
  const ContactDialogContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentAd = context.read<SelectedAd>().ad;
    return SimpleDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      children: <Widget>[
        SimpleDialogOption(
          onPressed: () {
            Navigator.pop(context);
            AdDetailsFunctions.callNumber(currentAd.phone?.replaceAll(' ', '') ?? "");
          },
          child: ListTile(
            //isThreeLine: true,
            leading: const Icon(
              Icons.call,
              color: Styles.principalColor,
            ),
            title: const Text(
              'Appeler',
              style: TextStyle(
                color: Styles.principalColor,
                fontSize: 16,
              ),
            ),
            subtitle: Text(
              currentAd!.name ?? "",
            ),
          ),
        ),
        SimpleDialogOption(
          onPressed: () {
            Navigator.pop(context);
            AdDetailsFunctions.textAdvertiser(
              currentAd.phone?.replaceAll(' ', '') ?? "",
            );
          },
          child: ListTile(
            //isThreeLine: true,
            leading: const Icon(
              Icons.textsms,
              color: Styles.principalColor,
            ),
            title: const Text(
              'Laisser un SMS',
              style: TextStyle(
                color: Styles.principalColor,
                fontSize: 16,
              ),
            ),
            subtitle: Text(
               currentAd.phone ?? "",
            ),
          ),
        ),
        SimpleDialogOption(
          onPressed: () {
            Navigator.pop(context);
            AdDetailsFunctions.emailAdvertiser(
              currentAd.email ?? "",
              currentAd.title ?? "",
            );
          },
          child: ListTile(
            //isThreeLine: true,
            leading: const Icon(
              Icons.mail,
              color: Styles.principalColor,
            ),
            title: const Text(
              'Envoyer un mail',
              style: TextStyle(
                color: Styles.principalColor,
                fontSize: 16,
              ),
            ),
            subtitle: Text(
              currentAd.email ?? "",
            ),
          ),
        ),
        SimpleDialogOption(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const ListTile(
            //isThreeLine: true
            title: Align(
              alignment: Alignment.bottomRight,
              child: Text(
                'Cancel',
                style: TextStyle(
                  color: Styles.principalColor,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
