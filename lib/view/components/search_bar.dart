import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:provider/provider.dart';
import '../../model/cat_lang.dart';
import '../../providers/search_icon_provider.dart';
import '../../res/strings.dart';
import '../../res/styles.dart';
import '../category/component/cat_search_results.dart';

import '../../data/key_words_list.dart';
import '../../providers/selected_cat_lang.dart';

/// *
///Edited by Xavier SOH
/// 06/12/2021
class SearchBar extends StatefulWidget {
  const SearchBar({Key? key, this.hintText}) : super(key: key);
  final String? hintText;
  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final TextEditingController controller = TextEditingController();

  @override
  build(BuildContext context) {
    return ChangeNotifierProvider<SearchIconProvider>(
      create: (_) => SearchIconProvider(),
      builder: (context, _) {
        final read = context.read<SearchIconProvider>();
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: PhysicalModel(
            color: Styles.principalColor,
            elevation: 0,
            borderRadius: const BorderRadius.all(
              Radius.circular(25.0),
            ),
            shadowColor: Styles.principalColor,
            child: TypeAheadField<String>(
              textFieldConfiguration: TextFieldConfiguration(
                  controller: controller,
                  enabled: true,
                  onChanged: (m) {
                    if (controller.text.isEmpty) {
                      read.changeState(true);
                    } else {
                      read.changeState(false);
                    }
                  },
                  decoration: buildInputDecoration(context, controller,
                      hintText: widget.hintText ?? "")),
              suggestionsCallback: (typedText) async {
                if (Keywords.keyWordsList.isEmpty) {
                  setState(
                    () async {
                      await Keywords.setKeyWordList();
                    },
                  );
                }
                Keywords.keyWordsList.sort();

                return Keywords.keyWordsList
                    .where(
                      (element) => element.toLowerCase().startsWith(
                            typedText.toLowerCase(),
                          ),
                    )
                    .toSet()
                    .toList();
              },
              hideOnError: true,
              hideOnEmpty: false,
              hideOnLoading: false,
              minCharsForSuggestions: 1,
              itemBuilder: (context, String suggestion) {
                CatLang catLang = CatLang();
                String searchText = suggestion;
                String text2 = "";
                if (suggestion.isNotEmpty) {
                  if (suggestion.contains('dans')) {
                    String text = suggestion.split('dans').last;
                    catLang.nameCatLang = text;
                  }
                }
                return catLang.nameCatLang != null
                    ? Item1(
                        controller: controller,
                        searchText: searchText,
                        catLang: catLang,
                        suggestion: suggestion,
                      )
                    : ListTile(
                        onTap: () {
                          print(searchText);
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            CatSearchResult.id,
                            (route) => route.isFirst,
                            arguments: searchText,
                          );
                          controller.clear();
                        },
                        title: Row(
                          children: [
                            Flexible(
                              child: RichText(
                                maxLines: 2,
                                overflow: TextOverflow.fade,
                                text: TextSpan(
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.black,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: text2,
                                      style:
                                          const TextStyle(color: Colors.black),
                                    ),
                                    TextSpan(
                                      text: suggestion,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: Styles.principalColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
              },
              onSuggestionSelected: (string) {
                controller.clear();
              },
              noItemsFoundBuilder: (BuildContext context) {
                return GestureDetector(
                  child: Card(
                    color: Colors.grey,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        controller.text,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Styles.principalColor,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      CatSearchResult.id,
                      (route) => route.isFirst,
                      arguments: controller.text,
                    );
                    controller.clear();
                  },
                );
              },
              hideSuggestionsOnKeyboardHide: true,
            ),
          ),
        );
      },
    );
  }
}

class Item1 extends StatelessWidget {
  const Item1(
      {Key? key,
      required this.controller,
      required this.searchText,
      required this.catLang,
      required this.suggestion})
      : super(key: key);

  final TextEditingController controller;
  final String searchText;
  final CatLang catLang;
  final String suggestion;

  @override
  build(BuildContext context) {
    return ListTile(
      onTap: () {
        context.read<SelectedCatLang>().changeCatLang(catLang);
        Navigator.pushNamedAndRemoveUntil(
          context,
          CatSearchResult.id,
          (route) => route.isFirst,
          arguments: searchText,
        );
        controller.clear();
      },
      title: Row(
        children: [
          RichText(
            text: TextSpan(
              style: const TextStyle(
                fontSize: 18.0,
                color: Colors.black,
              ),
              children: <TextSpan>[
                TextSpan(text: '${controller.text} dans'),
                TextSpan(
                  text: catLang.nameCatLang,
                  style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Styles.principalColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

InputDecoration buildInputDecoration(
    BuildContext context, TextEditingController controller,
    {String? hintText}) {
  final read = context.read<SearchIconProvider>();
  final watch = context.watch<SearchIconProvider>();

  return InputDecoration(
    enabled: true,
    isDense: true,
    filled: true,
    fillColor: Colors.white,
    hintText: hintText ?? Strings.kWhatDoYouFind,
    hintStyle: const TextStyle(fontWeight: FontWeight.w600),
    suffixIcon: const Icon(Icons.search) /*watch.show
        ?*/
    /*  IconButton(
      color: Styles.principalColor,
      icon: const Icon(Icons.search),
      onPressed: () {
        //read.changeState(false);
        Navigator.pushNamedAndRemoveUntil(
          context,
          CatSearchResult.id,
          (route) => route.isFirst,
          arguments: controller.text,
        );
        controller.clear();
      },
    )*/
    /* : IconButton(
            color: Styles.principalColor,
            icon: const Icon(Icons.close),
            onPressed: () {
              //read.changeState(true);

              controller.clear();
            },
          )*/
    ,
    focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        borderSide: BorderSide.none),
    enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        borderSide: BorderSide.none),
    border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        borderSide: BorderSide.none),
  );
}

// class WhenEmptyBuilder extends StatelessWidget {
//   const WhenEmptyBuilder({
//     Key? key,
//   }) : super(key: key);

//   @override
//   build(BuildContext context) {
//     return Container(
//       width: MediaQuery.of(context).size.width,
//       decoration: BoxDecoration(
//           color: Colors.white, borderRadius: BorderRadius.circular(10)),
//       child: SingleChildScrollView(
//         child: Column(
//           children: CatLang.catsLang
//               .map(
//                 (e) => Container(
//                   padding: const EdgeInsets.symmetric(vertical: 5),
//                   child: InkWell(
//                     borderRadius: BorderRadius.circular(10),
//                     child: Text(
//                       e.nameCatLang!,
//                       style:
//                           const TextStyle(fontSize: 16.0, color: Colors.black),
//                     ),
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) {
//                             return const Text(
//                                 ''); /*AdsSingleCat(
//                               categorie: Category2(name_cat_lang: e),
//                               searchText: e,
//                             )*/
//                           },
//                         ),
//                       );
//                       // MaterialPageRoute(builder: (context) => AdsList()));
//                     },
//                   ),
//                 ),
//               )
//               .toList(),
//         ),
//       ),
//     );
//   }
// }
