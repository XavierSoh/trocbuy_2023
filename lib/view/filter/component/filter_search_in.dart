import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import '../../../res/styles.dart';

import '../filter_providers/search_in_prov.dart';

class FilterSearchIn extends StatelessWidget {
  const FilterSearchIn();

  @override
  Widget build(BuildContext context) {
    final read = context.read<SearchInProv>();

    final watchTitleOnly = context.watch<SearchInProv>().titleOnly;
    final watchUrgenceOnly = context.watch<SearchInProv>().emergencyOnly;
    final watchWithPhoto = context.watch<SearchInProv>().withPhoto;
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ExpansionTile(
              trailing: const Text(''),
              title: Row(
                children: const [
                  Text(
                    "Rechercher dans",
                    style: TextStyle(
                        fontSize: 18,
                        color: Styles.principalColor,
                        fontWeight: FontWeight.w500),
                  ),
                  Icon(Icons.arrow_drop_down)
                ],
              ),
              subtitle: const Text(
                '(Cochez un ou plusieurs) ',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    children: [
                      Checkbox(
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          value: watchTitleOnly,
                          checkColor: Colors.white,
                          activeColor: const Color(0xff5F8B51),
                          // inactiveColor: Colors.blueGrey,
                          // disabledColor: Colors.grey,
                          onChanged: (value) {
                            read.updateTitleOnly(value!);
                          }),
                      const Text(
                        'Uniquement dans le titre',
                        style: TextStyle(fontSize: 17.0),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    children: [
                      Checkbox(
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          value: watchUrgenceOnly,
                          checkColor: Colors.white,
                          activeColor: const Color(0xff5F8B51),
                          //inactiveColor: Colors.blueGrey,
                          // disabledColor: Colors.grey,
                          onChanged: (value) {
                            read.updateUrgenceOnly(value!);
                          }),
                      const Text(
                        'Annonces urgentes',
                        style: TextStyle(fontSize: 17.0),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    children: [
                      Checkbox(
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          value: watchWithPhoto,
                          checkColor: Colors.white,
                          activeColor: const Color(0xff5F8B51),
                          //inactiveColor: Colors.blueGrey,
                          // disabledColor: Colors.grey,
                          onChanged: (value) {
                            read.updateWithPhoto(value!);
                          }),
                      const Text(
                        'Annonces avec photo',
                        style: TextStyle(fontSize: 17.0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
