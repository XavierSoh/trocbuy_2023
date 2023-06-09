import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:provider/provider.dart';
import 'package:trocbuy/model/search_model.dart';
import 'package:trocbuy/providers/search_model_prov.dart';
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
                  await Keywords.setKeyWordList();
                  setState(
                    () {

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
              hideOnError: false,
              hideOnEmpty: false,
              hideOnLoading: false,
              minCharsForSuggestions: 1,
              itemBuilder: (context, String suggestion) {


                return  Item1(
                        controller: controller,
                  suggestion: suggestion,
                      )
                    ;
              },
              onSuggestionSelected: (string) {
                controller.clear();
              },
              noItemsFoundBuilder: (BuildContext context) {
                SearchModel search = SearchModel();

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
                    search.searchText=controller.text;
                    context.read<SearchModelProv>().change(search);

                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      CatSearchResult.id,
                      (route) => route.isFirst,

                    );

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
   Item1(
      {Key? key,
      required this.controller,
     required this.suggestion
      })
      : super(key: key);

  final TextEditingController controller;
final String suggestion;
   SearchModel search = SearchModel();
  @override
  build(BuildContext context) {


    search.suggestion=suggestion;
    search.searchText=controller.text;
    if (suggestion.isNotEmpty) {
      if (suggestion.contains('dans')) {
        String text = suggestion.split('dans').last;
        search.catLang=text;
        search = SearchModel(catLang: text, searchText: controller.text.trim(), suggestion: suggestion);
      }else {
        search = SearchModel( searchText: controller.text.trim());

      }
    }
    return ListTile(
      onTap: () {

        context.read<SearchModelProv>().change(search);
        Navigator.pushNamedAndRemoveUntil(
          context,
          CatSearchResult.id,
            (route)=>route.isFirst

        );
        controller.clear();
      },
      title: Row(
        children: [
          Flexible(
            child: RichText(
              text: TextSpan(
                style: const TextStyle(
                  fontSize: 18.0,
                  color: Colors.black,
                ),
                children: <TextSpan>[
                  TextSpan(text: '${controller.text} dans '),
                  TextSpan(
                    text: search.catLang??search.suggestion,
                    style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Styles.principalColor),
                  ),
                ],
              ),
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


  return InputDecoration(
    enabled: true,
    isDense: true,
    filled: true,
    fillColor: Colors.white,
    hintText: hintText ?? Strings.kWhatDoYouFind,
    hintStyle: const TextStyle(fontWeight: FontWeight.w600),
    suffixIcon: const Icon(Icons.search)
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


