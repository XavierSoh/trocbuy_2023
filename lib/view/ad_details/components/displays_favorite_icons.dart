// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:toast/toast.dart';
// import 'package:trocbuy/global_functions/favorite_functions.dart';
// import 'package:trocbuy/view/favorite/provider/provider_favorite.dart';

// import '../../../constants/constants.dart';
// import '../../../model/adsFavotireMag.dart';
// import '../../../model/database_helper.dart';

// class DisplaysFavoriteIcons extends StatefulWidget {
//   bool typeButton;
//   final String idAd;
//   DisplaysFavoriteIcons({required this.typeButton, required this.idAd});

//   @override
//   _DisplaysFavoriteIconsState createState() => _DisplaysFavoriteIconsState();
// }

// class _DisplaysFavoriteIconsState extends State<DisplaysFavoriteIcons> {
//   //vérifions si l annonce est dans les favoris
//   Future checkFavoitePresence() async {
//     if (Provider.of<FavoriteFunctions>(context).adFavorites.isNotEmpty) {
//       for (var row in adsFavorite) {
//         if (widget.idAd == row) {
//           setState(() {
//             widget.typeButton = true;
//           });
//         }
//       }
//     } else {
//       widget.typeButton = false;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     checkFavoitePresence();
//     return IconButton(
//       padding: EdgeInsets.zero,
//       icon: Icon(
//         widget.typeButton ? Icons.favorite : Icons.favorite_border,
//         color: widget.typeButton ? Colors.deepOrangeAccent : Colors.white,
//       ),
//       onPressed: () async {
//         if (widget.typeButton == false) {
//           await Provider.of<FavoriteFunctions>(context)
//               .setListFavorite(context, widget.idAd);

//           int i = await DatabaseHelper.instance
//               .insert({DatabaseHelper.columnName: '${widget.idAd}'});
//           setState(() {
//             widget.typeButton = true;
//             Toast.show("Annonce ajoutée aux favoris", context,
//                 duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
//           });
//         } else {
//           await Provider.of<FavoriteFunctions>(context)

//               .deleteFavorite(InforamtionUser.info['id_acc'], widget.idAd);
//           int rowsEffected = await DatabaseHelper.instance.delete(widget.idAd);
//           setState(
//             () {
//               widget.typeButton = false;
//               Toast.show("annonce supprimée des favoris", context,
//                   duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
//             },
//           );
//         }
//       },
//     );
//   }
// }
